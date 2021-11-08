

import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';

class ResGetHistory {
  ResGetHistory({
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

  factory ResGetHistory.fromJson(Map<String, dynamic> json) => ResGetHistory(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        statusValueCode:
            json["statusValueCode"] == null ? null : json["statusValueCode"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "statusCode": statusCode == null ? null : statusCode,
        "statusValueCode": statusValueCode == null ? null : statusValueCode,
      };
}

class Datum {
  Datum({
    this.reservationId,
    this.reservationNo,
    this.roomTypeName,
    this.roomNo,
    this.statusTerm,
    this.checkInDate,
    this.checkOutDate,
    this.noOfStay,
    this.stayTypeTerm,
    this.folioId,
    this.propertyName,
    this.totalCharges,
    this.rateName,
  });

  String? reservationId;
  String? reservationNo;
  String? roomTypeName;
  String? roomNo;
  String? statusTerm;
  String? checkInDate;
  String? checkOutDate;
  int? noOfStay;
  String? stayTypeTerm;
  String? folioId;
  String? propertyName;
  double? totalCharges;
  String? rateName;

  HistoryStatus? get historyStatus {
    return historyStatusValue.map[statusTerm ?? ''];
  }

  Color? get statusColor {
    switch (historyStatus) {
      case HistoryStatus.CheckIn:
        return greenColor;
        break;
      case HistoryStatus.CheckOut:
        return yellowColor;
        break;
      case HistoryStatus.Cancelled:
        return kRedColor;
      default:
        return kPrimaryColor;
    }
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        reservationId:
            json["ReservationID"] == null ? null : json["ReservationID"],
        reservationNo:
            json["ReservationNo"] == null ? null : json["ReservationNo"],
        roomTypeName:
            json["RoomTypeName"] == null ? null : json["RoomTypeName"],
        roomNo: json["RoomNo"] == null ? null : json["RoomNo"],
        statusTerm: json["Status_Term"] == null ? null : json["Status_Term"],
        checkInDate: json["CheckInDate"] == null ? null : json["CheckInDate"],
        checkOutDate: json["CheckOutDate"],
        noOfStay: json["NoOfStay"] == null ? null : json["NoOfStay"],
        stayTypeTerm:
            json["StayType_Term"] == null ? null : json["StayType_Term"],
        folioId: json["FolioID"] == null ? null : json["FolioID"],
        propertyName:
            json["PropertyName"] == null ? null : json["PropertyName"],
        totalCharges: json["TotalCharges"] == null
            ? null
            : json["TotalCharges"].toDouble(),
        rateName: json["RateName"] == null ? null : json["RateName"],
      );

  Map<String, dynamic> toJson() => {
        "ReservationID": reservationId == null ? null : reservationId,
        "ReservationNo": reservationNo == null ? null : reservationNo,
        "RoomTypeName": roomTypeName == null ? null : roomTypeName,
        "RoomNo": roomNo == null ? null : roomNo,
        "Status_Term": statusTerm == null ? null : statusTerm,
        "CheckInDate": checkInDate == null ? null : checkInDate,
        "CheckOutDate": checkOutDate,
        "NoOfStay": noOfStay == null ? null : noOfStay,
        "StayType_Term": stayTypeTerm == null ? null : stayTypeTerm,
        "FolioID": folioId == null ? null : folioId,
        "PropertyName": propertyName == null ? null : propertyName,
        "TotalCharges": totalCharges == null ? null : totalCharges,
        "RateName": rateName == null ? null : rateName,
      };
}
