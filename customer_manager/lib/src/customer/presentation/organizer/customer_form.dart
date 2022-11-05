import 'package:bank_account_picker/bank_account_picker.dart';
import 'package:birth_date_picker/birth_date_picker.dart';
import 'package:customer_manager/customer_manager.dart';
import 'package:customer_manager/src/customer/bloc/customer_form/customer_form_bloc.dart';
import 'package:customer_manager/src/customer/bloc/customer_show/customer_show_bloc.dart';
import 'package:email_picker/email_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullname_picker/fullname_picker.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:phone_number_picker/phone_number_picker.dart';

class CustomerForm extends StatelessWidget {
  CustomerForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  Widget _divider() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _getProperwidget(BuildContext context, CustomerFormState state) {
    if (state.isInPending) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.isFieldsInit) {
      context.read<EmailBloc>().add(
            EmailChanged(
              email: Email(
                emailString: state.customer!.email,
              ),
            ),
          );
      context.read<FullNameBloc>().add(
            FirstNameChanged(
              firstName: state.customer!.person.firstName,
            ),
          );
      context.read<FullNameBloc>().add(
            LastNameChanged(
              lastName: state.customer!.person.lastName,
            ),
          );
      context.read<BirthDatePickerBloc>().add(
            BirthDateChanged(
              birthDate: BirthDate.fromString(state.customer!.person.birthDate),
            ),
          );
      context.read<PhoneNumberBloc>().add(
            PhoneNumberChanged(
              phoneNumber: PhoneNumber.parse(state.customer!.phone),
            ),
          );
      context.read<BankAccountBloc>().add(
            BankAccountChanged(
              account: BankAccount(
                accountNumber: state.customer!.bankAccountNumber,
              ),
            ),
          );
      context.read<CustomerFormBloc>().add(SetInitState());
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final isCreate = !state.isUpdate;
      final label = isCreate ? "create" : "update";
      return Form(
          key: _formKey,
          child: ListView(
            key: const ValueKey('Customerform'),
            children: [
              _divider(),
              const FullNameFields(
                hasBloc: true,
              ),
              _divider(),
              const EmailInputWidget(
                hasBloc: true,
              ),
              _divider(),
              const BirthDateContainer(
                key: ValueKey("keyDissmisser"),
                hasBloc: true,
              ),
              _divider(),
              const PhoneNumberWidget(
                hasBloc: true,
              ),
              _divider(),
              const BankAccountWidget(
                hasBloc: true,
              ),
              _divider(),
              if (state.isFailed)
                Text(
                  key: const ValueKey('error_message'),
                  state.formMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.redAccent,
                      ),
                ),
              if (state.isDoneRight)
                Text(
                  key: const ValueKey('done_message'),
                  state.formMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.green,
                      ),
                ),
              _divider(),
              Center(
                child: ElevatedButton(
                  key: const ValueKey("customer_save"),
                  onPressed: () {
                    final id =
                        context.read<CustomerFormBloc>().state.customer!.id;
                    final fullNameState = context.read<FullNameBloc>().state;
                    final birthDateState =
                        context.read<BirthDatePickerBloc>().state;
                    final emailState = context.read<EmailBloc>().state;
                    final phoneState = context.read<PhoneNumberBloc>().state;
                    final bankAccountState =
                        context.read<BankAccountBloc>().state;
                    final Map<String, dynamic> entry = {
                      JSONKeys.idKey: id,
                      JSONKeys.personKey: {
                        JSONKeys.idKey: id,
                        JSONKeys.personFirstNameKey:
                            fullNameState.firstName.value,
                        JSONKeys.personLastNameKey:
                            fullNameState.lastName.value,
                        JSONKeys.personBirthDateKey:
                            birthDateState.date.birthDateString,
                      },
                      JSONKeys.emailKey: emailState.email.value,
                      JSONKeys.phoneKey: phoneState.phoneNumber.international,
                      JSONKeys.bankAccountKey: bankAccountState.account.value,
                    };
                    final entryStatus = phoneState.status &&
                        fullNameState.isValid &&
                        emailState.isValid &&
                        bankAccountState.isValid &&
                        birthDateState.dateChanged;
                    final message = entryStatus
                        ? ''
                        : !birthDateState.dateChanged
                            ? 'Please change Birth Date!'
                            : 'Please fill the form carefully!';
                    context.read<CustomerFormBloc>().add(SetFormInProgress());
                    context.read<CustomerFormBloc>().add(
                          isCreate
                              ? CustomerCreateSubmitted(
                                  entry: entry,
                                  entryStatus: entryStatus,
                                  errMessage: message,
                                )
                              : CustomerUpdateSubmitted(
                                  id: state.customer!.id.toString(),
                                  entry: entry,
                                  entryStatus: entryStatus,
                                  errMessage: message,
                                ),
                        );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      label,
                    ),
                  ),
                ),
              ),
            ],
          )
          // CustomScrollView(
          //   slivers: [
          //     SliverList(
          //       delegate: SliverChildListDelegate(
          //         [

          //         ],
          //       ),
          //     )
          //   ],
          // ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerFormBloc, CustomerFormState>(
      listener: (context, state) {
        context.read<CustomerShowBloc>().add(
              SetInProgress(),
            );
        context.read<CustomerShowBloc>().add(
              LoadCustomersList(),
            );
      },
      listenWhen: (previous, current) {
        return (previous.status == CustomerFormStatus.pending) &&
            (current.status == CustomerFormStatus.success);
      },
      builder: (context, state) {
        return _getProperwidget(context, state);
      },
    );
  }
}
