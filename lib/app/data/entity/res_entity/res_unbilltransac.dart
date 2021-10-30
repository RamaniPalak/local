

class ResUnbillTransaction {
  ResUnbillTransaction({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  List<ResUnbillTransactionData>? data;
  int? statusCode;
  int? statusValueCode;

  double total() {
    final list = data?.map((e) => e.charge).toList();

    return list?.fold<double>(0.0, (previousValue, element) => previousValue + (element ?? 0.0)) ?? 0.0;
  }

  factory ResUnbillTransaction.fromJson(Map<String, dynamic> json) => ResUnbillTransaction(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<ResUnbillTransactionData>.from(json["data"].map((x) => ResUnbillTransactionData.fromJson(x))),
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
    statusValueCode: json["statusValueCode"] == null ? null : json["statusValueCode"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "statusCode": statusCode == null ? null : statusCode,
    "statusValueCode": statusValueCode == null ? null : statusValueCode,
  };
}

class ResUnbillTransactionData {
  ResUnbillTransactionData({
    this.bookId,
    this.accountName,
    this.narration,
    this.charge,
  });

  String? bookId;
  String? accountName;
  String? narration;
  double? charge;

  factory ResUnbillTransactionData.fromJson(Map<String, dynamic> json) => ResUnbillTransactionData(
    bookId: json["bookID"] == null ? null : json["bookID"],
    accountName: json["accountName"] == null ? null : json["accountName"],
    narration: json["narration"] == null ? null : json["narration"],
    charge: json["charge"] == null ? null : json["charge"],
  );

  Map<String, dynamic> toJson() => {
    "bookID": bookId == null ? null : bookId,
    "accountName": accountName == null ? null : accountName,
    "narration": narration == null ? null : narration,
    "charge": charge == null ? null : charge,
  };
}
