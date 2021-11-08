import 'package:local/app/data/datasource/list_dart.dart';
import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_gethistory.dart';
import 'package:local/app/data/entity/res_entity/res_getnotice.dart';

class ListRepository {
  final ListData dataSource;

  ListRepository({required this.dataSource});

  Future<ResGetNotice> getNotice() async {
    return await dataSource.getNotice();
  }

  Future<ResEmpty> insertNotice({required Notice data}) async {
    return await dataSource.insertNotice(data: data);
  }

  Future<ResGetHistory> getHistory() async {
    return await dataSource.getHistory();
  }



}