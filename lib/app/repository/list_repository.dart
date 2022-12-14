import 'package:local/app/data/datasource/list_data.dart';
import 'package:local/app/data/entity/req_entity/req_addcomplain.dart';
import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/res_entity/res_complain.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_event.dart';
import 'package:local/app/data/entity/res_entity/res_gethistory.dart';
import 'package:local/app/data/entity/res_entity/res_getnotice.dart';

class ListRepository {
  final ListData dataSource;

  ListRepository({required this.dataSource});

  Future<ResGetNotice> getNotice({required String noticeTypeTerm}) async {
    return await dataSource.getNotice(noticeTypeTerm: noticeTypeTerm);
  }

  Future<ResEmpty> insertNotice({required Notice data,required String noticeType}) async {
    return await dataSource.insertNotice(data: data,noticeType: noticeType);
  }

  Future<ResGetHistory> getHistory() async {
    return await dataSource.getHistory();
  }

  Future<ResEmpty> insertComplain({ ReqAddComplain? data,List<String>? paths}) async {
    return await dataSource.insertComplain(data: data,paths: paths);
  }

  Future<ResComplain> getComplain() async {
    return await dataSource.getComplain();
  }

  Future<ResEvent> getEvent({ String? event}) async {
    return await dataSource.getEvent(event: event);
  }

}