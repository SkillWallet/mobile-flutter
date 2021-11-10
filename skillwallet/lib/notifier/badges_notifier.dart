import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillwallet/models/badges_model.dart';
import 'package:skillwallet/restapi/badges_restapi.dart';
import 'package:skillwallet/states/badges_state.dart';

class BadgesNotifier extends StateNotifier<BadgesState> {
  final IBadgesClientRepository _iBadgesClientRepository;

  BadgesNotifier({required IBadgesClientRepository iBadgesClientRepository})
      : _iBadgesClientRepository = iBadgesClientRepository,
        super(const BadgesState());

  Future<void> getBadges(tokenID) async {
    try {
      state = const BadgesState.loading();

      List<BadgesModel?>? badgesList =
          await _iBadgesClientRepository.getBadges(tokenID);

      state = BadgesState.loaded(badgesList: badgesList);
      //return badgesModel;
    } catch (e) {
      state = const BadgesState.error();
      //return null;
    }
  }
}
