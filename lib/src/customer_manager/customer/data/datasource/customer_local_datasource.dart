import 'package:formz/formz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud/mc_crud.dart';
import 'package:mc_crud/src/customer_manager/customer/data/dto/customer_dto.dart';
import 'package:mc_crud/src/customer_manager/customer/data/dto/person_dto.dart';

class CustomerLocalDataSource {
  Box<CustomerDTO>? _customerBox;

  Future<void> checkInitiation() async {
    if (!Hive.isAdapterRegistered(PersonDTOAdapter().typeId)) {
      Hive.registerAdapter(PersonDTOAdapter());
    }
    if (!Hive.isAdapterRegistered(CustomerDTOAdapter().typeId)) {
      Hive.registerAdapter(CustomerDTOAdapter());
    }
    _customerBox = _customerBox ??
        await Hive.openBox<CustomerDTO>(
          DefaultConsts.customerBoxName,
        );
  }

  GeneralResult<CustomerDTO> checkPersonExists(CustomerDTO customer) {
    if (_customerBox!.values
        .where((c) => c.person.toLower() == customer.person.toLower())
        .isNotEmpty) {
      return GeneralResult.failedResult<CustomerDTO>(
          "person with these details already registered!");
    }
    return GeneralResult.successResult(customer);
  }

  GeneralResult<CustomerDTO> checkEmailUnity(CustomerDTO customer) {
    if (_customerBox!.values
        .any((element) => element.email == customer.email)) {
      return GeneralResult.failedResult<CustomerDTO>(
          "this email already registered!");
    }
    return GeneralResult.successResult(customer);
  }

  GeneralResult<bool> checkUpdatePersonExists(CustomerDTO customer) {
    final others = _customerBox!.values
        .where((element) => element.id != customer.id)
        .toList();
    if (others.any((c) => c.person == customer.person)) {
      return GeneralResult.failedResult<bool>(
          "person with these details already registered!");
    }
    return GeneralResult.successResult(true);
  }

  GeneralResult<bool> checkUpdateEmailUnity(CustomerDTO customer) {
    final others = _customerBox!.values
        .where((element) => element.id != customer.id)
        .toList();

    if (others.any((c) => c.email == customer.email)) {
      return GeneralResult.failedResult<bool>("this email already registered!");
    }
    return GeneralResult.successResult(true);
  }

  GeneralResult<bool> checkEntriesValidations(CustomerDTO customer) {
    BankAccountInput bankAccountInput =
        BankAccountInput.dirty(customer.bankAccountNumber);
    EmailInput emailInput = EmailInput.dirty(customer.email);
    FirstNameInput firstNameInput =
        FirstNameInput.dirty(customer.person.firstName);
    LastNameInput lastNameInput = LastNameInput.dirty(customer.person.lastName);
    MobileNumberInput mobileNumberInput =
        MobileNumberInput.dirty('+${customer.phoneNumber.toString()}');
    BirthDateInput birthDate = BirthDateInput.dirty(BirthDate(
            birthDate: DateTime(customer.person.birthYear!,
                customer.person.birthMonth!, customer.person.birthDay!))
        .birthDateString);
    final status = Formz.validate([
      bankAccountInput,
      emailInput,
      firstNameInput,
      lastNameInput,
      mobileNumberInput,
      birthDate,
    ]);
    if (status.isInvalid) {
      return GeneralResult.failedResult<bool>("entry format is invalid!");
    }
    return GeneralResult.successResult(true);
  }

  Future<GeneralResult<CustomerDTO>> createCustomer(
      Map<String, dynamic> entry) async {
    await checkInitiation();
    final newCustomer = CustomerDTO.fromJson(entry);
    final validationCheck = checkEntriesValidations(newCustomer);
    if ((validationCheck.errorMessage ?? '').isNotEmpty) {
      return GeneralResult.failedResult<CustomerDTO>(
          validationCheck.errorMessage.toString());
    }
    try {
      final res = checkPersonExists(newCustomer);
      if ((res.errorMessage ?? '').isNotEmpty) {
        return res;
      }
      final emailCheck = checkEmailUnity(newCustomer);
      if ((emailCheck.errorMessage ?? '').isNotEmpty) {
        return emailCheck;
      } else {
        await _customerBox!.put(newCustomer.id, newCustomer.toLower());
        final res = GeneralResult.successResult<CustomerDTO>(newCustomer);
        return res;
      }
    } catch (e) {
      return GeneralResult.failedResult<CustomerDTO>(e.toString());
    }
  }

  Future<GeneralResult<bool>> deleteCustomer(int id) async {
    await checkInitiation();
    if (_customerBox!.keys.contains(id)) {
      try {
        await _customerBox!.delete(id);
        return GeneralResult.successResult<bool>(true);
      } catch (e) {
        return GeneralResult.failedResult<bool>(e.toString());
      }
    } else {
      return GeneralResult.failedResult<bool>(DefaultConsts.notFound);
    }
  }

  Future<GeneralResult<List<CustomerDTO>>> getAllCustomers() async {
    await checkInitiation();
    try {
      return GeneralResult.successResult<List<CustomerDTO>>(
        _customerBox!.values.toList(),
      );
    } catch (e) {
      return GeneralResult.failedResult<List<CustomerDTO>>(e.toString());
    }
  }

  Future<GeneralResult<CustomerDTO>> getCustomer(int id) async {
    await checkInitiation();
    try {
      if (_customerBox!.keys.contains(id)) {
        return GeneralResult.successResult<CustomerDTO>(_customerBox!.get(id)!);
      } else {
        return GeneralResult.failedResult<CustomerDTO>(DefaultConsts.notFound);
      }
    } catch (e) {
      return GeneralResult.failedResult<CustomerDTO>(e.toString());
    }
  }

  Future<GeneralResult<bool>> updateCustomer(
      int id, Map<String, dynamic> entry) async {
    await checkInitiation();
    try {
      if (_customerBox!.keys.contains(id)) {
        final updatedCustomer = CustomerDTO.fromJson(entry);
        final validationCheck = checkEntriesValidations(updatedCustomer);
        if ((validationCheck.errorMessage ?? '').isNotEmpty) {
          return GeneralResult.failedResult<bool>(
              validationCheck.errorMessage.toString());
        }
        final personCheck = checkUpdatePersonExists(updatedCustomer);
        if ((personCheck.errorMessage ?? '').isNotEmpty) {
          return personCheck;
        }
        final emailCheck = checkUpdateEmailUnity(updatedCustomer);
        if ((emailCheck.errorMessage ?? '').isNotEmpty) {
          return emailCheck;
        }
        await _customerBox!.put(id, updatedCustomer);
        return GeneralResult.successResult<bool>(true);
      } else {
        return GeneralResult.failedResult<bool>(DefaultConsts.notFound);
      }
    } catch (e) {
      return GeneralResult.failedResult<bool>(e.toString());
    }
  }
}
