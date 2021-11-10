import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/models/skill_wallet_profile_model.dart';
import 'package:skillwallet/provider.dart';

class ProfileQRPage extends StatelessWidget {
  String tokenID;
  String repScore;
  SkillWalletProfileModel? profileData;

  ProfileQRPage(
      {Key? key,
      required this.tokenID,
      required this.repScore,
      this.profileData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.white, width: 2.0),
          ),
          child: Image.network(
            profileData!.imageUrl!,
            width: 86.0,
            height: 86.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(profileData!.nickname!,
            style: Common.textStyle.copyWith(color: Colors.white)),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 237.0,
          child: Column(
            children: [
              QrImage(
                data: "{'tokenID': $tokenID}",
                version: QrVersions.auto,
                foregroundColor: Colors.white,
                // size: 237.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Rep Score",
                      style: Common.textStyle.copyWith(fontSize: 20.0)),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Image.asset(
                    "assets/images/bxs-badge-check.png",
                    width: 30.0,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(repScore,
                      style: Common.textStyle.copyWith(fontSize: 20.0)),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text("Scan QR Code to verify this NFT ID.",
              style: Common.textStyle.copyWith(fontSize: 16.0)),
        ),
      ],
    );
  }
}
