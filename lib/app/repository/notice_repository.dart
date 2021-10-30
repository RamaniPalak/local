import 'package:local/app/data/datasource/noticelist_dart.dart';
import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_getnotice.dart';

class NoticeRepository {
  final NoticeListData dataSource;

  NoticeRepository({required this.dataSource});

  Future<ResGetNotice> getNotice() async {
    return await dataSource.getNotice();
  }

  Future<ResEmpty> insertNotice({required Notice data}) async {
    return await dataSource.insertNotice(data: data);
  }



}