

class ResTransactionInvoice {
  ResTransactionInvoice({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  List<ResTransactionInvoiceData>? data;
  int? statusCode;
  int? statusValueCode;

  factory ResTransactionInvoice.fromJson(Map<String, dynamic> json) => ResTransactionInvoice(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<ResTransactionInvoiceData>.from(json["data"].map((x) => ResTransactionInvoiceData.fromJson(x))),
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

class ResTransactionInvoiceData {
  ResTransactionInvoiceData({
    this.invoiceId,
    this.invoiceNo,
    this.invoiceDate,
    this.billAmt,
    this.receivedAmt,
    this.dueAmt,

  });

  String? invoiceId;
  String? invoiceNo;
  String? invoiceDate;
  double? billAmt;
  double? receivedAmt;
  double? dueAmt;


  bool get isPaymentDue  {
    return (dueAmt ?? 0) < 0;
  }

  factory ResTransactionInvoiceData.fromJson(Map<String, dynamic> json) => ResTransactionInvoiceData(
    invoiceId: json["InvoiceID"] == null ? null : json["InvoiceID"],
    invoiceNo: json["InvoiceNo"] == null ? null : json["InvoiceNo"],
    invoiceDate: json["InvoiceDate"] == null ? null : json["InvoiceDate"],
    billAmt: json["BillAmt"] == null ? null : json["BillAmt"].toDouble(),
    receivedAmt: json["ReceivedAmt"] == null ? null : json["ReceivedAmt"].toDouble(),
    dueAmt: json["DueAmt"] == null ? null : json["DueAmt"].toDouble(),

  );

  Map<String, dynamic> toJson() => {
    "InvoiceID": invoiceId == null ? null : invoiceId,
    "InvoiceNo": invoiceNo == null ? null : invoiceNo,
    "InvoiceDate": invoiceDate == null ? null : invoiceDate,
    "BillAmt": billAmt == null ? null : billAmt,
    "ReceivedAmt": receivedAmt == null ? null : receivedAmt,
    "DueAmt": dueAmt == null ? null : dueAmt,
  };
}
