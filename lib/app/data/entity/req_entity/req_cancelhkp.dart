
class ReqCancelHkp {
  ReqCancelHkp({
    this.hkpReservationId,
    this.companyId,
    this.propertyId,
  });

  String? hkpReservationId;
  String? companyId;
  String? propertyId;

  factory ReqCancelHkp.fromJson(Map<String, dynamic> json) => ReqCancelHkp(
    hkpReservationId: json["HKPReservationID"] == null ? null : json["HKPReservationID"],
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
  );

  Map<String, dynamic> toJson() => {
    "HKPReservationID": hkpReservationId == null ? null : hkpReservationId,
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
  };
}
