import 'package:flutter/material.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/locator.dart';
import 'package:skillwallet/models/interaction_result.dart';
import 'package:skillwallet/pages/carousel_page.dart';
import 'package:skillwallet/restapi/interaction_restapi.dart';
import 'package:skillwallet/services/NavigationService.dart';

class CommunityRewards extends StatelessWidget {
  String credits;
  String tokenID;
  late Future<List<InteractionResult?>?> future;

  CommunityRewards({Key? key, required this.credits, required this.tokenID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    future = InteractionRestAPI().getInteractions(tokenID);

    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 30.0,
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/bxs-badge-check.png",
                  color: Colors.white, width: 41.0),
              const SizedBox(
                width: 10.0,
              ),
              Text(credits, style: Common.textStyle.copyWith(fontSize: 20.0)),
            ]),
        const SizedBox(
          height: 10.0,
        ),
        Center(
            child: Text("Rep Score",
                style: Common.textStyle.copyWith(fontSize: 22.0))),
        FutureBuilder<List<InteractionResult?>?>(
            builder: (context, AsyncSnapshot<List<InteractionResult?>?> items) {
              if (items.hasData) {
                return Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        for (InteractionResult? interactionResult
                            in items.data!)
                          for (var i = 0; i < interactionResult!.amount!; i++)
                            GestureDetector(
                              onTap: () {
                                locator<NavigationService>().navigatePush(
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            CarouselPage(data: items.data!)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  child: Image.network(
                                      interactionResult.image!
                                          .toString()
                                          .trim(),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )
                      ]),
                );
              }

              return const SizedBox.shrink();
            },
            future: future),
        const SizedBox(
          height: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Profit-Sharing” (Coming Soon)",
                  style: Common.textStyle.copyWith(fontSize: 16.0)),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Profit-Sharing is the most important step for truly autonomous communities.\n\nSkillWallets power a Profit-Sharing Network - where all DAOs are able to allocate value, distributing it to participants fairly, based on everyone’s contribution. \n\nWith your NFT ID, you will receive a share of profit any time any of the communities in the network makes a new Distribution.",
                    style: Common.textStyle.copyWith(fontSize: 14.0)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
