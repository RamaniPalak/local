import 'package:local/app/data/datasource/message_data.dart';
import 'package:local/app/data/entity/res_entity/res_getmsgfrontdesk.dart';
import 'package:local/app/data/entity/res_entity/res_msginsert.dart';

class MessageRepository {
  final MessageData dataSource;

  MessageRepository({required this.dataSource});

  Future<ResGetMsgToFrontDeskById> getMsgMsgFrontDeskById() async {
    return await dataSource.getMsgMsgFrontDeskById();
  }

  Future<ResMsgInsert> insertMsg({String? msg}) async {
    return await dataSource.insertMsg(msg: msg);
  }
}
