import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillwallet/locator.dart';
import 'package:skillwallet/pages/congrats_widget.dart';
import 'package:skillwallet/pages/skillwallet_profile_page.dart';
import 'package:skillwallet/provider.dart';
import 'package:skillwallet/services/NavigationService.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class QRWidget extends StatelessWidget {
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
              mainAxisAlignment: MainAxisAlignment.start,
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
                Text("Welcome to your\nSkillWallet 🙌🏻",
                    maxLines: 2,
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
                Text(
                    "Scan the QR-Code\non your Community page\nto claim your NFT ID",
                    maxLines: 3,
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
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          side: const BorderSide(
                            width: 1.0,
                            color: Colors.white,
                          )),
                      onPressed: () async {
                        ProgressDialog pd = ProgressDialog(context: context);

                        context
                            .read(qrNotfierProvider.notifier)
                            .scanQR()
                            .then((qrCodeData) {
                          // print(qrCodeData);
                          pd.show(max: 100, msg: "Finalizing Login");
                          pd.update(value: 20);
                          context
                              .read(qrNotfierProvider.notifier)
                              .setupWallet(qrCodeData, pd)
                              .then((value) {
                            pd.close();
                            locator<NavigationService>()
                                .navigateReplacement(MaterialPageRoute(
                                    builder: (_) => CongratsWidget(
                                          tokenID: qrCodeData.tokenId!,
                                        )));
                          });
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Scan QR-Code",
                              style: GoogleFonts.josefinSans(
                                fontSize: 24.0,
                                decoration: TextDecoration.underline,
                              )),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Image.asset(
                            "assets/images/scan.png",
                            width: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t have a Community yet?\nVisit ',
                              style: GoogleFonts.josefinSans(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                            TextSpan(
                              text: 'app.distributed.town',
                              style: GoogleFonts.josefinSans(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launch('https://app.distributed.town');
                                },
                            ),
                            TextSpan(
                              text: ' to Join one!',
                              style: GoogleFonts.josefinSans(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
