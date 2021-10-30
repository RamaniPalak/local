import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_unbilltransac.dart';
import 'package:local/app/data/entity/res_entity/res_transactioninvoice.dart';
import 'package:local/app/data/entity/res_entity/res_unbilltransac.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';

abstract class TransactionData {
  Future<ResUnbillTransaction> unbillTransaction();

  Future<ResTransactionInvoice> TransactionInvoice();
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

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getUnbilledTransaction, data: req);

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
    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getTransactionInvoice, data: req);

    try {
      return ResTransactionInvoice.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
