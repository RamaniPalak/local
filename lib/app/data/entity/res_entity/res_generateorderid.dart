
class ResGenerateOrderId {
  ResGenerateOrderId({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  ResGenerateOrderIdData? data;
  int? statusCode;
  int? statusValueCode;

  factory ResGenerateOrderId.fromJson(Map<String, dynamic> json) => ResGenerateOrderId(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGenerateOrderIdData.fromJson(json["data"]),
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

class ResGenerateOrderIdData {
  ResGenerateOrderIdData({
    this.orderId,
    this.refRazorPayTransId,
  });

  String? orderId;
  String? refRazorPayTransId;

  factory ResGenerateOrderIdData.fromJson(Map<String, dynamic> json) => ResGenerateOrderIdData(
    orderId: json["orderID"] == null ? null : json["orderID"],
    refRazorPayTransId: json["refRazorPayTransID"] == null ? null : json["refRazorPayTransID"],
  );

  Map<String, dynamic> toJson() => {
    "orderID": orderId == null ? null : orderId,
    "refRazorPayTransID": refRazorPayTransId == null ? null : refRazorPayTransId,
  };
}
