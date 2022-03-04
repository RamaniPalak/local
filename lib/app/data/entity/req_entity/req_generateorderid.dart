class ReqGenerateOrderId {
  ReqGenerateOrderId({
    this.companyId,
    this.propertyId,
    this.reservationId,
    this.memberId,
    this.amt,
  });

  String? companyId;
  String? propertyId;
  String? reservationId;
  String? memberId;
  double? amt;

  factory ReqGenerateOrderId.fromJson(Map<String, dynamic> json) => ReqGenerateOrderId(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationId: json["ReservationID"] == null ? null : json["ReservationID"],
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    amt: json["Amt"] == null ? null : json["Amt"],
  );

  Map<String, dynamic> toJson() => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "ReservationID": reservationId == null ? null : reservationId,
    "MemberID": memberId == null ? null : memberId,
    "Amt": amt == null ? null : amt,
  };
}
