part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transactions;
  TransactionSuccess(this.transactions);

  @override
  // TODO: implement props
  List<Object> get props => [transactions];
}

class TransactionFailed extends TransactionState {
  final String errorTransaction;
  TransactionFailed(this.errorTransaction);
  @override
  // TODO: implement props
  List<Object> get props => [errorTransaction];
}
