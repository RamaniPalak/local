import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_getinvoice.dart';
import 'package:local/app/data/entity/req_entity/req_unbilltransac.dart';
import 'package:local/app/data/entity/res_entity/res_getinvoice.dart';
import 'package:local/app/data/entity/res_entity/res_transactioninvoice.dart';
import 'package:local/app/data/entity/res_entity/res_unbilltransac.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';

abstract class TransactionData {
  Future<ResUnbillTransaction> unbillTransaction();

  Future<ResTransactionInvoice> TransactionInvoice();

  Future<ResGetInvoice> GetInvoice({required String invoiceId});
}

class TransactionDataImpl implements TransactionData {
  @override
  Future<ResUnbillTransaction> unbillTransaction() async {
    final user = await Reservation.shared.getUser;

    final req = ReqUnbillTransaction(
        propertyId: user.propertyId,
        reservationId: user.reservationId,
        companyId: user.companyId);

    print(req.toJson());

    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getUnbilledTransaction, data: req.toJson());

    try {
      return ResUnbillTransaction.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResTransactionInvoice> TransactionInvoice() async {
    final user = await Reservation.shared.getUser;

    final req = ReqUnbillTransaction(
        propertyId: user.propertyId,
        reservationId: user.reservationId,
        companyId: user.companyId);

    print(req.toJson());
    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getTransactionInvoice, data: req.toJson());

    try {
      return ResTransactionInvoice.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetInvoice> GetInvoice({required String invoiceId}) async {
    final user = await Reservation.shared.getUser;



    final req = ReqGetInvoice(
        propertyId: user.propertyId,
        reservationId: user.reservationId,
        companyId: user.companyId,
        memberId: user.memberId,
        invoiceId: invoiceId);

    print(req.toJson());
    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getInvoiceId, data: req.toJson());

    try {
      return ResGetInvoice.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
