import 'package:flutter/material.dart';
import 'package:local/app/components/resrvation_components.dart';
import 'package:local/app/providers/auth_provider.dart';
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
      appBar: AppBar(
        title: const Text(
          'Reservation',
        ),
      ),
      body: reservationUser(),
    );
  }

  Widget reservationUser() {
    final profile = context.watch<AuthProviderImpl>();


    final hasError = profile.reservationUserRes?.state == Status.ERROR || profile.reservationUserRes?.state == Status.UNAUTHORISED;

    if(hasError){
      return Center(
          child: NoDataFoundView(retryCall: (){
        context.read<AuthProviderImpl>().reservationUser();
      },title: 'No Profile Data Found'));
    }

    if (profile.reservationUserRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    final data = profile.reservationUserRes?.data?.data;
    return ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              profile.setReservation(reservationData: data![index]);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ReservationComponent(
                  reserv: ReservationModel(
                      roomType: data?[index].roomTypeName,
                      resvId: data?[index].reservationId,
                      comapnyName: data?[index].companyName,
                      propertyName: data?[index].propertyName,
                      dateIssue: data?[index].checkInDate,
                      actionDate: data?[index].checkOutDate,
                      roomNo: data?[index].roomNo,
                      folioBal: data?[index].folioBalance)),
            ),
          );
        });
  }
}
