import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillwallet/models/skill_wallet_profile_model.dart';
import 'package:skillwallet/restapi/skillwallet_restapi.dart';
import 'package:skillwallet/states/profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ISkillWalletClientRepository _iSkillWalletClientRepository;

  ProfileNotifier(
      {required ISkillWalletClientRepository iSkillWalletClientRepository})
      : _iSkillWalletClientRepository = iSkillWalletClientRepository,
        super(const ProfileState());

  Future<SkillWalletProfileModel?> getUserProfile(tokenID) async {
    try {
      state = const ProfileState.loading();
      var profileData =
          await _iSkillWalletClientRepository.fetchProfileData(tokenID);

      state = ProfileState.loaded(skillWalletProfileModel: profileData);
      return profileData;
    } catch (e) {
      state = const ProfileState.error();
      return null;
    }
  }
}
