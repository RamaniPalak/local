import 'package:intl/intl.dart';



class ResEvent {
  ResEvent({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  List<ResEventData>? data;
  int? statusCode;
  int? statusValueCode;

  factory ResEvent.fromJson(Map<String, dynamic> json) => ResEvent(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<ResEventData>.from(json["data"].map((x) => ResEventData.fromJson(x))),
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

class ResEventData {
  ResEventData({
    this.eventId,
    this.eventName,
    this.userId,
    this.propertyId,
    this.companyId,
    this.eventStartTime,
    this.eventEndTime,
    this.contactPerson,
    this.contactNumber,
    this.eventDescription,
    this.logoFile,
    this.eventImage,
    this.thumbnail,
    this.createdOn,
    this.createdBy,
    this.updatedOn,
    this.updatedBy,
    this.isActive,
  });

  String? eventId;
  String? eventName;
  String? userId;
  String? propertyId;
  String? companyId;
  String? eventStartTime;
  String? eventEndTime;
  String? contactPerson;
  String? contactNumber;
  String? eventDescription;
  String? logoFile;
  String? eventImage;
  String? thumbnail;
  DateTime? createdOn;
  String? createdBy;
  String? updatedOn;
  String? updatedBy;
  bool? isActive;



  String get startDate {
    try {
      final date = DateTime.parse(eventStartTime ?? '');

      String dateTime = DateFormat.yMMMMd().format(date);

      return dateTime;
    } on Exception catch (e) {
      print(e);
    }

    return '';
  }

  String get startTime {
    try {
      final time = DateTime.parse(eventStartTime ?? '');
      String dateTime = DateFormat.jm().format(time);

      return dateTime;
    } on Exception catch (e) {
      print(e);
    }

    return '';
  }

  factory ResEventData.fromJson(Map<String, dynamic> json) => ResEventData(
    eventId: json["eventID"] == null ? null : json["eventID"],
    eventName: json["eventName"] == null ? null : json["eventName"],
    userId: json["userID"] == null ? null : json["userID"],
    propertyId: json["propertyID"] == null ? null : json["propertyID"],
    companyId: json["companyID"] == null ? null : json["companyID"],
    eventStartTime: json["eventStartTime"] == null ? null : json["eventStartTime"],
    eventEndTime: json["eventEndTime"] == null ? null : json["eventEndTime"],
    contactPerson: json["contactPerson"] == null ? null : json["contactPerson"],
    contactNumber: json["contactNumber"] == null ? null : json["contactNumber"],
    eventDescription: json["eventDescription"] == null ? null : json["eventDescription"],
    logoFile: json["logoFile"],
    eventImage: json["eventImage"] == null ? null : json["eventImage"],
    thumbnail: json["thumbnail"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    updatedOn: json["updatedOn"] == null ? null : json["updatedOn"],
    updatedBy: json["updatedBy"],
    isActive: json["isActive"] == null ? null : json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "eventID": eventId == null ? null : eventId,
    "eventName": eventName == null ? null : eventName,
    "userID": userId == null ? null : userId,
    "propertyID": propertyId == null ? null : propertyId,
    "companyID": companyId == null ? null : companyId,
    "eventStartTime": eventStartTime == null ? null : eventStartTime,
    "eventEndTime": eventEndTime == null ? null : eventEndTime,
    "contactPerson": contactPerson == null ? null : contactPerson,
    "contactNumber": contactNumber == null ? null : contactNumber,
    "eventDescription": eventDescription == null ? null : eventDescription,
    "logoFile": logoFile,
    "eventImage": eventImage == null ? null : eventImage,
    "thumbnail": thumbnail,
    "createdOn": createdOn == null ? null : createdOn,
    "createdBy": createdBy == null ? null : createdBy,
    "updatedOn": updatedOn == null ? null : updatedOn,
    "updatedBy": updatedBy,
    "isActive": isActive == null ? null : isActive,
  };
}

