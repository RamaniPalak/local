import 'package:local/app/utils/reservation.dart';

class ReqInsertNotice {
  ReqInsertNotice({
    required this.notice,
  });

  Notice notice;

  Future<Map<String, dynamic>> toJson() async{
    return { "Notice" : notice == null ? null : await notice.toJson()};
      }
}

class Notice {
  Notice({

    required this.note,
    required this.dateOfIssue,
  });

  String note;
  DateTime dateOfIssue;

  Future<Map<String, dynamic>> toJson() async {

    final res = await Reservation.shared.getUser;

    return {
      "CompanyID": res.companyId,
      "PropertyID": res.propertyId,
      "ReservationID": res.reservationId,
      "MemberID": res.memberId,
      "NoticeType_Term": 'Checkout',
      "Note": note == null ? null : note,
      "DateOfIssue": dateOfIssue == null ? null : dateOfIssue.toIso8601String(),
    };
  }
}
