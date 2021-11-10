import 'package:flutter/material.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/locator.dart';
import 'package:skillwallet/models/current_community.dart';
import 'package:skillwallet/pages/events_page.dart';
import 'package:skillwallet/pages/membershipid_page.dart';
import 'package:skillwallet/services/NavigationService.dart';

class MemberDashboard extends StatelessWidget {
  CurrentCommunity currentCommunity;
  String tokenID;

  MemberDashboard(
      {Key? key, required this.currentCommunity, required this.tokenID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Community Dashboard",
          style: Common.textStyle,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/dito.png", width: 95.0),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(currentCommunity.name!,
                          style: Common.textStyle.copyWith(fontSize: 20.0)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(currentCommunity.description!,
                      style: Common.textStyle.copyWith(fontSize: 14.0)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Common.generateButton("Membership ID", callback: () {
                    locator<NavigationService>().navigatePush(MaterialPageRoute(
                        builder: (_) => MemberShipIDPage(
                              tokenID: tokenID,
                              address: currentCommunity.address!,
                            )));
                  }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Common.generateButton("Community Actions", callback: () {
                    locator<NavigationService>().navigatePush(MaterialPageRoute(
                        builder: (_) => EventsPage(
                              tokenID: tokenID,
                            )));
                  }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Common.generateButton("Messages\n(Coming Soon)",
                      callback: () {}, inActive: true),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Your Community Score",
                  style: Common.textStyle.copyWith(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 71.0,
                  height: 71.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    color: Colors.black,
                  ),
                  child: Center(
                      child: Text(
                    currentCommunity.comScore.toString(),
                    style: Common.textStyle.copyWith(fontSize: 22.0),
                  )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Looking healthy!",
                  style: Common.textStyle.copyWith(fontSize: 17.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
