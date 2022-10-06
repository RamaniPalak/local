import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';

class ResComplain {
  ResComplain({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  List<ResComplainData>? data;
  int? statusCode;
  int? statusValueCode;

  factory ResComplain.fromJson(Map<String, dynamic> json) => ResComplain(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<ResComplainData>.from(
                json["data"].map((x) => ResComplainData.fromJson(x))),
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

class ResComplainData {
  ResComplainData({
    this.ticketTitle,
    this.companyId,
    this.propertyId,
    this.ticketNote,
    this.ticketStatusTerm,
    this.priorityTerm,
    this.reservationId,
    this.issueRelatedTypeTerm,
  });

  String? ticketTitle;
  String? companyId;
  String? propertyId;
  String? ticketNote;
  String? ticketStatusTerm;
  String? priorityTerm;
  String? reservationId;
  String? issueRelatedTypeTerm;

  ComplainPriorityStatus? get complainStatusPriorityTerm {
    return complainPriorityStatusValue.map[priorityTerm ?? ''];
  }

  Color? get priorityColor {
    switch (complainStatusPriorityTerm) {
      case ComplainPriorityStatus.High:
        return kRedColor;
        break;
      case ComplainPriorityStatus.Medium:
        return yellowColor;
        break;
      case ComplainPriorityStatus.Low:
        return greyColor;
        break;
      default:
        return kPrimaryColor;
    }
  }

  ComplainStatus? get complainStatusTerm {
    return complainStatusValue.map[ticketStatusTerm ?? ''];
  }

  Color? get statusColor {
    switch (complainStatusTerm) {
      case ComplainStatus.Open:
        return greenColor;
        break;
      case ComplainStatus.Close:
        return kRedColor;
        break;
      default:
        return kPrimaryColor;
    }
  }

  factory ResComplainData.fromJson(Map<String, dynamic> json) =>
      ResComplainData(
        ticketTitle: json["ticketTitle"] == null ? null : json["ticketTitle"],
        companyId: json["companyID"] == null ? null : json["companyID"],
        propertyId: json["propertyID"] == null ? null : json["propertyID"],
        ticketNote: json["ticketNote"] == null ? null : json["ticketNote"],
        ticketStatusTerm: json["ticketStatus_Term"] == null
            ? null
            : json["ticketStatus_Term"],
        priorityTerm:
            json["priority_Term"] == null ? null : json["priority_Term"],
        reservationId: json["reservationID"],
        issueRelatedTypeTerm: json["issueRelatedType_Term"] == null
            ? null
            : json["issueRelatedType_Term"],
      );

  Map<String, dynamic> toJson() => {
        "ticketTitle": ticketTitle == null ? null : ticketTitle,
        "companyID": companyId == null ? null : companyId,
        "propertyID": propertyId == null ? null : propertyId,
        "ticketNote": ticketNote == null ? null : ticketNote,
        "ticketStatus_Term": ticketStatusTerm == null ? null : ticketStatusTerm,
        "priority_Term": priorityTerm == null ? null : priorityTerm,
        "reservationID": reservationId,
        "issueRelatedType_Term":
            issueRelatedTypeTerm == null ? null : issueRelatedTypeTerm,
      };
}
