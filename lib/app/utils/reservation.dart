import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reservation {
  static Reservation shared = Reservation();

  // Set Local Data here
  Future setLocalData({required ResReservationData user}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('IS_Reservation', user.isReservationSelected ?? false);

    prefs.setString('MEMBER_ID', user.memberId ?? '');
    prefs.setString('propertyName', user.propertyName ?? '');
    prefs.setString('companyId', user.companyId ?? '');
    prefs.setString('companyName', user.companyName ?? '');
    prefs.setString('memberName', user.memberName ?? '');
    prefs.setString('reservationId', user.reservationId ?? '');
    prefs.setString('reservationNo', user.reservationNo ?? '');
    prefs.setString('propertyId', user.propertyId ?? '');
    prefs.setString('folioBalance', user.folioBalance ?? '');
    prefs.setString('roomId', user.roomId ?? '');
    prefs.setString('roomNo', user.roomNo ?? '');
    prefs.setString('roomTypeId', user.roomTypeId ?? '');
    prefs.setString('roomTypeName', user.roomTypeName ?? '');

  }
  // Clear Local here
  Future<bool> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }

  // Get User here
  Future<ResReservationData> get getReservation => _getReservation();

  Future<ResReservationData> _getReservation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isReservation = prefs.getBool('IS_Reservation') ?? false;
    String memberId = prefs.getString('MEMBER_ID') ?? '';
    String propertyName = prefs.getString('propertyName') ?? '';
    String companyId = prefs.getString('companyId') ?? '';
    String companyName = prefs.getString('companyName') ?? '';
    String memberName = prefs.getString('memberName') ?? '';
    String reservationId = prefs.getString('reservationId') ?? '';
    String reservationNo = prefs.getString('reservationNo') ?? '';
    String propertyId = prefs.getString('propertyId') ?? '';
    String folioBalance = prefs.getString('folioBalance') ?? '';
    String roomId = prefs.getString('roomId') ?? '';
    String roomNo = prefs.getString('roomNo') ?? '';
    String roomTypeId = prefs.getString('roomTypeId') ?? '';
    String roomTypeName = prefs.getString('roomTypeName') ?? '';

    return ResReservationData(
        memberId: memberId,
        isReservationSelected: isReservation,
        propertyName: propertyName,
        companyId: companyId,
        companyName: companyName,
        memberName: memberName,
        reservationId: reservationId,
        reservationNo: reservationNo,
        propertyId: propertyId,
        folioBalance: folioBalance,
        roomId: roomId,
        roomNo: roomNo,
        roomTypeId: roomTypeId,
        roomTypeName: roomTypeName);
  }


  Future setMemberName({required String name}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('memberName', name);

  }

  // Get is login here
  Future<bool> get isUserReservation => _isUserReservation();

  Future<bool> _isUserReservation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isReservation = prefs.getBool('IS_Reservation') ?? false;

    return isReservation;
  }
}
