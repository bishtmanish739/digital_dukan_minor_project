// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTypeAdapter extends TypeAdapter<UserType> {
  @override
  final int typeId = 1;

  @override
  UserType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserType.owner;
      case 1:
        return UserType.customer;
      default:
        return UserType.owner;
    }
  }

  @override
  void write(BinaryWriter writer, UserType obj) {
    switch (obj) {
      case UserType.owner:
        writer.writeByte(0);
        break;
      case UserType.customer:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
