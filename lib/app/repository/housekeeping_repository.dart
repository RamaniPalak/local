import 'package:local/app/data/datasource/housekeeping_data.dart';
import 'package:local/app/data/entity/res_entity/res_cancelhkp.dart';
import 'package:local/app/data/entity/res_entity/res_hkpstates.dart';
import 'package:local/app/data/entity/res_entity/res_housekeeping.dart';

class HouseKeepingRepository {

   final HouseKeepingData dataSource;

  HouseKeepingRepository({required this.dataSource});

  Future<ResHouseKeeping> housekeepingDate() async {
    return await dataSource.housekeepingDate();
  }

   Future<ResCancelHkp> cancelHKP({required String hkpReserId}) async {
     return await dataSource.cancelHKP(hkpReserId: hkpReserId);
   }

   Future<ResHkpStates> hkpStates({required String hkpReserId,DateTime? updateLog,String? term}) async {
     return await dataSource.hkpStates(hkpReserId: hkpReserId,updateLog: updateLog,term: term);
   }

}