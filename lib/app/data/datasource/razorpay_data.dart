import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_generateorderid.dart';
import 'package:local/app/data/entity/req_entity/req_transgetbyid.dart';
import 'package:local/app/data/entity/res_entity/res_generateorderid.dart';
import 'package:local/app/data/entity/res_entity/res_transgetbyid.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';

abstract class RazorPayData {

  Future<ResGenerateOrderId> generateOrderId();

  Future<ResTransGetbyId> transGetById({String? orderID,String? refRazorPayTransId});

}

class RazorPayDataImpl implements RazorPayData {

  @override
  Future<ResGenerateOrderId> generateOrderId() async {
    final user = await Reservation.shared.getReservation;

    final req = ReqGenerateOrderId(
      companyId: user.companyId,
      propertyId: user.propertyId,
      memberId: user.memberId,
      reservationId: user.reservationId,
      amt: -(double.parse(user.folioBalance ?? '')));

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.generateRazorpayOrderid, data: req.toJson());

    try {
      return ResGenerateOrderId.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }

  }

  @override
  Future<ResTransGetbyId> transGetById({String? orderID,String? refRazorPayTransId}) async {
    final user = await Reservation.shared.getReservation;

    final req = ReqTransGetbyId(
        companyId: user.companyId,
        propertyId: user.propertyId,
        memberId: user.memberId,
        reservationId: user.reservationId,
        orderId: orderID,
        refRazorPayTransId: refRazorPayTransId,
        amt: -(double.parse(user.folioBalance ?? '')));

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.razorpayTransGetbyID, data: req.toJson());

    try {
      return ResTransGetbyId.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

}