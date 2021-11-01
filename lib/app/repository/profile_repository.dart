import 'package:local/app/data/datasource/profile.data.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_getbankdetail.dart';
import 'package:local/app/data/entity/res_entity/res_user_login.dart';
import 'package:local/app/data/entity/res_entity/res_userdetail.dart';

class ProfileRepository {

  late final ProfileDataImpl dataSource;
  ProfileRepository({required this.dataSource});

  Future<ResGetBankDetail> userBankDetail({required String memberId}) async {
    return await dataSource.userBankDetail(memberId: memberId);
  }

  Future<ResEmpty> updateBankDetails({required BankDetail data}) async {
    return await dataSource.updateBankDetails(data: data);
  }

  Future<ResGetUserDetail> userDetail({required String memberId}) async {
    return await dataSource.userDetail(memberId: memberId);
  }

  Future<ResEmpty> updateUserProfile({required Meber data}) async {
    return await dataSource.updateUserProfile(data: data);
  }


}
