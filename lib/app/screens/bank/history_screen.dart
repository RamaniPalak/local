import 'package:flutter/material.dart';
import 'package:local/app/components/history_components.dart';
import 'package:local/app/providers/list_provider.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/no_data_found_view.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<ListProviderImpl>().getHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text(
          'History',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: kFlexibleSize(20),
            right: kFlexibleSize(20),
            top: kFlexibleSize(10)),
        child: history(),
      ),
    );
  }

  Widget history() {
    final history = context.watch<ListProviderImpl>();
    final data = history.getHistoryRes?.data?.data;

    if (history.getHistoryRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    final hasError = history.getHistoryRes?.state == Status.ERROR ||
        history.getHistoryRes?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: NoDataFoundView(
              retryCall: () {
                context.read<ListProviderImpl>().getHistory();
              },
              title: 'No Data Found'));
    }
    return ListView.builder(
        itemCount: data?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return HistoryComponents(
            historyModel: HistoryModel(
              propertyName: data?[index].propertyName,
              roomNo: data?[index].roomNo,
              checkInDate: data?[index].checkInFormat,
              checkOutDate: data?[index].checkOutFormat,
              payment: data?[index].totalCharges,
              status: data?[index].statusTerm,
              color: data?[index].statusColor,
            ),
          );
        });
  }
}
