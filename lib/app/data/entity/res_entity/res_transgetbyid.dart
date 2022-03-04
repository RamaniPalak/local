
class ResTransGetbyId {
  ResTransGetbyId({
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

  factory ResTransGetbyId.fromJson(Map<String, dynamic> json) => ResTransGetbyId(
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
    this.refRazorPayTransId,
    this.companyId,
    this.propertyId,
    this.reservationId,
    this.memberId,
    this.orderId,
    this.transactionDate,
    this.amt,
    this.statusTerm,
    this.transactionId,
    this.bookId,
    this.isReconcile,
    this.reconcileOn,
    this.reconcileBy,
    this.acctId,
    this.moPTerm,
    this.transResponse,
    this.razorPayReciptId,
    this.razorPayPaymentId,
    this.memberFolioId,
  });

  String? refRazorPayTransId;
  String? companyId;
  String? propertyId;
  String? reservationId;
  String? memberId;
  String? orderId;
  DateTime? transactionDate;
  int? amt;
  String? statusTerm;
  dynamic? transactionId;
  dynamic? bookId;
  bool? isReconcile;
  DateTime? reconcileOn;
  dynamic? reconcileBy;
  dynamic? acctId;
  dynamic? moPTerm;
  dynamic? transResponse;
  String? razorPayReciptId;
  dynamic? razorPayPaymentId;
  String? memberFolioId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    refRazorPayTransId: json["refRazorPayTransID"] == null ? null : json["refRazorPayTransID"],
    companyId: json["companyID"] == null ? null : json["companyID"],
    propertyId: json["propertyID"] == null ? null : json["propertyID"],
    reservationId: json["reservationID"] == null ? null : json["reservationID"],
    memberId: json["memberID"] == null ? null : json["memberID"],
    orderId: json["orderID"] == null ? null : json["orderID"],
    transactionDate: json["transactionDate"] == null ? null : DateTime.parse(json["transactionDate"]),
    amt: json["amt"] == null ? null : json["amt"],
    statusTerm: json["status_term"] == null ? null : json["status_term"],
    transactionId: json["transactionID"],
    bookId: json["bookID"],
    isReconcile: json["isReconcile"] == null ? null : json["isReconcile"],
    reconcileOn: json["reconcileOn"] == null ? null : DateTime.parse(json["reconcileOn"]),
    reconcileBy: json["reconcileBy"],
    acctId: json["acctID"],
    moPTerm: json["moP_Term"],
    transResponse: json["transResponse"],
    razorPayReciptId: json["razorPayReciptID"] == null ? null : json["razorPayReciptID"],
    razorPayPaymentId: json["razorPayPaymentID"],
    memberFolioId: json["memberFolioID"] == null ? null : json["memberFolioID"],
  );

  Map<String, dynamic> toJson() => {
    "refRazorPayTransID": refRazorPayTransId == null ? null : refRazorPayTransId,
    "companyID": companyId == null ? null : companyId,
    "propertyID": propertyId == null ? null : propertyId,
    "reservationID": reservationId == null ? null : reservationId,
    "memberID": memberId == null ? null : memberId,
    "orderID": orderId == null ? null : orderId,
    "transactionDate": transactionDate == null ? null : transactionDate!.toIso8601String(),
    "amt": amt == null ? null : amt,
    "status_term": statusTerm == null ? null : statusTerm,
    "transactionID": transactionId,
    "bookID": bookId,
    "isReconcile": isReconcile == null ? null : isReconcile,
    "reconcileOn": reconcileOn == null ? null : reconcileOn!.toIso8601String(),
    "reconcileBy": reconcileBy,
    "acctID": acctId,
    "moP_Term": moPTerm,
    "transResponse": transResponse,
    "razorPayReciptID": razorPayReciptId == null ? null : razorPayReciptId,
    "razorPayPaymentID": razorPayPaymentId,
    "memberFolioID": memberFolioId == null ? null : memberFolioId,
  };
}
