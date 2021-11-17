

import 'package:local/app/utils/reservation.dart';

class ReqGetNotice {
  ReqGetNotice({
    this.companyId,
    this.propertyId,
    this.reservationId,
    this.memberId,
    this.noticeTypeTerm,
  });

  String? companyId;
  String? propertyId;
  String? reservationId;
  String? memberId;
  String? noticeTypeTerm;

  factory ReqGetNotice.fromJson(Map<String, dynamic> json) => ReqGetNotice(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationId: json["ReservationID"] == null ? null : json["ReservationID"],
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    noticeTypeTerm: json["NoticeType_Term"] == null ? null : json["NoticeType_Term"],
  );

  Map<String, dynamic> toJson(String noticeType) => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "ReservationID": reservationId == null ? null : reservationId,
    "MemberID": memberId == null ? null : memberId,
    "NoticeType_Term": noticeType,
  };

}
