// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<_$_User> {
  @override
  final int typeId = 1;

  @override
  _$_User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_User(
      name: fields[0] as String?,
      role: fields[1] as String?,
      accessToken: fields[2] as String?,
      accessTokenExpiresIn: fields[3] as String?,
      createdAt: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.accessToken)
      ..writeByte(3)
      ..write(obj.accessTokenExpiresIn)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map json) => $checkedCreate(
      r'_$_User',
      json,
      ($checkedConvert) {
        final val = _$_User(
          name: $checkedConvert('name', (v) => v as String?),
          role: $checkedConvert('role', (v) => v as String?),
          accessToken: $checkedConvert('accessToken', (v) => v as String?),
          accessTokenExpiresIn:
              $checkedConvert('accessTokenExpiresIn', (v) => v as String?),
          createdAt: $checkedConvert('createdAt', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'accessToken': instance.accessToken,
      'accessTokenExpiresIn': instance.accessTokenExpiresIn,
      'createdAt': instance.createdAt,
    };
