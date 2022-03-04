
class ReqGetMsgToFrontDeskById {
  ReqGetMsgToFrontDeskById({
    this.pageNum,
    this.pageSize,
    this.companyId,
    this.propertyId,
    this.reservationId,
  });

  int? pageNum;
  int? pageSize;
  String? companyId;
  String? propertyId;
  String? reservationId;

  factory ReqGetMsgToFrontDeskById.fromJson(Map<String, dynamic> json) => ReqGetMsgToFrontDeskById(
    pageNum: json["PageNum"] == null ? null : json["PageNum"],
    pageSize: json["PageSize"] == null ? null : json["PageSize"],
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationId: json["ReservationID"] == null ? null : json["ReservationID"],
  );

  Map<String, dynamic> toJson() => {
    "PageNum": pageNum == null ? null : pageNum,
    "PageSize": pageSize == null ? null : pageSize,
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "ReservationID": reservationId == null ? null : reservationId,
  };
}
