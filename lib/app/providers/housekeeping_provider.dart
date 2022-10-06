import 'package:local/app/data/entity/res_entity/res_cancelhkp.dart';
import 'package:local/app/data/entity/res_entity/res_hkpstates.dart';
import 'package:local/app/data/entity/res_entity/res_housekeeping.dart';
import 'package:local/app/providers/base_notifier.dart';
import 'package:local/app/repository/housekeeping_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HouseKeepingProvider {
  Future houseKeepingDate() async {}

  Future cancelHKP({required String hkpReserId}) async {}

  Future hkpStates({required String hkpReserId,DateTime? updateLog,String? term}) async {}

}

class HouseKeepingProviderImpl extends BaseNotifier
    implements HouseKeepingProvider {
  late HouseKeepingRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  HouseKeepingProviderImpl(this.repo) {
    _housekeepingRes = ApiResponse();
    _cancelHKPRes = ApiResponse();
    _hkpStatesRes = ApiResponse();
  }

  ApiResponse<ResHouseKeeping>? _housekeepingRes;

  ApiResponse<ResHouseKeeping>? get housekeepingRes => _housekeepingRes;

  ApiResponse<ResCancelHkp>? _cancelHKPRes;

  ApiResponse<ResCancelHkp>? get cancelHKPRes => _cancelHKPRes;

  ApiResponse<ResHkpStates>? _hkpStatesRes;

  ApiResponse<ResHkpStates>? get hkpStatesRes => _hkpStatesRes;

  int selectedIndex = 0;

  setIndex({required int index}){
    selectedIndex = index;
    notifyListeners();
  }

  @override
  Future houseKeepingDate() async {
    try {
      apiResIsLoading(_housekeepingRes!);

      final res = await repo.housekeepingDate();

      if (res.success != true) {
        apiResIsFailed(_housekeepingRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_housekeepingRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_housekeepingRes!, e.toString());
    }
  }

  @override
  Future cancelHKP({required String hkpReserId}) async {
    try{

      apiResIsLoading(_cancelHKPRes!);

      final res = await repo.cancelHKP(hkpReserId: hkpReserId);

      if(res.success != true){
        apiResIsFailed(_cancelHKPRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_cancelHKPRes!, res);
        houseKeepingDate();
      }

    } catch (e){
      print(e);
      apiResIsFailed(_cancelHKPRes!, e.toString());

     }
  }

  @override
  Future hkpStates({required String hkpReserId, DateTime? updateLog,String? term}) async {

    try{
      apiResIsLoading(_hkpStatesRes!);

      final res = await repo.hkpStates(hkpReserId: hkpReserId,updateLog: updateLog,term: term);

      if(res.success != true){
        apiResIsFailed(_hkpStatesRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_hkpStatesRes!, res);
        houseKeepingDate();
      }

    } catch(e){
      print(e);
      apiResIsFailed(_hkpStatesRes!, e.toString());

    }

  }
}
