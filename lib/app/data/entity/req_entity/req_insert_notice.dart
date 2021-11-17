import 'package:local/app/components/date_components.dart';
import 'package:local/app/utils/reservation.dart';

class Notice {
  Notice({

    required this.note,
    required this.dateOfIssue,
  });

  String note;
  DateTime dateOfIssue;

  Future<Map<String, dynamic>> toJson(String noticeType) async {

    final res = await Reservation.shared.getUser;

    return {
      "CompanyID": res.companyId,
      "PropertyID": res.propertyId,
      "ReservationID": res.reservationId,
      "MemberID": res.memberId,
      "NoticeType_Term": noticeType,
      "Note": note == null ? null : note,
      "DateOfIssue": dateOfIssue == null ? null : dateOfIssue.toIso8601String(),
      "ActionDate" : DateTime(dateOfIssue.year, dateOfIssue.month + 1, dateOfIssue.day).toIso8601String()
    };
  }
}
