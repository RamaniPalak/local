class ReqGetNotice {
  ReqGetNotice({
    this.companyId,
    this.propertyId,
    this.reservationNo,
    this.roomNo,
    this.noticeTypeTerm,
  });

  String? companyId;
  String? propertyId;
  String? roomNo;
  String? reservationNo;
  String? noticeTypeTerm;

  factory ReqGetNotice.fromJson(Map<String, dynamic> json) => ReqGetNotice(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationNo: json["ReservationNo"] == null ? null : json["ReservationNo"],
    roomNo: json["RoomNo"] == null ? null : json["RoomNo"],
    noticeTypeTerm: json["NoticeType_Term"] == null ? null : json["NoticeType_Term"],
  );

  Map<String, dynamic> toJson(String noticeType) => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "ReservationNo": reservationNo == null ? null : reservationNo,
    "RoomNo": roomNo == null ? null : roomNo,
    "NoticeType_Term": noticeType,
  };

}
