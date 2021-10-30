class ResGetBankDetail {
  ResGetBankDetail({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  ResGetBankDetailData? data;
  int? statusCode;
  int? statusValueCode;

  factory ResGetBankDetail.fromJson(Map<String, dynamic> json) =>
      ResGetBankDetail(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : ResGetBankDetailData.fromJson(json["data"]),
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        statusValueCode:
            json["statusValueCode"] == null ? null : json["statusValueCode"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data?.toJson(),
        "statusCode": statusCode == null ? null : statusCode,
        "statusValueCode": statusValueCode == null ? null : statusValueCode,
      };
}

class ResGetBankDetailData {
  ResGetBankDetailData({
    this.bankDetail,
  });

  BankDetail? bankDetail;

  factory ResGetBankDetailData.fromJson(Map<String, dynamic> json) =>
      ResGetBankDetailData(
        bankDetail: json["bankDetail"] == null
            ? null
            : BankDetail.fromJson(json["bankDetail"]),
      );

  Map<String, dynamic> toJson() => {
        "bankDetail": bankDetail == null ? null : bankDetail?.toJson(),
      };
}

class BankDetail {
  BankDetail({
    this.memBankDetailId,
    this.memberId,
    this.companyId,
    this.acHolderName,
    this.acBankName,
    this.acBranchName,
    this.acNo,
    this.acifscCode,
    this.updateLog,
    this.updatedOn,
    this.updatedBy,
    this.isActive,
  });

  String? memBankDetailId;
  String? memberId;
  String? companyId;
  String? acHolderName;
  String? acBankName;
  String? acBranchName;
  String? acNo;
  String? acifscCode;
  String? updateLog;
  String? updatedOn;
  String? updatedBy;
  bool? isActive;

  factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
        memBankDetailId:
            json["memBankDetailID"] == null ? null : json["memBankDetailID"],
        memberId: json["memberID"] == null ? null : json["memberID"],
        companyId: json["companyID"] == null ? null : json["companyID"],
        acHolderName:
            json["acHolderName"] == null ? null : json["acHolderName"],
        acBankName: json["acBankName"] == null ? null : json["acBankName"],
        acBranchName:
            json["acBranchName"] == null ? null : json["acBranchName"],
        acNo: json["acNo"] == null ? null : json["acNo"],
        acifscCode: json["acifscCode"] == null ? null : json["acifscCode"],
        updateLog: json["updateLog"] == null ? null : json["updateLog"],
        updatedOn: json["updatedOn"] == null ? null : json["updatedOn"],
        updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
        isActive: json["isActive"] == null ? null : json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "memBankDetailID": memBankDetailId == null ? null : memBankDetailId,
        "memberID": memberId == null ? null : memberId,
        "companyID": companyId == null ? null : companyId,
        "acHolderName": acHolderName == null ? null : acHolderName,
        "acBankName": acBankName == null ? null : acBankName,
        "acBranchName": acBranchName == null ? null : acBranchName,
        "acNo": acNo == null ? null : acNo,
        "acifscCode": acifscCode == null ? null : acifscCode,
        "updateLog": updateLog == null ? null : updateLog,
        "updatedOn": updatedOn == null ? null : updatedOn,
        "isActive": isActive == null ? null : isActive,
      };
}
