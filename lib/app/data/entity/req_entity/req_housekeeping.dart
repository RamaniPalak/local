
class ReqHouseKeeping {
  ReqHouseKeeping({
    this.companyId,
    this.propertyId,
    this.startDate,
    this.roomTypeId,
    this.roomId,
  });

  String? companyId;
  String? propertyId;
  DateTime? startDate;
  String? roomTypeId;
  String? roomId;

  factory ReqHouseKeeping.fromJson(Map<String, dynamic> json) => ReqHouseKeeping(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    startDate: json["StartDate"] == null ? null : DateTime.parse(json["StartDate"]),
    roomTypeId: json["RoomTypeID"] == null ? null : json["RoomTypeID"],
    roomId: json["RoomID"] == null ? null : json["RoomID"],
  );

  Map<String, dynamic> toJson() => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "StartDate": DateTime.now().toIso8601String(),
    "RoomTypeID": roomTypeId == null ? null : roomTypeId,
    "RoomID": roomId == null ? null : roomId,
  };
}
