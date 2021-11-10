import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillwallet/helpers/Common.dart';
import 'package:skillwallet/helpers/error_screen.dart';
import 'package:skillwallet/helpers/loading_screen.dart';
import 'package:skillwallet/locator.dart';
import 'package:skillwallet/models/current_community.dart';
import 'package:skillwallet/models/past_community.dart';
import 'package:skillwallet/models/skill_wallet_profile_model.dart';
import 'package:skillwallet/pages/badges_showcase.dart';
import 'package:skillwallet/pages/community_rewards.dart';
import 'package:skillwallet/pages/member_dashboard.dart';
import 'package:skillwallet/pages/profile_qr_page.dart';
import 'package:skillwallet/provider.dart';
import 'package:skillwallet/services/NavigationService.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:skillwallet/states/profile_state.dart';

class SkillWalletProfile extends StatefulWidget {
  String tokenID;

  SkillWalletProfile({Key? key, this.tokenID = "0"}) : super(key: key);

  @override
  _SkillWalletProfileState createState() => _SkillWalletProfileState();
}

class _SkillWalletProfileState extends State<SkillWalletProfile> {
  int selectedIndex = 0;
  bool inited = false;
  SkillWalletProfileModel? profileData;

  String getActionBarText() {
    if (selectedIndex == 0) {
      return "SkillWallet";
    }

    // if (selectedIndex == 1) {
    //   return "Badges Showcase";
    // }

    if (selectedIndex == 1) {
      return "Your NFT ID";
    }

    if (selectedIndex == 2) {
      return "Community Rewards";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    if (!inited) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        context
            .read(profileNotfierProvider.notifier)
            .getUserProfile(widget.tokenID)
            .then((value) {
          profileData = value;
          inited = true;
          setState(() {});
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      bottomNavigationBar: SizedBox(
        height: 60.0,
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/ios-home.png",
                    width: 28.0,
                    color: selectedIndex == 0
                        ? const Color(0xFF149CC4)
                        : Colors.black),
                label: 'Home',
              ),
              // BottomNavigationBarItem(
              //   icon: Image.asset("assets/images/badge.png",
              //       width: 21.0,
              //       color: selectedIndex == 1
              //           ? const Color(0xFF149CC4)
              //           : Colors.black),
              //   label: 'Badges',
              // ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/qr.png",
                    width: 28.0,
                    color: selectedIndex == 1
                        ? const Color(0xFF149CC4)
                        : Colors.black),
                label: 'QR',
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/coins-stack.png",
                    width: 28.0,
                    color: selectedIndex == 2
                        ? const Color(0xFF149CC4)
                        : Colors.black),
                label: 'Rewards',
              ),
            ],
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            currentIndex: selectedIndex),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(getActionBarText(),
            style:
                GoogleFonts.josefinSans(color: Colors.white, fontSize: 24.0)),
      ),
      body: profileData == null
          ? const Center(child: CircularProgressIndicator())
          : IndexedStack(
              index: selectedIndex,
              children: [
                const HomePage(),
                // BadgesShowCase(tokenID: profileData!.tokenId!),
                ProfileQRPage(
                    tokenID: profileData!.tokenId!,
                    repScore: profileData!.repScore!.toString(),
                    profileData: profileData),
                CommunityRewards(
                  credits: profileData!.repScore.toString(),
                  tokenID: profileData!.tokenId!,
                )
              ],
            ),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(profileNotfierProvider);

    return state.when(() => const SizedBox.shrink(),
        loading: () => const LoadingScreen(),
        loaded: (data) {
          return SkillWalletProfileWidget(skillWalletProfileModel: data!);
        },
        error: () => const ErrorScreen());
  }
}

class SkillWalletProfileWidget extends StatelessWidget {
  SkillWalletProfileModel skillWalletProfileModel;

  SkillWalletProfileWidget({Key? key, required this.skillWalletProfileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ProfileWidget(skillWalletProfileModel: skillWalletProfileModel),
        ProfileCommunities(skillWalletProfileModel: skillWalletProfileModel),
        CommitmentLevelWidget(skillWalletProfileModel: skillWalletProfileModel),
      ],
    );
  }
}

