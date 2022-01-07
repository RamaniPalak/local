import 'package:dio/dio.dart';
import 'package:local/app/utils/reservation.dart';

class ReqAddComplain {
  ReqAddComplain({
    this.ticketTitle,
    this.issueRelatedTypeTerm,
    this.companyId,
    this.propertyId,
    this.ticketNote,
    this.priorityTerm,
    this.ComplainFiles,
    this.reservationID,
    this.roomTypeID,
    this.roomID
  });

  String? ticketTitle;
  String? issueRelatedTypeTerm;
  String? companyId;
  String? propertyId;
  String? ticketNote;
  String? priorityTerm;
  String?  reservationID;
  String?  roomTypeID;
  String?  roomID;
  List<MultipartFile>? ComplainFiles;

  factory ReqAddComplain.fromJson(Map<String, dynamic> json) => ReqAddComplain(
    ticketTitle: json["TicketTitle"] == null ? null : json["TicketTitle"],
    issueRelatedTypeTerm: json["IssueRelatedType_Term"] == null ? null : json["IssueRelatedType_Term"],
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationID: json["ReservationID"] == null ? null : json["ReservationID"],
    roomTypeID: json["RoomTypeID"] == null ? null : json["RoomTypeID"],
    roomID: json["RoomID"] == null ? null : json["RoomID"],
    ticketNote: json["TicketNote"] == null ? null : json["TicketNote"],
    priorityTerm: json["Priority_Term"] == null ? null : json["Priority_Term"],
  );

  Future<Map<String, dynamic>> toJson() async {

    final res = await Reservation.shared.getReservation;

    return {
      "TicketTitle": ticketTitle == null ? null : ticketTitle,
      "IssueRelatedType_Term": issueRelatedTypeTerm == null ? null : issueRelatedTypeTerm,
      "CompanyID": res.companyId,
      "PropertyID": res.propertyId,
      "ReservationID":res.reservationId,
      "RoomTypeID": res.roomTypeId,
      "RoomID": res.roomId,
      "TicketNote": ticketNote == null ? null : ticketNote,
      "Priority_Term": priorityTerm == null ? null : priorityTerm,
      'ComplainFiles' : ComplainFiles == null ? null :ComplainFiles
    };
  }
}
