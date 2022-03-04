

import 'package:intl/intl.dart';

class ResGetMsgToFrontDeskById {
  ResGetMsgToFrontDeskById({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  List<Datum>? data;
  int? statusCode;
  int? statusValueCode;

  factory ResGetMsgToFrontDeskById.fromJson(Map<String, dynamic> json) => ResGetMsgToFrontDeskById(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
  Datum({
    this.msgToFrontDeskId,
    this.companyId,
    this.propertyId,
    this.reservationId,
    this.memberId,
    this.associationId,
    this.associationTypeTerm,
    this.refMsgToFrontDeskId,
    this.message,
    this.checkedOn,
    this.createdBy,
    this.memberName,
    this.isRead,
    this.messageDate,
  });

  String? msgToFrontDeskId;
  String? companyId;
  String? propertyId;
  String? reservationId;
  String? memberId;
  String? associationId;
  String? associationTypeTerm;
  String? refMsgToFrontDeskId;
  String? message;
  DateTime? checkedOn;
  String? createdBy;
  String? memberName;
  bool? isRead;
  String? messageDate;

  String get startTime {
    try {
      final time = DateTime.parse(messageDate ?? '');
      String dateTime = DateFormat.jm().format(time);

      return dateTime;
    } on Exception catch (e) {
      print(e);
    }

    return '';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    msgToFrontDeskId: json["msgToFrontDeskID"] == null ? null : json["msgToFrontDeskID"],
    companyId: json["companyID"] == null ? null : json["companyID"],
    propertyId: json["propertyID"] == null ? null : json["propertyID"],
    reservationId: json["reservationID"] == null ? null : json["reservationID"],
    memberId: json["memberID"] == null ? null : json["memberID"],
    associationId: json["associationID"] == null ? null : json["associationID"],
    associationTypeTerm: json["associationType_Term"] == null ? null : json["associationType_Term"],
    refMsgToFrontDeskId: json["refMsgToFrontDeskID"] == null ? null : json["refMsgToFrontDeskID"],
    message: json["message"] == null ? null : json["message"],
    checkedOn: json["checkedOn"] == null ? null : DateTime.parse(json["checkedOn"]),
    createdBy: json["createdBy"],
    memberName: json["memberName"] == null ? null : json["memberName"],
    isRead: json["isRead"] == null ? null : json["isRead"],
    messageDate: json["messageDate"] == null ? null : json["messageDate"],
  );

  Map<String, dynamic> toJson() => {
    "msgToFrontDeskID": msgToFrontDeskId == null ? null : msgToFrontDeskId,
    "companyID": companyId == null ? null : companyId,
    "propertyID": propertyId == null ? null : propertyId,
    "reservationID": reservationId == null ? null : reservationId,
    "memberID": memberId == null ? null : memberId,
    "associationID": associationId == null ? null : associationId,
    "associationType_Term": associationTypeTerm == null ? null : associationTypeTerm,
    "refMsgToFrontDeskID": refMsgToFrontDeskId == null ? null : refMsgToFrontDeskId,
    "message": message == null ? null : message,
    "checkedOn": checkedOn == null ? null : checkedOn!.toIso8601String(),
    "createdBy": createdBy,
    "memberName": memberName == null ? null : memberName,
    "isRead": isRead == null ? null : isRead,
    "messageDate": messageDate == null ? null : messageDate,
  };
}
