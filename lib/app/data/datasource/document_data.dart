
import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/res_entity/res_getdocument.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/user_prefs.dart';

abstract class DocumentData {


  Future<ResGetDocument> getDocument({required String memberId});


}

class DocumentDataImpl implements DocumentData {


  @override
  Future<ResGetDocument> getDocument({required String memberId}) async {
    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getDocument,
        queryParameters: {'memberId': user.memberID});

    try {
      return ResGetDocument.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}