
import 'package:local/app/data/datasource/document_data.dart';
import 'package:local/app/data/entity/res_entity/res_getdocument.dart';

class DocumentRepository {

  late final DocumentDataImpl dataSource;
  DocumentRepository({required this.dataSource});


  Future<ResGetDocument> getDocument({required String memberId}) async {
    return await dataSource.getDocument(memberId: memberId);
  }




}