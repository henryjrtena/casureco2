import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/state/models/auth_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(null) AuthUser? authUser,
    @Default(<Feeder>[]) List<Feeder> feeders,
    @Default(null) Feeder? selectedFeeder,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
