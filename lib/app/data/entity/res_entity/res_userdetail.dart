class ResGetUserDetail {
  ResGetUserDetail({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  ResGetUserDetailData? data;
  int? statusCode;
  int? statusValueCode;

  factory ResGetUserDetail.fromJson(Map<String, dynamic> json) =>
      ResGetUserDetail(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : ResGetUserDetailData.fromJson(json["data"]),
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        statusValueCode:
            json["statusValueCode"] == null ? null : json["statusValueCode"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
        "statusCode": statusCode == null ? null : statusCode,
        "statusValueCode": statusValueCode == null ? null : statusValueCode,
      };
}

class ResGetUserDetailData {
  ResGetUserDetailData({
    this.meber,
  });

  Meber? meber;

  factory ResGetUserDetailData.fromJson(Map<String, dynamic> json) =>
      ResGetUserDetailData(
        meber: json["meber"] == null ? null : Meber.fromJson(json["meber"]),
      );

  Map<String, dynamic> toJson() => {
        "meber": meber == null ? null : meber!.toJson(),
      };
}

class Meber {
  Meber({
    this.memberId,
    this.companyId,
    this.memberTypeTerm,
    this.title,
    this.firstName,
    this.middleName,
    this.lastName,
    this.displayName,
    this.dob,
    this.nationalityTerm,
    this.statusTerm,
    this.isDocumentVarified,
    this.varifiedBy,
    this.varifiedOn,
    this.createdBy,
    this.createdOn,
    this.permanentAddressId,
    this.thumbnail,
    this.mobileNo,
    this.mobileNo2,
    this.eMail,
    this.lastReservationId,
    this.lastPropertyId,
    this.isBlock,
    this.blockBy,
    this.blockNote,
    this.totalReservations,
    this.totalStay,
    this.isActive,
    this.updateLog,
    this.seqNo,
    this.isMobileAppUser,
    this.updatedOn,
    this.updatedBy,
  });

  String? memberId;
  String? companyId;
  String? memberTypeTerm;
  String? title;
  String? firstName;
  String? middleName;
  String? lastName;
  String? displayName;
  String? dob;
  String? nationalityTerm;
  String? statusTerm;
  int? isDocumentVarified;
  String? varifiedBy;
  String? varifiedOn;
  String? createdBy;
  String? createdOn;
  String? permanentAddressId;
  String? thumbnail;
  String? mobileNo;
  String? mobileNo2;
  String? eMail;
  String? lastReservationId;
  String? lastPropertyId;
  int? isBlock;
  String? blockBy;
  String? blockNote;
  int? totalReservations;
  int? totalStay;
  int? isActive;
  String? updateLog;
  int? seqNo;
  String? isMobileAppUser;
  String? updatedOn;
  String? updatedBy;

  factory Meber.fromJson(Map<String, dynamic> json) => Meber(
        memberId: json["MemberID"] == null ? null : json["MemberID"],
        companyId: json["CompanyID"] == null ? null : json["CompanyID"],
        memberTypeTerm:
            json["MemberType_Term"] == null ? null : json["MemberType_Term"],
        title: json["Title"] == null ? null : json["Title"],
        firstName: json["FirstName"] == null ? null : json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"] == null ? null : json["LastName"],
        displayName: json["DisplayName"] == null ? null : json["DisplayName"],
        dob: json["DOB"],
        nationalityTerm: json["Nationality_Term"],
        statusTerm: json["Status_Term"] == null ? null : json["Status_Term"],
        isDocumentVarified: json["IsDocumentVarified"] == null
            ? null
            : json["IsDocumentVarified"],
        varifiedBy: json["VarifiedBy"],
        varifiedOn: json["VarifiedOn"],
        createdBy: json["CreatedBy"] == null ? null : json["CreatedBy"],
        createdOn: json["CreatedOn"] == null ? null : json["CreatedOn"],
        permanentAddressId: json["PermanentAddressID"] == null
            ? null
            : json["PermanentAddressID"],
        thumbnail: json["Thumbnail"],
        mobileNo: json["MobileNo"] == null ? null : json["MobileNo"],
        mobileNo2: json["MobileNo2"],
        eMail: json["EMail"] == null ? null : json["EMail"],
        lastReservationId: json["LastReservationID"],
        lastPropertyId: json["LastPropertyID"],
        isBlock: json["IsBlock"] == null ? null : json["IsBlock"],
        blockBy: json["BlockBy"],
        blockNote: json["BlockNote"],
        totalReservations: json["TotalReservations"] == null
            ? null
            : json["TotalReservations"],
        totalStay: json["TotalStay"] == null ? null : json["TotalStay"],
        isActive: json["IsActive"] == null ? null : json["IsActive"],
        updateLog: json["UpdateLog"] == null ? null : json["UpdateLog"],
        seqNo: json["SeqNo"] == null ? null : json["SeqNo"],
        isMobileAppUser: json["IsMobileAppUser"],
        updatedOn: json["UpdatedOn"],
        updatedBy: json["UpdatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "MemberID": memberId == null ? null : memberId,
        "CompanyID": companyId == null ? null : companyId,
        "MemberType_Term": memberTypeTerm == null ? null : memberTypeTerm,
        "Title": title == null ? null : title,
        "FirstName": firstName == null ? null : firstName,
        "MiddleName": middleName,
        "LastName": lastName == null ? null : lastName,
        "DisplayName": displayName == null ? null : displayName,
        "DOB": dob,
        "Nationality_Term": nationalityTerm,
        "Status_Term": statusTerm == null ? null : statusTerm,
        "IsDocumentVarified":
            isDocumentVarified == null ? null : isDocumentVarified,
        "VarifiedBy": varifiedBy,
        "VarifiedOn": varifiedOn,
        "CreatedBy": createdBy == null ? null : createdBy,
        "CreatedOn": createdOn == null ? null : createdOn,
        "PermanentAddressID":
            permanentAddressId == null ? null : permanentAddressId,
        "Thumbnail": thumbnail,
        "MobileNo": mobileNo == null ? null : mobileNo,
        "MobileNo2": mobileNo2,
        "EMail": eMail == null ? null : eMail,
        "LastReservationID": lastReservationId,
        "LastPropertyID": lastPropertyId,
        "IsBlock": isBlock == null ? null : isBlock,
        "BlockBy": blockBy,
        "BlockNote": blockNote,
        "TotalReservations":
            totalReservations == null ? null : totalReservations,
        "TotalStay": totalStay == null ? null : totalStay,
        "IsActive": isActive == null ? null : isActive,
        "UpdateLog": updateLog == null ? null : updateLog,
        "SeqNo": seqNo == null ? null : seqNo,
        "IsMobileAppUser": isMobileAppUser,
        "UpdatedOn": updatedOn,
        "UpdatedBy": updatedBy,
      };
}
