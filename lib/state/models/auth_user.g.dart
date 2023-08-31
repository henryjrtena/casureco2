// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthUser _$$_AuthUserFromJson(Map<String, dynamic> json) => _$_AuthUser(
      displayName: json['displayName'] as String? ?? null,
      email: json['email'] as String? ?? null,
      photoUrl: json['photoUrl'] as String? ?? null,
    );

Map<String, dynamic> _$$_AuthUserToJson(_$_AuthUser instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
    };
