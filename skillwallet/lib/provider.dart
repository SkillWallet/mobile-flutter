import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillwallet/notifier/badges_notifier.dart';
import 'package:skillwallet/notifier/profile_notifier.dart';
import 'package:skillwallet/notifier/qr_notifier.dart';
import 'package:skillwallet/restapi/badges_restapi.dart';
import 'package:skillwallet/restapi/qr_restapi.dart';
import 'package:skillwallet/restapi/skillwallet_restapi.dart';
import 'package:skillwallet/states/badges_state.dart';
import 'package:skillwallet/states/profile_state.dart';
import 'package:skillwallet/states/qr_state.dart';

final skillwalletClientRepositoryProvider =
    Provider<ISkillWalletClientRepository>((ref) => SkillWalletClient());
final skillwalletQRClientRespositoryProvider =
    Provider<IQRClientRepository>((ref) => QRRestAPI());
final badgesRestClientRespositoryProvider =
    Provider<IBadgesClientRepository>((ref) => BadgesRestAPI());

final qrNotfierProvider = StateNotifierProvider<QRNotifier, QRState>(
  (ref) => QRNotifier(
      iqrClientRepository: ref.watch(skillwalletQRClientRespositoryProvider)),
);
final profileNotfierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(
      iSkillWalletClientRepository:
          ref.watch(skillwalletClientRepositoryProvider)),
);
final badgesNotfierProvider =
    StateNotifierProvider<BadgesNotifier, BadgesState>(
  (ref) => BadgesNotifier(
      iBadgesClientRepository: ref.watch(badgesRestClientRespositoryProvider)),
);
