import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

part 'customer_form_event.dart';
part 'customer_form_state.dart';

class CustomerFormBloc extends Bloc<CustomerFormEvent, CustomerFormState> {
  CustomerFormBloc() : super(const CustomerFormState()) {
    on<SetFormInProgress>(_setFormInProgress);
    on<SetInitState>(_onSetInitState);
    on<CustomerCreateSubmitted>(_onCustomerCreateSubmitted);
    on<CustomerUpdateSubmitted>(_onCustomerUpdateSubmitted);
    on<CustomerDeleteConfirmed>(_onCustomerDeleteConfirmed);
    on<SetCustomer>(_onSetCustomer);
  }

  void _onSetInitState(SetInitState event, Emitter<CustomerFormState> emit) {
    emit(
      state.copyWith(
        status: CustomerFormStatus.init,
      ),
    );
  }

  void _setFormInProgress(
      SetFormInProgress event, Emitter<CustomerFormState> emit) {
    emit(
      state.copyWith(
        status: CustomerFormStatus.pending,
      ),
    );
  }

  void _onSetCustomer(
      SetCustomer event, Emitter<CustomerFormState> emit) async {
    final id = int.tryParse(event.id);
    if (id == null) {
      final allReq =
          await GetAllCustomerUseCaseImpl(CustomerLocalRespositoryImpl())
              .getCustomersList();
      final rightId = allReq.result!.isEmpty ? 1 : allReq.result!.last.id + 1;
      emit(
        state.copyWith(
          customer: Customer.id(rightId),
          status: CustomerFormStatus.init,
        ),
      );
    } else {
      final customerReq =
          await GetCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
              .getCustomer(id);
      if ((customerReq.errorMessage ?? '').isEmpty) {
        emit(
          state.copyWith(
            customer: customerReq.result,
            status: CustomerFormStatus.fieldInit,
            isUpdate: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            customer: Customer.id(id),
            status: CustomerFormStatus.init,
          ),
        );
      }
    }
  }

  Future<void> _onCustomerCreateSubmitted(
      CustomerCreateSubmitted event, Emitter<CustomerFormState> emit) async {
    if (event.entryStatus) {
      final createReq = await CreateCustomerUsecaseImpl(
        CustomerLocalRespositoryImpl(),
      ).createCustomer(event.entry);
      if ((createReq.errorMessage ?? '').isNotEmpty) {
        emit(
          state.copyWith(
            status: CustomerFormStatus.failed,
            formMessage: createReq.errorMessage,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: CustomerFormStatus.success,
            formMessage: 'Customer saved!',
            customer: createReq.result,
            isUpdate: true,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          status: CustomerFormStatus.failed,
          formMessage: event.errMessage,
        ),
      );
    }
  }

  Future<void> _onCustomerDeleteConfirmed(
      CustomerDeleteConfirmed event, Emitter<CustomerFormState> emit) async {
    final isRightId = await isIdRight(event.id, emit);
    if (isRightId) {
      final id = int.parse(event.id);
      final delReq = await DeleteCustomerUsecaseImpl(
        CustomerLocalRespositoryImpl(),
      ).deleteCustomer(id);
      if (delReq.result ?? false) {
        emit(state.copyWith(
          status: CustomerFormStatus.success,
          formMessage: 'Customer removed!',
          customer: Customer.defaultCustomer(),
        ));
      } else {
        emit(
          state.copyWith(
            status: CustomerFormStatus.failed,
            formMessage: delReq.errorMessage,
          ),
        );
      }
    }
  }

  Future<bool> isIdRight(String id, Emitter<CustomerFormState> emit) async {
    final key = int.tryParse(id);
    if (key == null) {
      emit(
        state.copyWith(
          status: CustomerFormStatus.failed,
          formMessage: 'Wrong Costomer Id!',
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> _onCustomerUpdateSubmitted(
      CustomerUpdateSubmitted event, Emitter<CustomerFormState> emit) async {
    final isRightId = await isIdRight(event.id, emit);
    if (isRightId) {
      if (event.entryStatus) {
        final id = int.parse(event.id);
        final updateReq = await UpdateCustomerUsecaseImpl(
          CustomerLocalRespositoryImpl(),
        ).updateCustomer(id, event.entry);
        final err = updateReq.result ?? false;
        if (!err) {
          emit(state.copyWith(
            status: CustomerFormStatus.failed,
            formMessage: updateReq.errorMessage,
          ));
        } else {
          emit(
            state.copyWith(
              status: CustomerFormStatus.success,
              formMessage: 'Customer updated!',
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            status: CustomerFormStatus.failed,
            formMessage: event.errMessage,
          ),
        );
      }
    }
  }
}
