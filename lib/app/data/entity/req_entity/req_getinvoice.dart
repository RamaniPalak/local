

class ReqGetInvoice {
  ReqGetInvoice({
    this.companyId,
    this.propertyId,
    this.reservationId,
    this.memberId,
    this.invoiceId,
  });

  String? companyId;
  String? propertyId;
  String? reservationId;
  String? memberId;
  String? invoiceId;

  factory ReqGetInvoice.fromJson(Map<String, dynamic> json) => ReqGetInvoice(
    companyId: json["CompanyID"] == null ? null : json["CompanyID"],
    propertyId: json["PropertyID"] == null ? null : json["PropertyID"],
    reservationId: json["ReservationID"] == null ? null : json["ReservationID"],
    memberId: json["MemberID"] == null ? null : json["MemberID"],
    invoiceId: json["InvoiceID"] == null ? null : json["InvoiceID"],
  );

  Map<String, dynamic> toJson() => {
    "CompanyID": companyId == null ? null : companyId,
    "PropertyID": propertyId == null ? null : propertyId,
    "ReservationID": reservationId == null ? null : reservationId,
    "MemberID": memberId == null ? null : memberId,
    "InvoiceID": invoiceId == null ? null : invoiceId,
  };
}
