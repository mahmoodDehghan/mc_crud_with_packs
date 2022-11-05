import 'package:customer_manager/customer_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_show_event.dart';
part 'customer_show_state.dart';

class CustomerShowBloc extends Bloc<CustomerShowEvent, CustomerShowState> {
  CustomerShowBloc() : super(const CustomerShowState()) {
    on<CurrentCustomerChanged>(_onCurrentCustomerChanged);
    on<CustomersListChanged>(_onCustomerListChanged);
    on<LoadCustomersList>(_onLoadCustomersList);
    on<SetInProgress>(_onSetInProgress);
    on<LookForCustomer>(_onLookForCustomer);
    on<SetNeedToRefresh>(_onSetNeedToRefresh);
  }

  void _onSetNeedToRefresh(
      SetNeedToRefresh event, Emitter<CustomerShowState> emit) {
    emit(
      state.copyWith(
        needToRefresh: true,
      ),
    );
  }

  void _onLookForCustomer(
      LookForCustomer event, Emitter<CustomerShowState> emit) async {
    final id = int.tryParse(event.id);
    if (id == null) {
      emit(
        state.copyWith(
          allCustomers: state.allCustomers,
          status: CustomerShowStatus.fail,
          currentCustomer: state.currentCustomer,
          showMessage: 'Wrong Costomer Id!',
        ),
      );
    } else {
      final customerReq =
          await GetCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
              .getCustomer(id);
      final errMessage = customerReq.errorMessage ?? '';
      if (errMessage.isNotEmpty) {
        emit(
          state.copyWith(
            allCustomers: state.allCustomers,
            status: CustomerShowStatus.fail,
            currentCustomer: state.currentCustomer,
            showMessage: errMessage,
          ),
        );
      } else {
        emit(
          state.copyWith(
            allCustomers: state.allCustomers,
            status: CustomerShowStatus.success,
            currentCustomer: customerReq.result,
            showMessage: errMessage,
          ),
        );
      }
    }
  }

  void _onSetInProgress(SetInProgress event, Emitter<CustomerShowState> emit) {
    emit(
      state.copyWith(
        status: CustomerShowStatus.pending,
      ),
    );
  }

  void _onCurrentCustomerChanged(
      CurrentCustomerChanged event, Emitter<CustomerShowState> emit) {
    emit(
      state.copyWith(
        currentCustomer: event.currentCustomer.result,
        allCustomers: state.allCustomers,
        showMessage: event.currentCustomer.errorMessage,
      ),
    );
  }

  void _onCustomerListChanged(
      CustomersListChanged event, Emitter<CustomerShowState> emit) {
    emit(state.copyWith(
      currentCustomer: state.currentCustomer,
      allCustomers: event.customersList.result ?? <Customer>[],
      showMessage: event.message.isEmpty
          ? event.customersList.errorMessage
          : event.message,
    ));
  }

  Future<void> _onLoadCustomersList(
      LoadCustomersList event, Emitter<CustomerShowState> emit) async {
    final customersReq = await GetAllCustomerUseCaseImpl(
      CustomerLocalRespositoryImpl(),
    ).getCustomersList();
    if (customersReq.errorMessage!.isNotEmpty) {
      emit(
        state.copyWith(
          currentCustomer: state.currentCustomer,
          allCustomers: state.allCustomers,
          showMessage: customersReq.errorMessage,
          status: CustomerShowStatus.fail,
        ),
      );
    } else {
      if (customersReq.result!.isEmpty) {
        emit(
          state.copyWith(
            currentCustomer: state.currentCustomer,
            allCustomers: state.allCustomers,
            showMessage: 'There is no customer!',
            status: CustomerShowStatus.fail,
          ),
        );
      } else {
        emit(
          state.copyWith(
            currentCustomer: state.currentCustomer,
            allCustomers: customersReq.result,
            showMessage: '',
            status: CustomerShowStatus.success,
          ),
        );
      }
    }
  }
}
