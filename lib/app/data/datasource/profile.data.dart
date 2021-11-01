import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/data/data_service/web_service.dart';
import 'package:local/app/data/entity/req_entity/req_updateuser.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_getbankdetail.dart';
import 'package:local/app/data/entity/res_entity/res_userdetail.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/user_prefs.dart';

abstract class ProfileData {
  Future<ResGetBankDetail> userBankDetail({required String memberId});

  Future<ResEmpty> updateBankDetails({required BankDetail data});

  Future<ResGetUserDetail> userDetail({required String memberId});

  Future<ResEmpty> updateUserProfile({required Meber data});
}

class ProfileDataImpl implements ProfileData {
  @override
  Future<ResGetBankDetail> userBankDetail({required String memberId}) async {
    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getBankDetail,
        queryParameters: {'memberId': user.memberID});

    try {
      return ResGetBankDetail.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> updateBankDetails({required BankDetail data}) async {
    final user = await UserPrefs.shared.getUser;

    data.memberId = user.memberID;

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.updateBankDetail, data: data.toJson());

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResEmpty> updateUserProfile({required Meber data}) async {
    final user = await UserPrefs.shared.getUser;

    data.memberId = user.memberID;

    final req = ReqUpdateUser(
        memberId: data.memberId, firstName: data.firstName, eMail: data.eMail,lastName: data.lastName);

    final res = await WebService.shared
        .postApiDIO(path: ServerConfigs.updateUserProfile, data: req.toJson());

    try {
      return ResEmpty.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }

  @override
  Future<ResGetUserDetail> userDetail({required String memberId}) async {
    final user = await UserPrefs.shared.getUser;

    final res = await WebService.shared.postApiDIO(
        path: ServerConfigs.getUserDetail,
        queryParameters: {'memberId': user.memberID});

    try {
      return ResGetUserDetail.fromJson(res!);
    } catch (e) {
      throw '$jsonParserErrorMsg';
    }
  }
}
