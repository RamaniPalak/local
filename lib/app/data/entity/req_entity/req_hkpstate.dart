
class ReqHkpStates {
  ReqHkpStates({
    this.companyId,
    this.propertyId,
    this.hkpReservationId,
    this.updatelog,
    this.menuText,
  });

  String? companyId;
  String? propertyId;
  String? hkpReservationId;
  DateTime? updatelog;
  String? menuText;

  factory ReqHkpStates.fromJson(Map<String, dynamic> json) => ReqHkpStates(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    hkpReservationId: json["HKPReservationID"] == null ? null : json["HKPReservationID"],
    updatelog: json["Updatelog"] == null ? null : json["Updatelog"],
    menuText: json["MenuText"] == null ? null : json["MenuText"],
  );

  Map<String, dynamic> toJson() => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "HKPReservationID": hkpReservationId == null ? null : hkpReservationId,
    "Updatelog": updatelog == null ? null : updatelog!.toIso8601String(),
    "MenuText": menuText == null ? null : menuText,
  };
}
