import 'package:local/app/data/entity/req_entity/req_addcomplain.dart';
import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/res_entity/res_complain.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_gethistory.dart';
import 'package:local/app/data/entity/res_entity/res_getnotice.dart';
import 'package:local/app/repository/list_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'base_notifier.dart';

class ListProvider {
  Future getNotice() async {}

  Future insertNotice({required String noticeType}) async {}

  Future getHistory() async {}

  Future insertComplain() async {}

  Future getComplain() async {}
}

class ListProviderImpl extends BaseNotifier implements ListProvider {
  late ListRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  ListProviderImpl(this.repo) {

    _getNoticeRes = ApiResponse();
    _insertNoticeRes = ApiResponse();
    _getHistoryRes = ApiResponse();
    _insertComplainRes = ApiResponse();
    _getComplainRes = ApiResponse();

  }

  ApiResponse<ResGetNotice>? _getNoticeRes;

  ApiResponse<ResGetNotice>? get getNoticeRes => _getNoticeRes;

  ApiResponse<ResEmpty>? _insertNoticeRes;

  ApiResponse<ResEmpty>? get insertNoticeRes => _insertNoticeRes;

  ApiResponse<ResGetHistory>? _getHistoryRes;

  ApiResponse<ResGetHistory>? get getHistoryRes => _getHistoryRes;

  ApiResponse<ResEmpty>? _insertComplainRes;

  ApiResponse<ResEmpty>? get insertComplainRes => _insertComplainRes;

  ApiResponse<ResComplain>? _getComplainRes;

  ApiResponse<ResComplain>? get getComplainRes => _getComplainRes;

  Notice? noticedata;

  ReqAddComplain? complainData;



  @override
  Future getNotice() async {
    try {
      apiResIsLoading(_getNoticeRes!);

      final res = await repo.getNotice();

      if (res.success != true || (res.data?.data?.length ?? 0) <= 0) {
        apiResIsFailed(_getNoticeRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_getNoticeRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_getNoticeRes!, e.toString());
    }
  }

  @override
  Future insertNotice({required String noticeType}) async {
    try {
      apiResIsLoading(_insertNoticeRes!);

      final res = await repo.insertNotice(data: noticedata!,noticeType: noticeType);

      if (res.success != true) {
        apiResIsFailed(_insertNoticeRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_insertNoticeRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_insertNoticeRes!, e.toString());
    }
  }

  @override
  Future getHistory() async {
    try {
      apiResIsLoading(_getHistoryRes!);

      final res = await repo.getHistory();

      if (res.success != true) {
        apiResIsFailed(_getHistoryRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_getHistoryRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_getHistoryRes!, e.toString());
    }
  }

  @override
  Future insertComplain() async {
    try{

      apiResIsLoading(_insertComplainRes!);

      final res = await repo.insertComplain(data: complainData!);

      if(res.success != true){
        apiResIsFailed(_insertComplainRes!, res.message ?? '');
      } else {
        getComplain();
        apiResIsSuccess(_insertComplainRes!, res);
      }

    } catch (e){
      print(e);
      apiResIsFailed(_insertComplainRes!, e.toString());

    }
  }

  @override
  Future getComplain() async {
    try {

      apiResIsLoading(_getComplainRes!);

      final res = await repo.getComplain();

      if(res.success != true){
        apiResIsFailed(_getComplainRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_getComplainRes!, res);
      }

    } catch(e){
      print(e);
      apiResIsFailed(_getComplainRes!, e.toString());

    }
  }
}
