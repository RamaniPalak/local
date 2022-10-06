import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_reservation.dart';
import 'package:local/app/data/entity/req_entity/req_user_logout.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/data/entity/res_entity/res_user_login.dart';
import 'package:local/app/utils/firebase.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/user_prefs.dart';

abstract class AuthData {
  Future<ResLogin> userLogin({required String mobile});

  Future<ResReservation> userReservation();

  Future<ResEmpty> userLogout({required int id});
}

class AuthDataImpl implements AuthData {

  @override
  Future<ResLogin> userLogin({required String mobile}) async {
    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.userLogin, queryParameters: {'mobileNo': mobile,'fcm_Token':FirebaseConfig.FCMToken});

    print('login ${mobile}');
    print('login ${FirebaseConfig.FCMToken}');

    try {
      return ResLogin.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> userLogout({required int id}) async {
    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.userLogout,
        data: ReqUserLogout(userId: id).toJson());

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResReservation> userReservation() async {
    final user = await UserPrefs.shared.getUser;

    final req = ReqReservation(memberId: user.memberID);

    print(req.toJson());

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.userReservation, data: req);

    try {
      return ResReservation.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
