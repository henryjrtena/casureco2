import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:casureco/handler/api_manager.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:casureco/main.dart';
import 'package:casureco/state/app_state.dart';

class SaveAuthUserAction extends ReduxAction<AppState> {
  SaveAuthUserAction({required this.appUserInfo});

  final AppUserInfo appUserInfo;

  @override
  AppState reduce() => state.copyWith(appUserInfo: appUserInfo);
}

class SaveNewAppUserInfoAction extends ReduxAction<AppState> {
  SaveNewAppUserInfoAction({required this.appUserInfo});

  final AppUserInfo appUserInfo;

  @override
  Future<AppState> reduce() async {
    await getIt<ApiManager>().addUser(appUserInfo);

    return state.copyWith(appUserInfo: appUserInfo);
  }
}
