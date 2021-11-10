import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skillwallet/models/skill_wallet_profile_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState() = Nothing;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.loaded(
          {required SkillWalletProfileModel? skillWalletProfileModel}) =
      ProfileData;
  const factory ProfileState.error() = ProfileError;
}
