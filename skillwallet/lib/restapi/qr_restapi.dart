import 'package:dio/dio.dart';
import 'package:skillwallet/models/add_pubkey_model.dart';
import 'package:skillwallet/models/is_active_model.dart';
import 'package:skillwallet/models/signature_model.dart';

abstract class IQRClientRepository {
  Future<bool> addPubKey(pubKey, tokenID);
  Future<bool> signatureActivate(signature, tokenID);
  Future<bool> isActive(tokenID);
}

class QRRestAPI implements IQRClientRepository {
  Dio? _dio;

  QRRestAPI() {
    _dio = Dio();
  }

  @override
  Future<bool> addPubKey(pubKey, tokenID) async {
    AddPubkeyModel addPubkeyModel = AddPubkeyModel();
    addPubkeyModel.pubKey = pubKey;

    Response response = await _dio!.post(
        "https://api.skillwallet.id/api/skillwallet/$tokenID/pubKey",
        data: addPubkeyModel.toJson());

    if (response.statusCode! >= 200) {
      return true;
    }

    return false;
  }

  @override
  Future<bool> isActive(tokenID) async {
    Response response = await _dio!
        .get("https://api.skillwallet.id/api/skillwallet/$tokenID/isActive");
    IsActiveModel isActiveModel = IsActiveModel.fromJson(response.data);
    return isActiveModel.isActive!;
  }

  @override
  Future<bool> signatureActivate(signature, tokenID) async {
    SignatureModel signatureModel = SignatureModel();
    signatureModel.signature = signature;

    Response response = await _dio!.post(
        "https://api.skillwallet.id/api/skillwallet/$tokenID/activate",
        data: signatureModel.toJson());

    if (response.statusCode! >= 200) {
      return true;
    }

    return false;
  }
}
