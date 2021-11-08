import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_getdocument.dart';
import 'package:local/app/providers/base_notifier.dart';
import 'package:local/app/repository/document_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:local/app/utils/user_prefs.dart';

class DocumentProvider {
  Future getDocument() async {}

  Future uploadDoc({required String path}) async {}

  Future deleteDoc({required String docId}) async {}
}

class DocumentProviderImpl extends BaseNotifier implements DocumentProvider {
  late DocumentRepository repo;

  DocumentProviderImpl(this.repo) {
    _getDocumentRes = ApiResponse();
    _uploadDocumentRes = ApiResponse();
    _deleteDocumentRes = ApiResponse();
  }

  ApiResponse<ResGetDocument>? _getDocumentRes;

  ApiResponse<ResGetDocument>? get getDocumentRes => _getDocumentRes;

  ResGetDocumentData? getDocumentData;

  ApiResponse<ResEmpty>? _uploadDocumentRes;

  ApiResponse<ResEmpty>? get uploadDocumentRes => _uploadDocumentRes;

  ApiResponse<ResEmpty>? _deleteDocumentRes;

  ApiResponse<ResEmpty>? get deleteDocumentRes => _deleteDocumentRes;

  String? selectDocumentType;
  String? selectDocumentNo;

  ResGetDocumentData? resGetDocument;

  @override
  Future getDocument() async {
    final user = await UserPrefs.shared.getUser;

    try {
      apiResIsLoading(_getDocumentRes!);

      final res = await repo.getDocument(memberId: user.memberID);

      if (res.success != true || (res.data?.length ?? 0) <= 0) {
        apiResIsFailed(_getDocumentRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_getDocumentRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_getDocumentRes!, e);
    }
  }

  @override
  Future uploadDoc({required String path}) async {
    try {
      apiResIsLoading(_uploadDocumentRes!);

      final res = await repo.uploadDoc(
          path: path,
          type: selectDocumentType ?? '',
          docNo: selectDocumentNo ?? '');

      if (res.success != true) {
        apiResIsFailed(_uploadDocumentRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_uploadDocumentRes!, res);
        getDocument();
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_uploadDocumentRes!, e);
     }
  }

  @override
  Future deleteDoc({required String docId}) async {
    try {
      apiResIsLoading(_deleteDocumentRes!);

      final res = await repo.deleteDoc(docId: docId);

      if (res.success != true) {
        apiResIsFailed(_deleteDocumentRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_deleteDocumentRes!, res);
        getDocument();
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_deleteDocumentRes!, e);
    }
  }
}
