import 'package:dio/dio.dart';
import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_addcomplain.dart';
import 'package:local/app/data/entity/req_entity/req_event.dart';
import 'package:local/app/data/entity/req_entity/req_getcomplain.dart';
import 'package:local/app/data/entity/req_entity/req_getinvoice.dart';
import 'package:local/app/data/entity/req_entity/req_getnotice.dart';
import 'package:local/app/data/entity/req_entity/req_insert_notice.dart';
import 'package:local/app/data/entity/res_entity/res_complain.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_event.dart';
import 'package:local/app/data/entity/res_entity/res_gethistory.dart';
import 'package:local/app/data/entity/res_entity/res_getnotice.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';

abstract class ListData {
  Future<ResGetNotice> getNotice({required String noticeTypeTerm});

  Future<ResEmpty> insertNotice(
      {required Notice data, required String noticeType});

  Future<ResGetHistory> getHistory();

  Future<ResEmpty> insertComplain(
      {required ReqAddComplain data, List<String>? paths});

  Future<ResComplain> getComplain();

  Future<ResEvent> getEvent({ String? event});
}

class ListDataImpl implements ListData {
  @override
  Future<ResGetNotice> getNotice({required String noticeTypeTerm}) async {
    final user = await Reservation.shared.getReservation;

    final req = ReqGetNotice(
      propertyId: user.propertyId,
      reservationNo : user.reservationNo,
      companyId: user.companyId,
      roomNo: user.roomNo,
    );

    print(req.toJson(noticeTypeTerm));

    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getNoticeList, data: req.toJson(noticeTypeTerm));

    try {
      return ResGetNotice.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> insertNotice(
      {required Notice data, required String noticeType}) async {
    //print(data.toJson());

    var req = await data.toJson(noticeType);

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.insertNotice, data: req);

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetHistory> getHistory() async {
    final user = await Reservation.shared.getReservation;

    final req = ReqGetInvoice(
        propertyId: user.propertyId,
        reservationId: user.reservationId,
        memberId: user.memberId,
        companyId: user.companyId);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getHistoryList, data: req);

    try {
      return ResGetHistory.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> insertComplain(
      {required ReqAddComplain data, List<String>? paths}) async {
    final user = await Reservation.shared.getReservation;

    final List<MultipartFile> list = [];

    await Future.forEach<String>(paths!, (element) async {
      print('cool');
      final file = await MultipartFile.fromFile(element);
      print('Before Finally');
      print(file.toString());
      list.add(file);
    });

    print('Finally');

    print(list.length);

    final form = {
      'ComplainFiles': list,
      "TicketTitle": data.ticketTitle,
      "IssueRelatedType_Term": data.issueRelatedTypeTerm,
      "CompanyID": user.companyId,
      "PropertyID": user.propertyId,
      "TicketNote": data.ticketNote,
      "Priority_Term": data.priorityTerm,
    };

    var formData = FormData.fromMap(form);

    print(form);

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.insertComplain, data: formData);
    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResComplain> getComplain() async {
    final user = await Reservation.shared.getReservation;

    final req = ReqGetComplain(
        propertyId: user.propertyId,
        companyId: user.companyId,
        pageNum: 1,
        pageSize: 100);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.getComplain, data: req);

    try {
      return ResComplain.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEvent> getEvent({ String? event}) async {
    final reserv = await Reservation.shared.getReservation;

    final req = ReqEvent(
        propertyId: reserv.propertyId, companyId: reserv.companyId, eventId: event);

     print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.eventList, data: req);
    try {
      return ResEvent.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
