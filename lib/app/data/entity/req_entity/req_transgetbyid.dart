
class ReqTransGetbyId {
  ReqTransGetbyId({
    this.refRazorPayTransId,
    this.companyId,
    this.propertyId,
    this.reservationId,
    this.memberId,
    this.amt,
    this.orderId,
  });

  String? refRazorPayTransId;
  String? companyId;
  String? propertyId;
  String? reservationId;
  String? memberId;
  double? amt;
  String? orderId;

  factory ReqTransGetbyId.fromJson(Map<String, dynamic> json) => ReqTransGetbyId(
    refRazorPayTransId: json["RefRazorPayTransID"],
    companyId: json["CompanyID"],
    propertyId: json["PropertyID"],
    reservationId: json["ReservationID"],
    memberId: json["MemberID"],
    amt: json["Amt"] == null ? null : json["Amt"],
    orderId: json["OrderID"] == null ? null : json["OrderID"],
  );

  Map<String, dynamic> toJson() => {
    "RefRazorPayTransID": refRazorPayTransId,
    "CompanyID": companyId,
    "PropertyID": propertyId,
    "ReservationID": reservationId,
    "MemberID": memberId,
    "Amt": amt == null ? null : amt,
    "OrderID": orderId == null ? null : orderId,
  };
}
