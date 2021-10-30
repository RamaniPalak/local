import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_getnotice.dart';
import 'package:local/app/repository/notice_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'base_notifier.dart';

class NoticeProvider {
  Future getNotice() async {}

  Future insertNotice() async {}
}

class NoticeProviderImpl extends BaseNotifier implements NoticeProvider {
  late NoticeRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  NoticeProviderImpl(this.repo) {
    _getNoticeRes = ApiResponse();
    _insertNoticeRes = ApiResponse();
  }

  ApiResponse<ResGetNotice>? _getNoticeRes;

  ApiResponse<ResGetNotice>? get getNoticeRes => _getNoticeRes;

  ApiResponse<ResEmpty>? _insertNoticeRes;

  ApiResponse<ResEmpty>? get insertNoticeRes => _insertNoticeRes;

  Notice? noticedata;

  @override
  Future getNotice() async {
    try {
      apiResIsLoading(_getNoticeRes!);

      final res = await repo.getNotice();

      if (res.success != true || (res.data?.data?.length ?? 0) <= 0 ) {
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
  Future insertNotice() async {
    try {
      apiResIsLoading(_insertNoticeRes!);
      print(noticedata?.toJson());



      final res = await repo.insertNotice(data: noticedata!);


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
}
