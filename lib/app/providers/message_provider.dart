import 'package:local/app/data/entity/res_entity/res_getmsgfrontdesk.dart';
import 'package:local/app/data/entity/res_entity/res_msginsert.dart';
import 'package:local/app/repository/message_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'base_notifier.dart';

class MessageProvider {
  Future getMsgMsgFrontDeskById() async {}

  Future insertMsg({String? msg}) async {}
}

class MessageProviderImpl extends BaseNotifier implements MessageProvider {
  late MessageRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  MessageProviderImpl(this.repo) {
    _getMsgRes = ApiResponse();
    _msgInsertRes = ApiResponse();
  }

  ApiResponse<ResGetMsgToFrontDeskById>? _getMsgRes;

  ApiResponse<ResGetMsgToFrontDeskById>? get getMsgRes => _getMsgRes;

  ApiResponse<ResMsgInsert>? _msgInsertRes;

  ApiResponse<ResMsgInsert>? get msgInsertRes => _msgInsertRes;

  @override
  Future getMsgMsgFrontDeskById() async {
    try {
      apiResIsLoading(_getMsgRes!);

      final res = await repo.getMsgMsgFrontDeskById();
      if (res.success != true) {
        apiResIsFailed(_getMsgRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_getMsgRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_getMsgRes!, e.toString());
    }
  }

  @override
  Future insertMsg({String? msg}) async {
    try {
      apiResIsLoading(_msgInsertRes!);

      final res = await repo.insertMsg(msg: msg);

      if (res.success != true) {
        apiResIsFailed(_msgInsertRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_msgInsertRes!, res);
        getMsgMsgFrontDeskById();
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_msgInsertRes!, e.toString());
    }
  }
}
