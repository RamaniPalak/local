import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_cancelhkp.dart';
import 'package:local/app/data/entity/req_entity/req_hkpstate.dart';
import 'package:local/app/data/entity/req_entity/req_housekeeping.dart';
import 'package:local/app/data/entity/res_entity/res_cancelhkp.dart';
import 'package:local/app/data/entity/res_entity/res_hkpstates.dart';
import 'package:local/app/data/entity/res_entity/res_housekeeping.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';

abstract class HouseKeepingData {
  Future<ResHouseKeeping> housekeepingDate();

  Future<ResCancelHkp> cancelHKP({required String hkpReserId});

  Future<ResHkpStates> hkpStates({required String hkpReserId,DateTime? updateLog,String? term});

}

class HouseKeepingDataImpl implements HouseKeepingData {
  @override
  Future<ResHouseKeeping> housekeepingDate() async {
    final user = await Reservation.shared.getReservation;

    final req = ReqHouseKeeping(
        propertyId: user.propertyId,
        companyId: user.companyId,
        roomTypeId: user.roomTypeId,
        roomId: user.roomId);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getHousekeeping, data: req.toJson());

    try {
      return ResHouseKeeping.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResCancelHkp> cancelHKP({required String hkpReserId}) async {
    final user = await Reservation.shared.getReservation;

    final req = ReqCancelHkp(
        propertyId: user.propertyId,
        companyId: user.companyId,
        hkpReservationId: hkpReserId);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.cancelHKP, data: req.toJson());

    try {
      return ResCancelHkp.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResHkpStates> hkpStates({required String hkpReserId, DateTime? updateLog,String? term}) async {

    final registration = await Reservation.shared.getReservation;

    final req = ReqHkpStates(
      propertyId: registration.propertyId,
      companyId: registration.companyId,
      hkpReservationId: hkpReserId,
      menuText: term,
      updatelog: updateLog);

    print(req.toJson());

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.hkpStates,data: req.toJson());

    try{
      return ResHkpStates.fromJson(res!);

    } catch(e){
      throw '$jsonParserErrorMsg';
    }

  }
}
