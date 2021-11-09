import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_getinvoice.dart';
import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/req_entity/req_unbilltransac.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_gethistory.dart';
import 'package:local/app/data/entity/res_entity/res_getnotice.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';

abstract class ListData {
  Future<ResGetNotice> getNotice();

  Future<ResEmpty> insertNotice({required Notice data,required String noticeType});

  Future <ResGetHistory> getHistory();
}

class ListDataImpl implements ListData {
  @override
  Future<ResGetNotice> getNotice() async {
    final user = await Reservation.shared.getUser;

    final req = ReqUnbillTransaction(
        propertyId: user.propertyId,
        reservationId: user.reservationId,
        companyId: user.companyId);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getNoticeList, data: req);

    try {
      return ResGetNotice.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> insertNotice({required Notice data, required String noticeType}) async {
    //print(data.toJson());

    var req = await data.toJson(noticeType);

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.insertNotice, data: req);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetHistory> getHistory() async {
    final user = await Reservation.shared.getUser;

    final req = ReqGetInvoice(
        propertyId: user.propertyId,
        reservationId: user.reservationId,
        memberId: user.memberId,
        companyId: user.companyId);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getHistoryList, data: req);

    try {
      return ResGetHistory.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
