

class ReqMsgInsert {
  ReqMsgInsert({
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
    this.messageDate,
  });

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
  DateTime? messageDate;

  factory ReqMsgInsert.fromJson(Map<String, dynamic> json) => ReqMsgInsert(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationId: json["ReservationID"] == null ? null : json["ReservationID"],
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    associationId: json["AssociationID"] == null ? null : json["AssociationID"],
    associationTypeTerm: json["AssociationType_Term"] == null ? null : json["AssociationType_Term"],
    refMsgToFrontDeskId: json["RefMsgToFrontDeskID"] == null ? null : json["RefMsgToFrontDeskID"],
    message: json["Message"] == null ? null : json["Message"],
    checkedOn: json["CheckedOn"] == null ? null : DateTime.parse(json["CheckedOn"]),
    createdBy: json["CreatedBy"] == null ? null : json["CreatedBy"],
    messageDate: json["MessageDate"] == null ? null : DateTime.parse(json["MessageDate"]),
  );

  Map<String, dynamic> toJson() => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "ReservationID": reservationId == null ? null : reservationId,
    "MemberID": memberId == null ? null : memberId,
    "AssociationID": associationId == null ? null : associationId,
    "AssociationType_Term": associationTypeTerm == null ? null : associationTypeTerm,
    "RefMsgToFrontDeskID": refMsgToFrontDeskId == null ? null : refMsgToFrontDeskId,
    "Message": message == null ? null : message,
    "CheckedOn": DateTime.now().toIso8601String(),
    "CreatedBy": createdBy == null ? null : createdBy,
    "MessageDate": DateTime.now().toIso8601String(),
  };
}
