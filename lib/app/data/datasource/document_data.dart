import 'package:dio/dio.dart';
import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_uploaddoc.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_getdocument.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/user_prefs.dart';

abstract class DocumentData {
  Future<ResGetDocument> getDocument({required String memberId});

  Future<ResEmpty> uploadDoc(
      {required String path, required String type, String? docNo});

  Future<ResEmpty> deleteDoc({required String docId});
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

  @override
  Future<ResEmpty> uploadDoc(
      {required String path, required String type, String? docNo}) async {
    final req = await ReqUploadDoc(
            documentNo: docNo ?? '',
            documentTitle: type,
            thambill: await MultipartFile.fromFile(path))
        .toJson();

    print(req);

    var formData = FormData.fromMap(req);

    final res = await WebService.shared.postApiDIO(path: ServerConfigs.documentUpdate, data: formData);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> deleteDoc({required String docId}) async {

    final res = await WebService.shared.deleteApiDIO(path: ServerConfigs.docDelete, data: {'DocumentID': docId});

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
