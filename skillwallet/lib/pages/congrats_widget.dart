import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillwallet/locator.dart';
import 'package:skillwallet/pages/skillwallet_profile_page.dart';
import 'package:skillwallet/provider.dart';
import 'package:skillwallet/services/NavigationService.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class CongratsWidget extends StatelessWidget {
  String tokenID;

  CongratsWidget({Key? key, required this.tokenID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          width: double.infinity,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  width: 120.0,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Text("Congrats, you’ve joined\na new community\n🎉🎉🎉",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                        fontSize: 28.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 50.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 3,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Text("Click below to see\nyour NFT ID!",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                        fontSize: 28.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: 52.0,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.white,
                          )),
                      onPressed: () async {
                        locator<NavigationService>()
                            .navigateReplacement(MaterialPageRoute(
                                builder: (_) => SkillWalletProfile(
                                      tokenID: tokenID,
                                    )));
                      },
                      child: Text("START HERE",
                          style: GoogleFonts.josefinSans(
                              fontSize: 14.0, color: Colors.black)),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
