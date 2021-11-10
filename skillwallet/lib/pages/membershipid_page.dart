import 'package:flutter/material.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/helpers/loading_screen.dart';
import 'package:skillwallet/models/membership_id_model.dart';
import 'package:skillwallet/restapi/membershipid_restapi.dart';

class MemberShipIDPage extends StatelessWidget {
  String tokenID, address;

  MemberShipIDPage({Key? key, required this.tokenID, required this.address})
      : super(key: key);

  Widget _generateText(title, subtitle) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title, style: Common.textStyle.copyWith(fontSize: 14.0)),
          const SizedBox(
            height: 5.0,
          ),
          Text(subtitle, style: Common.textStyle.copyWith(fontSize: 14.0)),
          const SizedBox(
            height: 10.0,
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Membership ID",
            style: Common.textStyle.copyWith(fontSize: 18.0)),
      ),
      body: FutureBuilder(
          future: MembershipIDClient().getMembershipData(address),
          builder: (context, AsyncSnapshot<MembershipIdModel?> data) {
            if (data.hasData) {
              return ListView(
                shrinkWrap: true,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.asset("assets/images/MemberShipCardID.png",
                            width: 364.0, height: 586.0),
                      ),
                      Positioned(
                        bottom: height * 0.15,
                        left: width * 0.1,
                        right: 0,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(data.data!.communityName!,
                                  style: Common.textStyle
                                      .copyWith(fontSize: 28.0)),
                              const SizedBox(
                                height: 50.0,
                              ),
                              Text(
                                  "Pioneer #${data.data!.membershipNumber.toString().padLeft(3, '0')}",
                                  style: Common.textStyle)
                            ]),
                      ),
                      Positioned(
                          right: width * 0.1,
                          bottom: height * 0.04,
                          child: Image.asset(
                            "assets/images/member_logo.png",
                            width: 133.0,
                          )),
                      Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child:
                              Image.network(data.data!.logoImage.toString())),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("“Pioneer” Membership Card",
                            style: Common.textStyle.copyWith(fontSize: 18.0)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        _generateText(
                            "ABOUT (“Pioneers” Campaign):", data.data!.about),
                        _generateText("DESCRIPTION (Community):",
                            data.data!.description.toString()),
                        _generateText(
                            "COMMUNITY:", data.data!.communityName.toString()),
                        _generateText("OWNER:", data.data!.owner),
                        _generateText("MEMBERSHIP ID:",
                            "#${data.data!.membershipNumber.toString().padLeft(3, '0')}"),
                        _generateText("DATE:", data.data!.date),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const LoadingScreen();
            }
          }),
    );
  }
}
