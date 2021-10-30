class ResLogin {
  ResLogin({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  ResLoginData? data;
  int? statusCode;
  int? statusValueCode;

  factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : ResLoginData.fromJson(json["data"]),
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

class ResLoginData {
  ResLoginData({
    this.otp,
    this.token,
    this.logindetails,
  });

  int? otp;
  String? token;
  Logindetails? logindetails;

  factory ResLoginData.fromJson(Map<String, dynamic> json) => ResLoginData(
        otp: json["otp"] == null ? null : json["otp"],
        token: json["token"] == null ? null : json["token"],
        logindetails: json["logindetails"] == null
            ? null
            : Logindetails.fromJson(json["logindetails"]),
      );

  Map<String, dynamic> toJson() => {
        "otp": otp == null ? null : otp,
        "token": token == null ? null : token,
        "logindetails": logindetails == null ? null : logindetails?.toJson(),
      };
}

class Logindetails {
  Logindetails({
    this.memberId,
    this.displayName,
    this.mobileNo,
    this.eMail,
    this.reservationId,
    this.reservationNo,
    this.checkInDate,
    this.checkOutDate,
    this.roomNo,
    this.companyId,
    this.propertyId,
  });

  String? memberId;
  String? displayName;
  String? mobileNo;
  String? eMail;
  String? reservationId;
  String? reservationNo;
  String? checkInDate;
  String? checkOutDate;
  String? roomNo;
  String? companyId;
  String? propertyId;

  factory Logindetails.fromJson(Map<String, dynamic> json) => Logindetails(
        memberId: json["memberID"] == null ? null : json["memberID"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        mobileNo: json["mobileNo"] == null ? null : json["mobileNo"],
        eMail: json["eMail"] == null ? null : json["eMail"],
        reservationId:
            json["reservationID"] == null ? null : json["reservationID"],
        reservationNo:
            json["reservationNo"] == null ? null : json["reservationNo"],
        checkInDate: json["checkInDate"] == null ? null : json["checkInDate"],
        checkOutDate:
            json["checkOutDate"] == null ? null : json["checkOutDate"],
        roomNo: json["roomNo"] == null ? null : json["roomNo"],
        companyId: json["companyID"] == null ? null : json["companyID"],
        propertyId: json["propertyID"] == null ? null : json["propertyID"],
      );

  Map<String, dynamic> toJson() => {
        "memberID": memberId == null ? null : memberId,
        "displayName": displayName == null ? null : displayName,
        "mobileNo": mobileNo == null ? null : mobileNo,
        "eMail": eMail == null ? null : eMail,
        "reservationID": reservationId == null ? null : reservationId,
        "reservationNo": reservationNo == null ? null : reservationNo,
        "checkInDate": checkInDate == null ? null : checkInDate,
        "checkOutDate": checkOutDate == null ? null : checkOutDate,
        "roomNo": roomNo == null ? null : roomNo,
        "companyID": companyId == null ? null : companyId,
        "propertyID": propertyId == null ? null : propertyId,
      };
}
