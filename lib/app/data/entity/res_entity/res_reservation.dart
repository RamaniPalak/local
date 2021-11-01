

class ResReservation {
  ResReservation({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  List<ResReservationData>? data;
  int? statusCode;
  int? statusValueCode;

  factory ResReservation.fromJson(Map<String, dynamic> json) => ResReservation(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<ResReservationData>.from(json["data"].map((x) => ResReservationData.fromJson(x))),
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

class ResReservationData {
  ResReservationData({
    this.reservationId,
    this.reservationNo,
    this.companyId,
    this.propertyId,
    this.memberId,
    this.roomTypeId,
    this.roomId,
    this.checkInDate,
    this.checkOutDate,
    this.actualCheckInDate,
    this.actualCheckOutDate,
    this.roomNo,
    this.memberName,
    this.roomTypeName,
    this.folioBalance,
    this.propertyName,
    this.companyName,
    this.memberFolioId,
    this.invoiceId,
    this.isReservationSelected
  });

  String? reservationId;
  String? reservationNo;
  String? companyId;
  String? propertyId;
  String? memberId;
  String? roomTypeId;
  String? roomId;
  String? checkInDate;
  String? checkOutDate;
  String? actualCheckInDate;
  String? actualCheckOutDate;
  String? roomNo;
  String? memberName;
  String? roomTypeName;
  String? folioBalance;
  String? propertyName;
  String? companyName;
  String? memberFolioId;
  String? invoiceId;
  bool? isReservationSelected;

  factory ResReservationData.fromJson(Map<String, dynamic> json) => ResReservationData(
    reservationId: json["reservationID"] == null ? null : json["reservationID"],
    reservationNo: json["reservationNo"] == null ? null : json["reservationNo"],
    companyId: json["companyID"] == null ? null : json["companyID"],
    propertyId: json["propertyID"] == null ? null : json["propertyID"],
    memberId: json["memberID"] == null ? null : json["memberID"],
    roomTypeId: json["roomTypeID"] == null ? null : json["roomTypeID"],
    roomId: json["roomID"] == null ? null : json["roomID"],
    checkInDate: json["checkInDate"] == null ? null : json["checkInDate"],
    checkOutDate: json["checkOutDate"] == null ? null : json["checkOutDate"],
    actualCheckInDate: json["actualCheckInDate"] == null ? null : json["actualCheckInDate"],
    actualCheckOutDate: json["actualCheckOutDate"] == null ? null : json["actualCheckOutDate"],
    roomNo: json["roomNo"] == null ? null : json["roomNo"],
    memberName: json["memberName"] == null ? null : json["memberName"],
    roomTypeName: json["roomTypeName"] == null ? null : json["roomTypeName"],
    folioBalance: json["folioBalance"] == null ? null : json["folioBalance"],
    propertyName: json["propertyName"] == null ? null : json["propertyName"],
    companyName: json["companyName"] == null ? null : json["companyName"],
    memberFolioId: json["memberFolioID"] == null ? null : json["memberFolioID"],
    invoiceId: json["invoiceID"] == null ? null : json["invoiceID"],
  );

  Map<String, dynamic> toJson() => {
    "reservationID": reservationId == null ? null : reservationId,
    "reservationNo": reservationNo == null ? null : reservationNo,
    "companyID": companyId == null ? null : companyId,
    "propertyID": propertyId == null ? null : propertyId,
    "memberID": memberId == null ? null : memberId,
    "roomTypeID": roomTypeId == null ? null : roomTypeId,
    "roomID": roomId == null ? null : roomId,
    "checkInDate": checkInDate == null ? null : checkInDate,
    "checkOutDate": checkOutDate == null ? null : checkOutDate,
    "actualCheckInDate": actualCheckInDate == null ? null : actualCheckInDate,
    "actualCheckOutDate": actualCheckOutDate == null ? null : actualCheckOutDate,
    "roomNo": roomNo == null ? null : roomNo,
    "memberName": memberName == null ? null : memberName,
    "roomTypeName": roomTypeName == null ? null : roomTypeName,
    "folioBalance": folioBalance == null ? null : folioBalance,
    "propertyName": propertyName == null ? null : propertyName,
    "companyName": companyName == null ? null : companyName,
    "memberFolioID": memberFolioId == null ? null : memberFolioId,
    "invoiceID": invoiceId == null ? null : invoiceId,
  };
}
