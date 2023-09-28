import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(false) bool isLoggedIn,
    @Default(null) AppUserInfo? appUserInfo,
    @Default(<Feeder>[]) List<Feeder> feeders,
    @Default(null) Feeder? selectedFeeder,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
