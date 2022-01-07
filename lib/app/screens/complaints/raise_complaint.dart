import 'package:flutter/material.dart';
import 'package:local/app/components/raise_components.dart';
import 'package:local/app/providers/list_provider.dart';
import 'package:local/app/screens/complaints/new_complaint_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/no_data_found_view.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class RaiseComplaint extends StatefulWidget {
  const RaiseComplaint({Key? key}) : super(key: key);

  @override
  _RaiseComplaintState createState() => _RaiseComplaintState();
}

class _RaiseComplaintState extends State<RaiseComplaint> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<ListProviderImpl>().getComplain();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raise Complaints',
        ),
      ),
      body: Container(child: getComplain()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => NewComplaintsScreen()))
              .then((value) {
            if (value == true) {
              context.read<ListProviderImpl>().getComplain();
            }
          });
        },
        child: Container(
            height: kFlexibleSize(20),
            width: kFlexibleSize(20),
            child: addImage),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Widget getComplain() {
    final complain = context.watch<ListProviderImpl>();

    final data = complain.getComplainRes?.data?.data;

    final hasError = complain.getComplainRes?.state == Status.ERROR ||
        complain.getComplainRes?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: NoDataFoundView(
              retryCall: () {
                context.read<ListProviderImpl>().getComplain();
              },
              title: 'No Data Found'));
    }

    if (complain.getComplainRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    return ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return RaiseComponent(
            btntext: data?[index].priorityTerm ?? '-',
            Statustext: data?[index].ticketStatusTerm ?? '-',
            raiseModel: RaiseModel(
                title: data?[index].ticketTitle ?? '-',
                relatedTo: data?[index].issueRelatedTypeTerm ?? '-',
                statusColor: data?[index].statusColor,
                color: data?[index].priorityColor,
            note: data?[index].ticketNote ?? '-'),
          );
        });
  }
}
