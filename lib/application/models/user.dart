// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @HiveType(typeId: 1, adapterName: 'UserAdapter')
  @JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
  factory User({
    @HiveField(0) required String? name,
    @HiveField(1) required String? role,
    @HiveField(2) required String? accessToken,
    @HiveField(3) required String? accessTokenExpiresIn,
    @HiveField(4) required String? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
