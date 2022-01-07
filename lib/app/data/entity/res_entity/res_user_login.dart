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
    statusValueCode: json["statusValueCode"] == null ? null : json["statusValueCode"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
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
    logindetails: json["logindetails"] == null ? null : Logindetails.fromJson(json["logindetails"]),
  );

  Map<String, dynamic> toJson() => {
    "otp": otp == null ? null : otp,
    "token": token == null ? null : token,
    "logindetails": logindetails == null ? null : logindetails!.toJson(),
  };
}

class Logindetails {
  Logindetails({
    this.memberId,
    this.displayName,
    this.mobileNo,
    this.eMail,
  });

  String? memberId;
  String? displayName;
  String? mobileNo;
  String? eMail;

  factory Logindetails.fromJson(Map<String, dynamic> json) => Logindetails(
    memberId: json["memberID"] == null ? null : json["memberID"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    mobileNo: json["mobileNo"] == null ? null : json["mobileNo"],
    eMail: json["eMail"] == null ? null : json["eMail"],
  );

  Map<String, dynamic> toJson() => {
    "memberID": memberId == null ? null : memberId,
    "displayName": displayName == null ? null : displayName,
    "mobileNo": mobileNo == null ? null : mobileNo,
    "eMail": eMail == null ? null : eMail,
  };
}
