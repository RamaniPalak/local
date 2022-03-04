
class ResMsgInsert {
  ResMsgInsert({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  Data? data;
  int? statusCode;
  int? statusValueCode;

  factory ResMsgInsert.fromJson(Map<String, dynamic> json) => ResMsgInsert(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  Data({
    this.msgToFrontDeskId,
    this.message,
  });

  String? msgToFrontDeskId;
  String? message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    msgToFrontDeskId: json["msgToFrontDeskID"] == null ? null : json["msgToFrontDeskID"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "msgToFrontDeskID": msgToFrontDeskId == null ? null : msgToFrontDeskId,
    "message": message == null ? null : message,
  };
}
