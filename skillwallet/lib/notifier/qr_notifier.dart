import 'dart:async';
import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:convert/convert.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:r_crypto/r_crypto.dart';
import 'package:skillwallet/locator.dart';
import 'package:skillwallet/models/qr_model.dart';
import 'package:skillwallet/restapi/qr_restapi.dart';
import 'package:skillwallet/services/LocalStorageService.dart';
import 'package:skillwallet/states/qr_state.dart';
import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class QRNotifier extends StateNotifier<QRState> {
  final IQRClientRepository _iqrClientRepository;
  Timer? timer = null;

  QRNotifier({required IQRClientRepository iqrClientRepository})
      : _iqrClientRepository = iqrClientRepository,
        super(const QRState());

  Future<QrModel> scanQR() async {
    ScanResult barcodeScanRes = await BarcodeScanner.scan();
    QrModel qrModel = QrModel.fromJson(json.decode(barcodeScanRes.rawContent));
    return qrModel;
  }

  Future<bool> setupWallet(QrModel qrModel, ProgressDialog pd) async {
    if (qrModel != null) {
      var ec = getP256();
      var priv = ec.generatePrivateKey();
      var pub = priv.publicKey;
      PrivateKey.fromHex(ec, "12321321");
      var messageHash =
          hex.encode(rHash.hashString(HashType.SHA256, "${qrModel.nonce}"));
      var hash = List<int>.generate(messageHash.length ~/ 2,
          (i) => int.parse(messageHash.substring(i * 2, i * 2 + 2), radix: 16));
      var sig = signature(priv, hash);
      var keccak =
          hex.encode(rHash.hashString(HashType.KECCAK_256, pub.toHex()));

      // print("Private: ${priv.toHex()}");
      // print("Public: ${pub.toHex()}");
      // print("Signature: ${sig.toString()}");
      // print("KECCAK:$keccak");

      var pubKeyResult =
          await _iqrClientRepository.addPubKey(pub.toHex(), qrModel.tokenId);
      pd.update(value: 40);
      var signatureResult = await _iqrClientRepository.signatureActivate(
          sig.toString(), qrModel.tokenId);
      pd.update(value: 60);

      if (pubKeyResult && signatureResult) {
        print("pubkey and signature are correct!");
        if (timer == null) {
          //wait for the account to become active
          timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
            bool isAccountActive =
                await _iqrClientRepository.isActive(qrModel.tokenId);
            print("isActive: $isAccountActive");
            if (isAccountActive) timer?.cancel();
          });
          //wait for blockchain to validate the account
          while (timer!.isActive) {
            await Future.delayed(const Duration(milliseconds: 300));
          }

          locator<LocalStorageService>().setPrivateKey = priv.toHex();
          locator<LocalStorageService>().setTokenID =
              qrModel.tokenId.toString();

          pd.update(value: 100);
          return true;
        }
      }

      //something went wrong
      return false;
    }
    //something went wrong
    return false;
  }
}
