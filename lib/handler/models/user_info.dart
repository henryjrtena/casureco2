import 'package:casureco/utilities/constant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class AppUserInfo with _$AppUserInfo {
  const factory AppUserInfo({
    @Default(emptyString) String? displayName,
    @Default(emptyString) String? userId,
    @Default(emptyString) String? email,
    @Default(emptyString) String? photoUrl,
    @Default(<String>[]) List<String>? subscribeTo,
    @Default(emptyString) String? fcmToken,
    @Default(emptyString) String? oneSignalId,
    @Default(<Notification>[]) List<Notification>? notifications,
  }) = _AppUserInfo;

  factory AppUserInfo.fromJson(Map<String, dynamic> json) => _$AppUserInfoFromJson(json);
}

@freezed
class Notification with _$Notification {
  const factory Notification({
    @Default(defaultZero) int? id,
    @Default(emptyString) String? dateCreated,
    @Default(emptyString) String? details,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}
