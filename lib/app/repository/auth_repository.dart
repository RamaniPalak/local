import 'package:local/app/data/datasource/auth_data.dart';
import 'package:local/app/data/entity/res_entity/res_empty.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/data/entity/res_entity/res_user_login.dart';

class AuthRepository {
  final AuthData dataSource;

  AuthRepository({required this.dataSource});

  Future<ResLogin> userLogin({required String mobile}) async {
    return await dataSource.userLogin(mobile: mobile);
  }

  Future<ResReservation> userReservation() async {
    return await dataSource.userReservation();
  }

  Future<ResEmpty> userLogout({required int id}) async {
    return await dataSource.userLogout(id: id);
  }
}
