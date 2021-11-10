import 'package:freezed_annotation/freezed_annotation.dart';
part 'qr_state.freezed.dart';

@freezed
abstract class QRState with _$QRState {
  const factory QRState() = Nothing;
}
