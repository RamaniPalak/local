import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/data/entity/res_entity/res_user_login.dart';
import 'package:local/app/data/entity/res_entity/res_userdetail.dart';
import 'package:local/app/providers/base_notifier.dart';
import 'package:local/app/repository/auth_repository.dart';
import 'package:local/app/utils/api_response.dart';
import 'package:local/app/utils/extensions.dart';
import 'package:local/app/utils/messages.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/utils/user_prefs.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AuthProvider {
  Future getUserFromLocal() async {}

  Future logInUser({required String mobile}) async {}

  Future logOutUser() async {}

  Future unAuthorizeUser() async {}

  Future reservationUser() async {}

  Future verifyOTP({required String otp, required Function closure}) async {}

  Future versionControl() async {}
}

class AuthProviderImpl extends BaseNotifier implements AuthProvider {
  late AuthRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  //Constructor
  AuthProviderImpl(this.repo) {
    getUserFromLocal();
    versionControl();
    _loginUserRes = ApiResponse();
    _logoutRes = ApiResponse();
    _reservationUserRes = ApiResponse();
  }

  //Variables
  bool? isLogin;

  bool? isReservationSelected;

  bool isNewUpdateAvailable = false;

  bool isAppUnderMaintenance = false;

  String? mobile;

  int? otp;

  //Api responses

  ApiResponse<ResLogin>? _loginUserRes;

  ApiResponse<ResLogin>? get loginUserRes => _loginUserRes;

  ApiResponse<ResReservation>? _reservationUserRes;

  ApiResponse<ResReservation>? get reservationUserRes => _reservationUserRes;

  ApiResponse<ResEmpty>? _logoutRes;

  ApiResponse<ResEmpty>? get logoutRes => _logoutRes;

  ResReservationData? selectedRes;

  Meber? member;

  setReservation({required ResReservationData reservationData}) {
    reservationData.isReservationSelected = true;

    Reservation.shared.setLocalData(user: reservationData);

    selectedRes = reservationData;

    isReservationSelected = true;
    notifyListeners();
  }

  @override
  Future getUserFromLocal() async {
    // TODO: Setting the perfect model for local user

    await Future.delayed(const Duration(seconds: 3));

    isLogin = await UserPrefs.shared.isUserLogin;

    selectedRes = await Reservation.shared.getReservation;

    isReservationSelected = selectedRes?.isReservationSelected;

    print('is User Logged in: $isLogin');

    print('is User Logged in: $isReservationSelected');

    notifyListeners();
  }

  //Apis
  @override
  Future logInUser({required String mobile}) async {
    try {
      apiResIsLoading(_loginUserRes!);

      if (mobile.trim().isEmpty) {
        throw emptyFieldsMsg;
      }

      if (!mobile.isValidMobile) {
        throw 'Please enter valid mobile number.';
      }

      final res = await repo.userLogin(mobile: mobile);

      if (res.success != true) {
        throw res.message ?? '';
      }

      this.otp = res.data?.otp;


      await UserPrefs.shared.setLocalData(

          user: LocalUser(
              isLogin: true,
              email: res.data?.logindetails?.eMail ?? '-',
              token: res.data?.token ?? '',
              mobile: res.data?.logindetails?.mobileNo ?? '-',
              memberID: res.data?.logindetails?.memberId ?? '-',
             displayName: '${member?.title ?? '-'} ${member?.firstName ?? '-'} ${member?.lastName ?? '-'}'));



      apiResIsSuccess(_loginUserRes!, res);

    } catch (e) {
      apiResIsFailed(_loginUserRes!, e);
      rethrow;
    }
  }

  @override
  Future logOutUser() async {
    try {
      isLogin = false;
      isReservationSelected = false;

      selectedRes = null;

      notifyListeners();

      UserPrefs.shared.clear();
      // apiResIsLoading(_logoutRes!);
      //
      // final user = await UserPrefs.shared.getUser;
      //
      // final res = await repo.userLogout(id: user.userID);
      //
      // if (res.status == 0) {
      //   throw res.message ?? '';
      // }else if (res.status == 2) {
      //   apiResIsUnAuthorise(_logoutRes!, res.message ?? '');
      // }else{
      //   await UserPrefs.shared.clear();
      //
      //   isLogin = false;
      //
      //   apiResIsSuccess(_logoutRes!, res);
      // }
    } catch (e) {
      apiResIsFailed(_logoutRes!, e);
    }
  }

  selectReservation() {
    isReservationSelected = false;
    notifyListeners();
  }

  @override
  Future unAuthorizeUser() async {
    await UserPrefs.shared.clear();

    isLogin = false;

    notifyListeners();
  }

  @override
  Future verifyOTP({required String otp, required Function closure}) async {
    try {
      if (otp.trim().isEmpty) {
        throw emptyFieldsMsg;
      }

      if (otp == this.otp.toString()) {
        isLogin = true;

        await UserPrefs.shared. setLocalData(
            user: LocalUser(
          memberID: loginUserRes?.data?.data?.logindetails?.memberId ?? '-',
          token: loginUserRes?.data?.data?.token ?? '',
          email: loginUserRes?.data?.data?.logindetails?.eMail ?? '-',
          mobile: loginUserRes?.data?.data?.logindetails?.mobileNo ?? '-',
          displayName:  '${member?.title ?? '-'} ${member?.firstName ?? '-'} ${member?.lastName ?? '-'}',
          isLogin: true,
        ));
        notifyListeners();

        closure();
      } else {
        throw 'Please enter valid otp';
      }
    } catch (e) {
      rethrow;
    }
  }

  bool checkForNewUpdateAvailable(
      {required String serverVersion, required String mobileVersion}) {
    try {
      final serverVersions = serverVersion.split('.');
      final localVersions = mobileVersion.split('.');

      var isLocalBig = false;

      for (var i = 0; i < serverVersions.length; i++) {
        final serverVersion = int.parse(serverVersions[i]);
        final localVersion = int.parse(localVersions[i]);

        print(
            'mobile = $localVersion server = $serverVersion check ${serverVersion > localVersion}');

        if (serverVersion == localVersion) {
          continue;
        }

        isLocalBig = !(serverVersion < localVersion);

        if (serverVersion > localVersion) {
          break;
        }
      }

      return isLocalBig;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future versionControl() async {
    isNewUpdateAvailable = checkForNewUpdateAvailable(
        serverVersion: '1.0.0', mobileVersion: '1.0.0');
    print('Is new update $isNewUpdateAvailable');
    notifyListeners();
  }

  @override
  Future reservationUser() async {
    try {
      apiResIsLoading(_reservationUserRes!);

      final res = await repo.userReservation();

      if (res.success != true || (res.data?.length ?? 0) <= 0) {
        apiResIsFailed(_reservationUserRes!, res.message ?? '');
      } else {
        print(res.data?.length);

        final selectedRes = await res.selectedReservation;

        if(selectedRes != null){
          selectedRes.isReservationSelected = true;
          Reservation.shared.setLocalData(user: selectedRes);
        }

        apiResIsSuccess(_reservationUserRes!, res);

      }
    } catch (e) {
      print(e);
      apiResIsFailed(_reservationUserRes!, e.toString());
    }
  }
}
