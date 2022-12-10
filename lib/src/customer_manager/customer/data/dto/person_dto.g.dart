// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonDTOAdapter extends TypeAdapter<PersonDTO> {
  @override
  final int typeId = 1;

  @override
  PersonDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonDTO(
      id: fields[0] as int,
      birthDay: fields[6] as int?,
      birthMonth: fields[5] as int?,
      birthYear: fields[4] as int?,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonDTO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.birthYear)
      ..writeByte(5)
      ..write(obj.birthMonth)
      ..writeByte(6)
      ..write(obj.birthDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
