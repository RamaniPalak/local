import 'dart:io';

import 'package:local/app/data/entity/res_entity/res_getinvoice.dart';
import 'package:local/app/data/entity/res_entity/res_transactioninvoice.dart';
import 'package:local/app/data/entity/res_entity/res_unbilltransac.dart';
import 'package:local/app/providers/base_notifier.dart';
import 'package:local/app/repository/transaction_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:package_info_plus/package_info_plus.dart';

class TransactionProvider {
  Future unbillTransaction() async {}

  Future TransactionInvoice() async {}

  Future GetInvoice({required String invoiceId}) async {}
}

class TransactionProviderImpl extends BaseNotifier
    implements TransactionProvider {
  late TransactionRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  TransactionProviderImpl(this.repo) {
    _unBillTransactionRes = ApiResponse();
    _transactionInvoiceRes = ApiResponse();
    _getInvoiceRes = ApiResponse();
  }

  ApiResponse<ResUnbillTransaction>? _unBillTransactionRes;

  ApiResponse<ResUnbillTransaction>? get unBillTransactionRes =>
      _unBillTransactionRes;

  ApiResponse<ResTransactionInvoice>? _transactionInvoiceRes;

  ApiResponse<ResTransactionInvoice>? get transactionInvoiceRes =>
      _transactionInvoiceRes;

  ApiResponse<ResGetInvoice>? _getInvoiceRes;

  ApiResponse<ResGetInvoice>? get getInvoiceRes => _getInvoiceRes;

  File? pdfFile;

  @override
  Future unbillTransaction() async {
    try {
      apiResIsLoading(_unBillTransactionRes!);

      final res = await repo.unbillTransaction();

      if (res.success != true) {
        apiResIsFailed(_unBillTransactionRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_unBillTransactionRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_unBillTransactionRes!, e.toString());
    }
  }

  @override
  Future TransactionInvoice() async {
    try {
      apiResIsLoading(_transactionInvoiceRes!);

      final res = await repo.TransactionInvoice();

      if (res.success != true) {
        apiResIsFailed(_transactionInvoiceRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_transactionInvoiceRes!, res);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future GetInvoice({required String invoiceId}) async {
    try {
      apiResIsLoading(_getInvoiceRes!);

      final res = await repo.GetInvoice(invoiceId: invoiceId);

      if (res.success != true) {
        apiResIsFailed(_getInvoiceRes!, res.message ?? '');
      } else {
        final file = await res.data?.loadPFd();

        pdfFile = file;

        apiResIsSuccess(_getInvoiceRes!, res);
      }
    } catch (e) {
      print(e);
    }
  }
}
