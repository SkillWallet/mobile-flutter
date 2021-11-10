import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skillwallet/models/badges_model.dart';

part 'badges_state.freezed.dart';

@freezed
abstract class BadgesState with _$BadgesState {
  const factory BadgesState() = Nothing;
  const factory BadgesState.loading() = Loading;
  const factory BadgesState.loaded({required List<BadgesModel?>? badgesList}) =
      BadgesData;
  const factory BadgesState.error() = BadgesError;
}
