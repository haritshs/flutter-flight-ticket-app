import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiket_pesawat_bwa/cubit/transaction_cubit.dart';
import 'package:tiket_pesawat_bwa/shared/theme.dart';
import 'package:tiket_pesawat_bwa/ui/widgets/custom_transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text('No Transaction'),
            );
          } else {
            return ListView.builder(
              itemCount: state.transactions.length,
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              itemBuilder: (context, index) {
                return TransactionCard(
                  state.transactions[index],
                );
              },
            );
          }
        }
        return Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
