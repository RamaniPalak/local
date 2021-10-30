class ResEmpty {
  ResEmpty({
    this.success,
    this.message,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  int? statusCode;
  int? statusValueCode;

  factory ResEmpty.fromJson(Map<String, dynamic> json) => ResEmpty(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        statusValueCode:
            json["statusValueCode"] == null ? null : json["statusValueCode"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "statusCode": statusCode == null ? null : statusCode,
        "statusValueCode": statusValueCode == null ? null : statusValueCode,
      };
}
