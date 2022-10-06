import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';


class ResHouseKeeping {
  ResHouseKeeping({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  ResHouseKeepingData? data;
  int? statusCode;
  int? statusValueCode;

  factory ResHouseKeeping.fromJson(Map<String, dynamic> json) => ResHouseKeeping(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResHouseKeepingData.fromJson(json["data"]),
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

class ResHouseKeepingData {
  ResHouseKeepingData({
    this.masterHouseKeepingScheduleRes,
  });

  List<MasterHouseKeepingScheduleRe>? masterHouseKeepingScheduleRes;

  factory ResHouseKeepingData.fromJson(Map<String, dynamic> json) => ResHouseKeepingData(
    masterHouseKeepingScheduleRes: json["masterHouseKeepingScheduleRes"] == null ? null : List<MasterHouseKeepingScheduleRe>.from(json["masterHouseKeepingScheduleRes"].map((x) => MasterHouseKeepingScheduleRe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "masterHouseKeepingScheduleRes": masterHouseKeepingScheduleRes == null ? null : List<dynamic>.from(masterHouseKeepingScheduleRes!.map((x) => x.toJson())),
  };
}

class MasterHouseKeepingScheduleRe {
  MasterHouseKeepingScheduleRe({
    this.date,
    this.type,
    this.hkp,
  });

  String? date;
  String? type;
  Hkp? hkp;

  factory MasterHouseKeepingScheduleRe.fromJson(Map<String, dynamic> json) => MasterHouseKeepingScheduleRe(
    date: json["date"] == null ? null : json["date"],
    type: json["type"] == null ? null : json["type"],
    hkp: json["hkp"] == null ? null : Hkp.fromJson(json["hkp"]),
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date,
    "type": type == null ? null : type,
    "hkp": hkp == null ? null : hkp!.toJson(),
  };
}

class Hkp {
  Hkp({
    this.roomid,
    this.hkpReservationId,
    this.roomno,
    this.hkpSectionid,
    this.hkpSectionname,
    this.reservationNo,
    this.roomtypeid,
    this.roomtypename,
    this.hkpDate,
    this.hkpTypeTerm,
    this.cleanTypeTerm,
    this.roomStatusTerm,
    this.housekeeperId,
    this.housekeeperName,
    this.reservationstatus,
    this.reservationdetails,
    this.updateLog,
    this.profilePic,
    this.mobileNo,
    this.employeeId,
    this.companyId,
    this.hkpStatusTerm
  });

  String? roomid;
  String? hkpReservationId;
  String? roomno;
  String? hkpSectionid;
  String? hkpSectionname;
  String? reservationNo;
  String? roomtypeid;
  String? roomtypename;
  String? hkpDate;
  String? hkpTypeTerm;
  String? cleanTypeTerm;
  String? roomStatusTerm;
  String? housekeeperId;
  String? housekeeperName;
  String? reservationstatus;
  String? reservationdetails;
  DateTime? updateLog;
  String? profilePic;
  String? hkpStatusTerm;
  String? mobileNo;
  String? employeeId;
  String? companyId;



  String get startDate {
    try {
      final date = DateTime.parse(hkpDate ?? '');

      String dateTime = DateFormat('EEE').format(date);

      return dateTime[0];
    } on Exception catch (e) {
      print(e);
    }

    return '';
  }

  String get startDay {
    try {
      final date = DateTime.parse(hkpDate ?? '');

      String dateTime = DateFormat.d().format(date);

      return dateTime;
    } on Exception catch (e) {
      print(e);
    }

    return '';
  }


  String get hkpDateFormat {
    try {
      final date = DateTime.parse(hkpDate ?? '');

      String dateTime = DateFormat.yMMMMd().format(date);

      return dateTime;
    } on Exception catch (e) {
      print(e);
    }

    return '';
  }

  String get startTime {
    try {
      final time = DateTime.parse(hkpDate ?? '');
      String dateTime = DateFormat.jm().format(time);

      return dateTime;
    } on Exception catch (e) {
      print(e);
    }

    return '';
  }


  HousekeepingTerm? get hkpType {
    return housekeepingValues.map[cleanTypeTerm ?? ''];
  }

  Color? get hkpColor {
    switch (hkpType) {
      case HousekeepingTerm.Minimal:
        return kBgColor;
        break;
      case HousekeepingTerm.Full:
        return kBgRedColor;
        break;
      default:
        return kPrimaryColor;
    }
  }


  Color? get hkpColorText {
    switch (hkpType) {
      case HousekeepingTerm.Minimal:
        return kPrimaryColor;
        break;
      case HousekeepingTerm.Full:
        return kRedColor;
        break;
      default:
        return kPrimaryColor;
    }
  }

  DndTerm? get dndType {
    return dndTermValue.map[cleanTypeTerm ?? ''];
  }

  String? get dndText {
    switch (dndType) {
      case DndTerm.Dirty:
        return 'DND';
        break;
      case DndTerm.MarkAsDND:
        return 'Cancel DND';
        break;
      default:
        return 'DND';
    }
  }


  factory Hkp.fromJson(Map<String, dynamic> json) => Hkp(
    roomid: json["roomid"] == null ? null : json["roomid"],
    hkpReservationId: json["HKPReservationID"] == null ? null : json["HKPReservationID"],
    roomno: json["roomno"] == null ? null : json["roomno"],
    hkpSectionid: json["HKPSectionid"] == null ? null : json["HKPSectionid"],
    hkpSectionname: json["HKPSectionname"] == null ? null : json["HKPSectionname"],
    reservationNo: json["ReservationNo"] == null ? null : json["ReservationNo"],
    roomtypeid: json["roomtypeid"] == null ? null : json["roomtypeid"],
    roomtypename: json["roomtypename"] == null ? null : json["roomtypename"],
    hkpDate: json["hkpDate"] == null ? null : json["hkpDate"],
    hkpTypeTerm: json["hkpType_Term"] == null ? null : json["hkpType_Term"],
    cleanTypeTerm: json["CleanType_Term"] == null ? null : json["CleanType_Term"],
    roomStatusTerm: json["RoomStatus_Term"] == null ? null : json["RoomStatus_Term"],
    housekeeperId: json["HousekeeperID"],
    housekeeperName: json["HousekeeperName"],
    reservationstatus: json["reservationstatus"] == null ? null : json["reservationstatus"],
    hkpStatusTerm: json["hkpStatus_Term"] == null ? null : json["hkpStatus_Term"],
    reservationdetails: json["reservationdetails"] == null ? null : json["reservationdetails"],
    updateLog: json["UpdateLog"] == null ? null : DateTime.parse(json["UpdateLog"]),
    profilePic: json["ProfilePic"],
    mobileNo: json["MobileNo"],
    employeeId: json["EmployeeID"],
    companyId: json["CompanyID"],
  );

  Map<String, dynamic> toJson() => {
    "roomid": roomid == null ? null : roomid,
    "HKPReservationID": hkpReservationId == null ? null : hkpReservationId,
    "roomno": roomno == null ? null : roomno,
    "HKPSectionid": hkpSectionid == null ? null : hkpSectionid,
    "HKPSectionname": hkpSectionname == null ? null : hkpSectionname,
    "ReservationNo": reservationNo == null ? null : reservationNo,
    "roomtypeid": roomtypeid == null ? null : roomtypeid,
    "roomtypename": roomtypename == null ? null : roomtypename,
    "hkpDate": hkpDate == null ? null : hkpDate,
    "hkpType_Term": hkpTypeTerm == null ? null : hkpTypeTerm,
    "CleanType_Term": cleanTypeTerm == null ? null : cleanTypeTerm,
    "RoomStatus_Term": roomStatusTerm == null ? null : roomStatusTerm,
    "HousekeeperID": housekeeperId,
    "HousekeeperName": housekeeperName,
    "reservationstatus": reservationstatus == null ? null : reservationstatus,
    "reservationdetails": reservationdetails == null ? null : reservationdetails,
    "hkpStatus_Term": hkpStatusTerm == null ? null : hkpStatusTerm,
    "UpdateLog": updateLog == null ? null : updateLog!.toIso8601String(),
    "ProfilePic": profilePic,
    "MobileNo": mobileNo,
    "EmployeeID": employeeId,
    "CompanyID": companyId,
  };
}
