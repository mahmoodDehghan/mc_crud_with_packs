// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerDTOAdapter extends TypeAdapter<CustomerDTO> {
  @override
  final int typeId = 2;

  @override
  CustomerDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerDTO(
      id: fields[0] as int,
      person: fields[1] as PersonDTO,
      email: fields[3] as String,
      phoneNumber: fields[2] as String,
      bankAccountNumber: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerDTO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.person)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.bankAccountNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
