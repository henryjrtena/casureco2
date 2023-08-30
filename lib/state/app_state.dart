import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default('test') String test,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}