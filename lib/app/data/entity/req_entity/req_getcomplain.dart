

class ReqGetComplain {
  ReqGetComplain({
    this.pageNum,
    this.pageSize,
    this.companyId,
    this.propertyId,
  });

  int? pageNum;
  int? pageSize;
  String? companyId;
  String? propertyId;

  factory ReqGetComplain.fromJson(Map<String, dynamic> json) => ReqGetComplain(
    pageNum: json["PageNum"] == null ? null : json["PageNum"],
    pageSize: json["PageSize"] == null ? null : json["PageSize"],
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
  );

  Map<String, dynamic> toJson() => {
    "PageNum": pageNum == null ? null : pageNum,
    "PageSize": pageSize == null ? null : pageSize,
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
  };
}
