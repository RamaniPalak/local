import 'package:local/app/data/datasource/transaction_data.dart';
import 'package:local/app/data/entity/res_entity/res_transactioninvoice.dart';
import 'package:local/app/data/entity/res_entity/res_unbilltransac.dart';

class TransactionRepository {
  final TransactionData dataSource;

  TransactionRepository({required this.dataSource});

  Future<ResUnbillTransaction> unbillTransaction() async {
    return await dataSource.unbillTransaction();
  }

  Future<ResTransactionInvoice> TransactionInvoice() async {
    return await dataSource.TransactionInvoice();
  }

}
