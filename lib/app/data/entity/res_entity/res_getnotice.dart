import 'package:flutter/cupertino.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';

class ResGetNotice {
  ResGetNotice({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  ResGetNoticeData? data;
  int? statusCode;
  int? statusValueCode;

  factory ResGetNotice.fromJson(Map<String, dynamic> json) => ResGetNotice(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : ResGetNoticeData.fromJson(json["data"]),
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        statusValueCode:
            json["statusValueCode"] == null ? null : json["statusValueCode"],
      );
}

class ResGetNoticeData {
  ResGetNoticeData({
    this.data,
  });

  List<Datum>? data;

  factory ResGetNoticeData.fromJson(Map<String, dynamic> json) =>
      ResGetNoticeData(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum(
      {this.noticeTypeTerm,
      this.note,
      this.dateOfIssue,
      this.actionDate,
      this.statusTerm,
      this.reservationNo});

  String? noticeTypeTerm;
  String? note;
  String? dateOfIssue;
  String? actionDate;
  String? statusTerm;
  String? reservationNo;

  NoticeTypeTerm? get noticeType {
    return noticeTypeTermValue.map[noticeTypeTerm ?? ''];
  }

  String? get noticeText {
    switch (noticeType) {
      case NoticeTypeTerm.Checkout:
        return 'Checkout';
        break;
      case NoticeTypeTerm.Extension:
        return 'Extension';
        break;
      case NoticeTypeTerm.MoveRoom:
        return 'MoveRoom';
        break;
      default:
        return '';
    }
  }

  NoticeStatusTerm? get noticeStatusTerm {
    return statusTermValue.map[statusTerm ?? ''];
  }

  Color? get statusColor {
    switch (noticeStatusTerm) {
      case NoticeStatusTerm.Open:
        return greenColor;
        break;
      case NoticeStatusTerm.Approved:
        return greenColor;
        break;
      case NoticeStatusTerm.Closed:
        return kRedColor;
        break;
      default:
        return kPrimaryColor;
    }
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        noticeTypeTerm: json["NoticeType_Term"],
        note: json["Note"] == null ? null : json["Note"],
        dateOfIssue: json["DateOfIssue"] == null ? null : json["DateOfIssue"],
        actionDate: json["ActionDate"] == null ? null : json["ActionDate"],
        statusTerm: json["Status_Term"] == null ? null : json["Status_Term"],
        reservationNo:
            json["ReservationNo"] == null ? null : json["ReservationNo"],
      );
}
