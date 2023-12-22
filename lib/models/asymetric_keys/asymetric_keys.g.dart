// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asymetric_keys.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AsymetricKeysAdapter extends TypeAdapter<AsymetricKeys> {
  @override
  final int typeId = 7;

  @override
  AsymetricKeys read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AsymetricKeys(
      keyPair: fields[0] as AsymmetricKeyPair<PublicKey, PrivateKey>,
    );
  }

  @override
  void write(BinaryWriter writer, AsymetricKeys obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.keyPair);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AsymetricKeysAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
