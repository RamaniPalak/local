

class ReqEvent {
  ReqEvent({
    this.eventId,
    this.companyId,
    this.propertyId,
  });

  String? eventId;
  String? companyId;
  String? propertyId;

  factory ReqEvent.fromJson(Map<String, dynamic> json) => ReqEvent(
    eventId: json["EventID"] == null ? null : json["EventID"],
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
  );

  Map<String, dynamic> toJson() => {
    "EventID": eventId == null ? null : eventId,
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
  };
}
