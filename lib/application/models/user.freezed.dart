// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get role => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get accessToken => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get accessTokenExpiresIn => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? role,
      @HiveField(2) String? accessToken,
      @HiveField(3) String? accessTokenExpiresIn,
      @HiveField(4) String? createdAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? role = freezed,
    Object? accessToken = freezed,
    Object? accessTokenExpiresIn = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessTokenExpiresIn: freezed == accessTokenExpiresIn
          ? _value.accessTokenExpiresIn
          : accessTokenExpiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) String? role,
      @HiveField(2) String? accessToken,
      @HiveField(3) String? accessTokenExpiresIn,
      @HiveField(4) String? createdAt});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? role = freezed,
    Object? accessToken = freezed,
    Object? accessTokenExpiresIn = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_User(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessTokenExpiresIn: freezed == accessTokenExpiresIn
          ? _value.accessTokenExpiresIn
          : accessTokenExpiresIn // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'UserAdapter')
@JsonSerializable(checked: true, anyMap: true, explicitToJson: true)
class _$_User implements _User {
  _$_User(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.role,
      @HiveField(2) required this.accessToken,
      @HiveField(3) required this.accessTokenExpiresIn,
      @HiveField(4) required this.createdAt});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  final String? role;
  @override
  @HiveField(2)
  final String? accessToken;
  @override
  @HiveField(3)
  final String? accessTokenExpiresIn;
  @override
  @HiveField(4)
  final String? createdAt;

  @override
  String toString() {
    return 'User(name: $name, role: $role, accessToken: $accessToken, accessTokenExpiresIn: $accessTokenExpiresIn, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.accessTokenExpiresIn, accessTokenExpiresIn) ||
                other.accessTokenExpiresIn == accessTokenExpiresIn) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, role, accessToken, accessTokenExpiresIn, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {@HiveField(0) required final String? name,
      @HiveField(1) required final String? role,
      @HiveField(2) required final String? accessToken,
      @HiveField(3) required final String? accessTokenExpiresIn,
      @HiveField(4) required final String? createdAt}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  String? get role;
  @override
  @HiveField(2)
  String? get accessToken;
  @override
  @HiveField(3)
  String? get accessTokenExpiresIn;
  @override
  @HiveField(4)
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
