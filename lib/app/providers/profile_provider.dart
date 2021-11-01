import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_getbankdetail.dart';
import 'package:local/app/data/entity/res_entity/res_user_login.dart';
import 'package:local/app/data/entity/res_entity/res_userdetail.dart';
import 'package:local/app/repository/profile_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/utils/user_prefs.dart';
import 'base_notifier.dart';

class ProfileProvider {
  Future userBankDetail() async {}

  Future userDetail() async {}

  Future updateBankDetails() async {}

  Future updateUserProfile() async {}
}

class ProfileProviderImpl extends BaseNotifier implements ProfileProvider {
  late ProfileRepository repo;

  ProfileProviderImpl(this.repo) {
    _userBankRes = ApiResponse();
    _updatedBankRes = ApiResponse();
    _updatedUserRes = ApiResponse();
    _userDetailRes = ApiResponse();
  }

  ApiResponse<ResGetBankDetail>? _userBankRes;

  ApiResponse<ResGetBankDetail>? get userBankRes => _userBankRes;

  ApiResponse<ResGetUserDetail>? _userDetailRes;

  ApiResponse<ResGetUserDetail>? get userDetailRes => _userDetailRes;

  ApiResponse<ResEmpty>? _updatedBankRes;

  ApiResponse<ResEmpty>? get updatedBankRes => _updatedBankRes;

  ApiResponse<ResEmpty>? _updatedUserRes;

  ApiResponse<ResEmpty>? get updatedUserRes => _updatedUserRes;

  BankDetail? userBankData;

  Meber? member;

  Logindetails? logindetails;

  @override
  Future userBankDetail() async {
    final user = await UserPrefs.shared.getUser;

    try {
      apiResIsLoading(_userBankRes!);

      final res = await repo.userBankDetail(memberId: user.memberID);

      if (res.success != true) {
        apiResIsFailed(_userBankRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_userBankRes!, res);

        userBankData = res.data?.bankDetail;
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_userBankRes!, e);
    }
  }

  @override
  Future updateBankDetails() async {
    try {
      apiResIsLoading(_updatedBankRes!);

      final res = await repo.updateBankDetails(data: userBankData!);

      if (res.success != true) {
        apiResIsFailed(_updatedBankRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_updatedBankRes!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updatedBankRes!, e);
    }
  }

  @override
  Future updateUserProfile() async {
    try {
      apiResIsLoading(_updatedUserRes!);

      final res = await repo.updateUserProfile(data: member!);

      if (res.success != true) {
        apiResIsFailed(_updatedUserRes!, res.message ?? '');
      } else {
        await userDetail();

        apiResIsSuccess(_updatedUserRes!, res);

      }
    } catch (e) {
      print(e);
      apiResIsFailed(_updatedUserRes!, e);
    }
  }

  @override
  Future userDetail() async {
    final user = await UserPrefs.shared.getUser;

    try {
      apiResIsLoading(_userDetailRes!);

      final res = await repo.userDetail(memberId: user.memberID);

      if (res.success != true) {
        apiResIsFailed(_userDetailRes!, res.message ?? '');
      } else {
        apiResIsSuccess(_userDetailRes!, res);
        member = res.data?.meber;
        UserPrefs.shared.setEmail(email: member?.eMail ?? '');
        Reservation.shared.setMemberName(name: member?.displayName ?? '');
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_userDetailRes!, e);
    }
  }
}
