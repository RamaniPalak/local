import 'package:local/app/data/datasource/razorpay_data.dart';
import 'package:local/app/data/entity/res_entity/res_generateorderid.dart';
import 'package:local/app/data/entity/res_entity/res_transgetbyid.dart';

class RazorPayRepository {
  final RazorPayData dataSource;

  RazorPayRepository({required this.dataSource});

  Future<ResGenerateOrderId> generateOrderId() async {
    return await dataSource.generateOrderId();
  }

  Future<ResTransGetbyId> transGetById(
      {String? orderID, String? refRazorPayTransId}) async {
    return await dataSource.transGetById(
        orderID: orderID, refRazorPayTransId: refRazorPayTransId);
  }
}
