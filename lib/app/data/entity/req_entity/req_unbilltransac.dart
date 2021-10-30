

class ReqUnbillTransaction {
  ReqUnbillTransaction({
    this.companyId,
    this.propertyId,
    this.reservationId,
  });

  String? companyId;
  String? propertyId;
  String? reservationId;

  factory ReqUnbillTransaction.fromJson(Map<String, dynamic> json) => ReqUnbillTransaction(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationId: json["ReservationID"] == null ? null : json["ReservationID"],
  );

  Map<String, dynamic> toJson() => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "ReservationID": reservationId == null ? null : reservationId,
  };
}
