import 'package:local/app/data/entity/res_entity/res_generateorderid.dart';
import 'package:local/app/data/entity/res_entity/res_transgetbyid.dart';
import 'package:local/app/providers/base_notifier.dart';
import 'package:local/app/repository/razorpay_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RazorPayProvider {
  Future generateOrderId() async {}

  Future transGetById() async {}
}

class RazorPayProviderImpl extends BaseNotifier implements RazorPayProvider {
  late RazorPayRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  RazorPayProviderImpl(this.repo) {
    _generateOrderIdRes = ApiResponse();
    _transGetByIdRes = ApiResponse();
  }

  ApiResponse<ResGenerateOrderId>? _generateOrderIdRes;

  ApiResponse<ResGenerateOrderId>? get generateOrderIdRes =>
      _generateOrderIdRes;

  ApiResponse<ResTransGetbyId>? _transGetByIdRes;

  ApiResponse<ResTransGetbyId>? get transGetByIdRes => _transGetByIdRes;

 // ResGenerateOrderIdData? generateOrderIdData;

  String? orderID;
  String? refTransId;


  @override
  Future generateOrderId() async {
    try {
      apiResIsLoading(_generateOrderIdRes!);

      final res = await repo.generateOrderId();

      if (res.success != true) {
        apiResIsFailed(_generateOrderIdRes!, res.message ?? '');
      } else {
        orderID = res.data?.orderId;
        refTransId = res.data?.refRazorPayTransId;
        print('order${orderID = res.data?.orderId}');
        apiResIsSuccess(_generateOrderIdRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_generateOrderIdRes!, e.toString());
    }
  }

  @override
  Future transGetById() async {
    try {
      apiResIsLoading(_transGetByIdRes!);

      final res = await repo.transGetById(
          orderID: orderID, refRazorPayTransId: refTransId);

      if (res.success != true) {
        apiResIsFailed(_transGetByIdRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_transGetByIdRes!, res);

      }
    } catch (e) {
      print(e);
      apiResIsFailed(_transGetByIdRes!, e.toString());
    }
  }
}
