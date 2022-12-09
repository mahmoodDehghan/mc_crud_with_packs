import 'package:mc_crud/mc_crud.dart';

class CustomerMapper implements Mapper<CustomerDTO, Customer> {
  @override
  Customer map(CustomerDTO input) {
    return Customer(
      id: input.id,
      email: input.email,
      bankAccountNumber: input.bankAccountNumber,
      person: PersonMapper().map(input.person),
      phone: input.phoneNumber,
    );
  }

  @override
  CustomerDTO reverse(Customer input) {
    return CustomerDTO(
      id: input.id,
      person: PersonMapper().reverse(input.person),
      email: input.email,
      phoneNumber: input.phone,
      bankAccountNumber: input.bankAccountNumber,
    );
  }
}
