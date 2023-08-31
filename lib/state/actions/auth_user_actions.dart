import 'package:async_redux/async_redux.dart';
import 'package:casureco/state/app_state.dart';
import 'package:casureco/state/models/auth_user.dart';

class SaveAuthUserAction extends ReduxAction<AppState> {
  SaveAuthUserAction({required this.authUser});

  final AuthUser authUser;

  @override
  AppState reduce() => state.copyWith(authUser: authUser);
}
