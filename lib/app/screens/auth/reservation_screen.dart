import 'package:flutter/material.dart';
import 'package:local/app/components/resrvation_components.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/no_data_found_view.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<AuthProviderImpl>().reservationUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffe5e5e5),
      appBar: AppBar(
        title: const Text(
          'Reservation',
        ),
      ),
      body: Container(
          padding: EdgeInsets.only(
              left: kFlexibleSize(10), right: kFlexibleSize(10)),
          child: reservationUser()),
    );
  }

  Widget reservationUser() {
    final reservation = context.watch<AuthProviderImpl>();

    final hasError = reservation.reservationUserRes?.state == Status.ERROR ||
        reservation.reservationUserRes?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: NoDataFoundView(
              retryCall: () {
                context.read<AuthProviderImpl>().reservationUser();
              },
              title: 'No  Data Found'));
    }
    final data = reservation.reservationUserRes?.data?.data;

    if (reservation.reservationUserRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    return ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          print(reservation.selectedResData?.reservationId);

          final isSelected =
              reservation.selectedResData?.reservationId == data?[index].reservationId;

          return InkWell(
            onTap: () {
              reservation.setReservation(reservationData: data![index]);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReservationComponent(
                  isReserSelect: isSelected,
                  reserv: ReservationModel(
                      roomType: data?[index].roomTypeName ?? '-',
                      resvId: data?[index].reservationNo ?? '-',
                      companyName: data?[index].companyName ?? '-',
                      propertyName: data?[index].propertyName ?? '-',
                      dateIssue: data?[index].checkInDate ?? '-',
                      actionDate: data?[index].checkOutDate ??'-',
                      roomNo: data?[index].roomNo ??'-',
                      folioBal: data?[index].folioBalance ?? '-')),
            ),
          );
        });
  }
}
