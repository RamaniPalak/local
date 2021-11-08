import 'package:local/app/utils/enums.dart';

class ResGetDocument {
  ResGetDocument({
    this.success,
    this.message,
    this.data,
    this.statusCode,
    this.statusValueCode,
  });

  bool? success;
  String? message;
  List<ResGetDocumentData>? data;
  int? statusCode;
  int? statusValueCode;

  factory ResGetDocument.fromJson(Map<String, dynamic> json) => ResGetDocument(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<ResGetDocumentData>.from(
                json["data"].map((x) => ResGetDocumentData.fromJson(x))),
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

class ResGetDocumentData {
  ResGetDocumentData({
    this.documentId,
    this.associattionId,
    this.associationTypeTerm,
    this.documentTypeTerm,
    this.documentTitle,
    this.fileName,
    this.documentFile,
    this.documentPath,
    this.note,
    this.documentNo,
    this.validTill,
    this.thumbnail,
    this.statusTerm,
    this.refDocumentId,
    this.orderNo,
    this.uploadedBy,
    this.uploadedOn,
    this.updateLog,
    this.companyId,
    this.propertyId,
    this.isActive,
    this.seqNo,
    this.isSynch,
    this.synchOn,
    this.documentFileObj,
    this.memberId,
    this.originalDocumentPath,
    this.icon,
    this.isDelete,
  });

  String? documentId;
  String? associattionId;
  String? associationTypeTerm;
  String? documentTypeTerm;
  String? documentTitle;
  String? fileName;
  String? documentFile;
  String? documentPath;
  String? note;
  String? documentNo;
  DateTime? validTill;
  String? thumbnail;
  String? statusTerm;
  String? refDocumentId;
  int? orderNo;
  String? uploadedBy;
  String? uploadedOn;
  DateTime? updateLog;
  String? companyId;
  String? propertyId;
  bool? isActive;
  int? seqNo;
  bool? isSynch;
  String? synchOn;
  String? documentFileObj;
  String? memberId;
  String? originalDocumentPath;
  String? icon;
  String? isDelete;

  DocumentTitleTerm? get docTitleText {
    return documentTitleValue.map[documentTitle ?? ''];
  }

  String? get docText {
    switch (docTitleText) {
      case DocumentTitleTerm.AadharCard:
        return 'Aadhar Card';
        break;
      case DocumentTitleTerm.DrivingLicense:
        return 'Driving License';
        break;
      case DocumentTitleTerm.EmployeeCard:
        return 'Employee Card';
        break;
      default:
        return '';
    }
  }

  factory ResGetDocumentData.fromJson(Map<String, dynamic> json) =>
      ResGetDocumentData(
        documentId: json["documentID"] == null ? null : json["documentID"],
        associattionId:
            json["associattionID"] == null ? null : json["associattionID"],
        associationTypeTerm: json["associationType_Term"] == null
            ? null
            : json["associationType_Term"],
        documentTypeTerm: json["documentType_Term"] == null
            ? null
            : json["documentType_Term"],
        documentTitle:
            json["documentTitle"] == null ? null : json["documentTitle"],
        fileName: json["fileName"] == null ? null : json["fileName"],
        documentFile: json["documentFile"],
        documentPath:
            json["documentPath"] == null ? null : json["documentPath"],
        note: json["note"],
        documentNo: json["documentNo"] == null ? null : json["documentNo"],
        validTill: json["validTill"] == null
            ? null
            : DateTime.parse(json["validTill"]),
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        statusTerm: json["status_Term"] == null ? null : json["status_Term"],
        refDocumentId: json["refDocumentID"],
        orderNo: json["orderNo"] == null ? null : json["orderNo"],
        uploadedBy: json["uploadedBy"],
        uploadedOn: json["uploadedOn"],
        updateLog: json["updateLog"] == null
            ? null
            : DateTime.parse(json["updateLog"]),
        companyId: json["companyID"] == null ? null : json["companyID"],
        propertyId: json["propertyID"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        seqNo: json["seqNo"] == null ? null : json["seqNo"],
        isSynch: json["isSynch"] == null ? null : json["isSynch"],
        synchOn: json["synchOn"],
        documentFileObj: json["documentFileObj"],
        memberId: json["memberID"] == null ? null : json["memberID"],
        originalDocumentPath: json["originalDocumentPath"] == null
            ? null
            : json["originalDocumentPath"],
        icon: json["icon"],
        isDelete: json["isDelete"],
      );

  Map<String, dynamic> toJson() => {
        "documentID": documentId == null ? null : documentId,
        "associattionID": associattionId == null ? null : associattionId,
        "associationType_Term":
            associationTypeTerm == null ? null : associationTypeTerm,
        "documentType_Term": documentTypeTerm == null ? null : documentTypeTerm,
        "documentTitle": documentTitle == null ? null : documentTitle,
        "fileName": fileName == null ? null : fileName,
        "documentFile": documentFile,
        "documentPath": documentPath == null ? null : documentPath,
        "note": note,
        "documentNo": documentNo == null ? null : documentNo,
        "validTill": validTill == null ? null : validTill!.toIso8601String(),
        "thumbnail": thumbnail ?? null,
        "status_Term": statusTerm == null ? null : statusTerm,
        "refDocumentID": refDocumentId,
        "orderNo": orderNo == null ? null : orderNo,
        "uploadedBy": uploadedBy,
        "uploadedOn": uploadedOn,
        "updateLog": updateLog == null ? null : updateLog!.toIso8601String(),
        "companyID": companyId == null ? null : companyId,
        "propertyID": propertyId,
        "isActive": isActive == null ? null : isActive,
        "seqNo": seqNo == null ? null : seqNo,
        "isSynch": isSynch == null ? null : isSynch,
        "synchOn": synchOn,
        "documentFileObj": documentFileObj,
        "memberID": memberId == null ? null : memberId,
        "originalDocumentPath":
            originalDocumentPath == null ? null : originalDocumentPath,
        "icon": icon,
        "isDelete": isDelete,
      };
}
