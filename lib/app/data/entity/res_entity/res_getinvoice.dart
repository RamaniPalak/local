
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

ResGetInvoice resGetInvoiceFromJson(String str) => ResGetInvoice.fromJson(json.decode(str));

String resGetInvoiceToJson(ResGetInvoice data) => json.encode(data.toJson());

class ResGetInvoice {
  ResGetInvoice({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  ResGetInvoiceData? data;
  int? statusCode;
  int? statusValueCode;

  factory ResGetInvoice.fromJson(Map<String, dynamic> json) => ResGetInvoice(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResGetInvoiceData.fromJson(json["data"]),
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

class ResGetInvoiceData {
  ResGetInvoiceData({
    this.invoicePdf,
  });

  String? invoicePdf;

  Future<File> loadPFd() async {
    final byteArr = base64Decode(invoicePdf ?? '');

    var systemTempDir = await getApplicationDocumentsDirectory();

    final file = File('${systemTempDir.path}/example.pdf');
    await file.writeAsBytes(byteArr);

    return file;
  }

  factory ResGetInvoiceData.fromJson(Map<String, dynamic> json) => ResGetInvoiceData(
    invoicePdf: json["invoicePDF"] == null ? null : json["invoicePDF"],
  );

  Map<String, dynamic> toJson() => {
    "invoicePDF": invoicePdf == null ? null : invoicePdf,
  };
}
