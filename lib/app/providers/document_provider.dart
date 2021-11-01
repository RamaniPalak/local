import 'package:local/app/data/entity/res_entity/res_getdocument.dart';
import 'package:local/app/providers/base_notifier.dart';
import 'package:local/app/repository/document_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:local/app/utils/user_prefs.dart';

class DocumentProvider {
  Future getDocument() async {}
}

class DocumentProviderImpl extends BaseNotifier implements DocumentProvider {
  late DocumentRepository repo;

  DocumentProviderImpl(this.repo) {
    _getDocumentRes = ApiResponse();
  }

  ApiResponse<ResGetDocument>? _getDocumentRes;

  ApiResponse<ResGetDocument>? get getDocumentRes => _getDocumentRes;

  ResGetDocumentData? getDocumentData;


  @override
  Future getDocument() async {
    final user = await UserPrefs.shared.getUser;

    try {
      apiResIsLoading(_getDocumentRes!);

      final res = await repo.getDocument(memberId: user.memberID);

      if (res.success != true) {
        apiResIsFailed(_getDocumentRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_getDocumentRes!, res);

      }
    } catch (e) {
      print(e);
      apiResIsFailed(_getDocumentRes!, e);
    }
  }
}
