import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_getmsgfrontdesk.dart';
import 'package:local/app/data/entity/req_entity/req_msginsert.dart';
import 'package:local/app/data/entity/res_entity/res_getmsgfrontdesk.dart';
import 'package:local/app/data/entity/res_entity/res_msginsert.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';

abstract class MessageData {

  Future<ResGetMsgToFrontDeskById> getMsgMsgFrontDeskById();

  Future<ResMsgInsert> insertMsg({String? msg});
}

class MessageDataImpl implements MessageData {
  @override
  Future<ResGetMsgToFrontDeskById> getMsgMsgFrontDeskById() async {
    final register = await Reservation.shared.getReservation;

    final req = ReqGetMsgToFrontDeskById(
        reservationId: register.reservationId,
        propertyId: register.propertyId,
        companyId: register.companyId,
        pageNum: 1,
        pageSize: 100);

    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getMsgToFrontDeskById, data: req.toJson());

    try {
      return ResGetMsgToFrontDeskById.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResMsgInsert> insertMsg({String? msg}) async {

    final register = await Reservation.shared.getReservation;

    final req = ReqMsgInsert(
      companyId: register.companyId,
      propertyId: register.propertyId,
      reservationId: register.reservationId,
      memberId: register.memberId,
      associationId: register.memberId,
      associationTypeTerm: 'User',
      createdBy: register.memberId,
      message: msg
    );

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.msgInsert,data: req.toJson());

    try{
      return ResMsgInsert.fromJson(res!);

    } catch (e){
      throw '$jsonParserErrorMsg';

    }

  }
}
