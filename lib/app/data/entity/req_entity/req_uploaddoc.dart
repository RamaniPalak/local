import 'package:dio/dio.dart';
import 'package:local/app/utils/reservation.dart';

class ReqUploadDoc {
  ReqUploadDoc({
    this.documentNo,
    this.thambill,
    this.documentTitle,
  });

  String? documentNo;
  MultipartFile? thambill;
  String? documentTitle;

  Future<Map<String, dynamic>> toJson() async {

    final res = await Reservation.shared.getReservation;

    return {
      "CompanyID": res.companyId,
      "PropertyID": res.propertyId,
      "AssociattionID": res.memberId,
      "DocumentTitle" : documentTitle,
      "documentNo" : documentNo,
      "DocumentFile" : thambill,
      "associationType_Term":"MEMBER"
    };
  }
}