class CommitmentLevelWidget extends StatelessWidget {
  SkillWalletProfileModel skillWalletProfileModel;

  CommitmentLevelWidget({Key? key, required this.skillWalletProfileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 16.0),
            child: Text("Commitment Level",
                style: Common.textStyle.copyWith(fontSize: 17.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
            child: Container(
              // width: 369,
              height: 143,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2.0),
                color: Colors.black,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var current in skillWalletProfileModel.skills!)
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(current.name!,
                              style: Common.textStyle.copyWith(fontSize: 16.0)),
                          Spacer(),
                          Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(right: 16.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                  ),
                                  width: 159.0,
                                  height: 15.0,
                                  child: LinearProgressIndicator(
                                      backgroundColor: Colors.black,
                                      value: (current.value! * 10) / 100,
                                      color: Colors.white)),
                              Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text("${current.value! * 10}%",
                                        style: Common.textStyle.copyWith(
                                            fontSize: 11.0,
                                            color: (current.value! * 10) < 55
                                                ? Colors.white
                                                : Colors.black))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ]);
  }
}

class ProfileWidget extends StatelessWidget {
  SkillWalletProfileModel skillWalletProfileModel;
  ProfileWidget({Key? key, required this.skillWalletProfileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //user image
                Row(
                  children: [
                    Container(
                      foregroundDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: Image.network(
                        skillWalletProfileModel.imageUrl!,
                        width: 86.0,
                        height: 86.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                //user name
                Text(skillWalletProfileModel.nickname!,
                    style: Common.textStyle.copyWith(fontSize: 22.0)),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text("Rep Score",
                    style: Common.textStyle.copyWith(fontSize: 22.0)),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    Image.asset("assets/images/bxs-badge-check.png",
                        width: 30.0),
                    const SizedBox(width: 10.0),
                    Text(skillWalletProfileModel.repScore.toString(),
                        style: Common.textStyle.copyWith(fontSize: 20.0)),
                  ],
                ),
              ],
            ),
          ),
        ]);
  }
}

class ProfileCommunities extends StatelessWidget {
  SkillWalletProfileModel skillWalletProfileModel;
  ProfileCommunities({Key? key, required this.skillWalletProfileModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 8.0),
            child: Text("Your Communities",
                style: Common.textStyle.copyWith(fontSize: 17.0)),
          ),
          SizedBox(
            height: 16.0,
          ),
          for (var current in skillWalletProfileModel.currentCommunities!)
            ActiveDito(
                currentCommunity: current,
                tokenID: skillWalletProfileModel.tokenId!),
          // for (var past in skillWalletProfileModel.pastCommunities!)
          //   PastDito(pastCommunity: past),
        ]);
  }
}

class PastDito extends StatelessWidget {
  PastCommunity pastCommunity;
  PastDito({required this.pastCommunity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
      child: Container(
        height: 59.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.0,
            ),
            Text(pastCommunity.name!,
                style: Common.textStyle
                    .copyWith(fontSize: 14.0, color: Colors.black)),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("PAST",
                    style: Common.textStyle
                        .copyWith(fontSize: 14.0, color: Colors.black)),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveDito extends StatelessWidget {
  CurrentCommunity currentCommunity;
  String tokenID;
  ActiveDito({Key? key, required this.currentCommunity, required this.tokenID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
      child: Container(
        height: 67.0,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white),
        ),
        child: InkWell(
          onTap: () {
            locator<NavigationService>().navigatePush(MaterialPageRoute(
                builder: (_) => MemberDashboard(
                    currentCommunity: currentCommunity, tokenID: tokenID)));
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.0,
              ),
              Text(currentCommunity.name!,
                  style: Common.textStyle.copyWith(fontSize: 14.0)),
              Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ACTIVE",
                      style: Common.textStyle.copyWith(fontSize: 14.0)),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
