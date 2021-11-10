import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/helpers/error_screen.dart';
import 'package:skillwallet/helpers/loading_screen.dart';
import 'package:skillwallet/models/badge.dart';
import 'package:skillwallet/models/badges_model.dart';
import 'package:skillwallet/provider.dart';
import 'package:skillwallet/states/badges_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BadgesShowCase extends HookWidget {
  String tokenID;

  BadgesShowCase({Key? key, required this.tokenID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(badgesNotfierProvider);

    if (state == const BadgesState()) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        context.read(badgesNotfierProvider.notifier).getBadges(tokenID);
      });
    }

    return state.when(() => const SizedBox.shrink(),
        loading: () => const LoadingScreen(),
        loaded: (data) {
          return BasgesListWidget(badgesList: data!);
        },
        error: () => const ErrorScreen());
  }
}

class BasgesListWidget extends StatelessWidget {
  List<BadgesModel?>? badgesList;
  BasgesListWidget({Key? key, required this.badgesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (BadgesModel? badge in badgesList!)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Community ${badge!.communityName}",
                    style: Common.textStyle),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 77.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (Badge? badge in badge.badges!)
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            width: 77.0,
                            height: 77.0,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: Center(
                                child: Image.network(
                                    badge!.image!.toString().trim())),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
