import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/providers/razorpay_provider.dart';
import 'package:local/app/providers/transaction_provider.dart';
import 'package:local/app/screens/bank/monthly_invoice.dart';
import 'package:local/app/screens/timer/timer_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/no_data_found_view.dart';
import 'package:local/app/utils/reservation.dart';
import 'package:local/app/utils/user_prefs.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TransactionHistoryScreen extends StatefulWidget {
  TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    reservationDetail();

    setState(() {});
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<TransactionProviderImpl>().unbillTransaction();
      context.read<TransactionProviderImpl>().TransactionInvoice();
      context.read<RazorPayProviderImpl>().generateOrderId();
    });

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimerScreen(),));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR : " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  reservationDetail() async {
    var res = await Reservation.shared.getReservation;
    var user = await UserPrefs.shared.getUser;

    setState(() {
      reservationData = res;
      localUser = user;
    });
  }

  // getUnbillData() async{
  //   final home = Provider.of<TransactionProviderImpl>(context,listen: false);
  //   await home.userBasicDetails();
  //   handleRes(res: home.userRes!, context: context,retryCall: (){
  //     getUserData();
  //   });
  // }

  ResReservationData? reservationData;
  LocalUser? localUser;

  // int segmentedControlGroupValue = 0;

  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Item 1"),
    1: Text("Item 2")
  };

  @override
  Widget build(BuildContext context) {
    final razorPay = context.watch<RazorPayProviderImpl>();

    final data = razorPay.generateOrderIdRes?.data?.data;

    void openCheckout() async {
      var options = {
        'key': 'rzp_test_WR1n8bttTgSUkS',
        'retry': {'enabled': true, 'max_count': 1},
        'order_id': data?.orderId,
        // "method": {
        //   "netbanking": true,
        //   "card": true,
        //   "upi": false,
        //   "wallet": false,
        //   "emi": false,
        //   "payLater" : false,
        // },
        'prefill': {'contact': localUser?.mobile, 'email': localUser?.email},
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint('Error: e');
      }
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            'Transaction History',
            style: kAppBarTitleStyle,
          ),
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              // padding: EdgeInsets.only(
              //     top: kFlexibleSize(30), left: kFlexibleSize(40)),
              color: kPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: kFlexibleSize(30), left: kFlexibleSize(40)),
                    child: Text(
                      '₹ ${reservationData?.folioBalance ?? ''}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: kDoubleSize),
                    ),
                  ),
                  SizedBox(height: kFlexibleSize(5)),
                  Container(
                      padding: EdgeInsets.only(left: kFlexibleSize(40)),
                      child: Text('PAYMENT DUE', style: kLightStyle)),
                  SizedBox(height: kFlexibleSize(11)),
                  InkWell(
                    onTap: () {
                      openCheckout();
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: kFlexibleSize(40)),
                      padding: EdgeInsets.symmetric(
                          vertical: kFlexibleSize(2),
                          horizontal: kFlexibleSize(6)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                            fontSize: kSmallFontSize,
                            color: kRedColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(height: kFlexibleSize(25)),
                  TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    indicator: UnderlineTabIndicator(),
                    padding: EdgeInsets.only(left: kFlexibleSize(40)),
                    indicatorPadding: EdgeInsets.only(right: kFlexibleSize(15)),
                    labelPadding:
                        EdgeInsets.only(left: 0, right: kFlexibleSize(15)),
                    tabs: const [
                      Tab(text: 'Unbilled'),
                      Tab(text: 'Statement'),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  unBill(),
                  invoice(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget unBill() {
    final res = context.watch<TransactionProviderImpl>();

    final hasError = res.unBillTransactionRes?.state == Status.ERROR ||
        res.unBillTransactionRes?.state == Status.UNAUTHORISED;

    if (hasError) {
      return bgContainer(
          widget: NoDataFoundView(
              retryCall: () {
                context.read<TransactionProviderImpl>().unbillTransaction();
              },
              title: 'No Data Found'));
    }

    if (res.unBillTransactionRes?.state == Status.LOADING) {
      return Center(child: LoadingSmall());
    }

    final total = res.unBillTransactionRes?.data?.total() ?? 0.0;

    final data = res.unBillTransactionRes?.data?.data;

    return Container(
      child: ListView.builder(
        itemCount: (data?.length ?? 0) + 1,
        itemBuilder: (context, index) {
          if (index == ((data?.length ?? 0))) {
            return Container(
              margin: EdgeInsets.symmetric(
                  vertical: kFlexibleSize(20), horizontal: kFlexibleSize(20)),
              child: Column(
                children: [
                  MySeparator(),
                  SizedBox(height: kFlexibleSize(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('Total',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: kBigFontSize,
                                  fontWeight: FontWeight.w700))),
                      Text('₹ ${total}',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: kDoubleFontSize,
                              color: Colors.black))
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.symmetric(
                  vertical: kFlexibleSize(10), horizontal: kFlexibleSize(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('${data?[index].accountName ?? '-'}',
                            style: kRegularText),
                        Text(
                          '${data?[index].narration ?? '-'}',
                          style: kTransactionStyle,
                          maxLines: 2,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  Text(' ₹ ${data?[index].charge ?? '-'}',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: kMediumFontSize,
                          fontWeight: FontWeight.w700))
                ],
              ),
            );
          }
        },
      ),
      padding: EdgeInsets.all(kFlexibleSize(20)),
    );
  }

  Widget invoice() {
    final res = context.watch<TransactionProviderImpl>();

    final hasError = res.transactionInvoiceRes?.state == Status.ERROR ||
        res.transactionInvoiceRes?.state == Status.UNAUTHORISED;

    if (hasError) {
      return bgContainer(
          widget: NoDataFoundView(
              retryCall: () {
                context.read<TransactionProviderImpl>().TransactionInvoice();
              },
              title: 'No Data Found'));
    }

    if (res.transactionInvoiceRes?.state == Status.LOADING) {
      return const Center(child: CircularProgressIndicator());
    }

    final data = res.transactionInvoiceRes?.data?.data;
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: kFlexibleSize(20)),
        itemCount: data?.length ?? 0,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MonthlyInvoiceScreen(
                            invoiceId: data?[index].invoiceId,
                          )));
            },
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: kFlexibleSize(10)),
              padding: EdgeInsets.symmetric(
                  vertical: kFlexibleSize(10), horizontal: kFlexibleSize(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: kFlexibleSize(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${data?[index].invoiceNo ?? '-'}',
                          style: TextStyle(
                              color: kBlackColor,
                              fontSize: kRegularFontSize,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '₹ ${data?[index].receivedAmt ?? '-'}',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: kMediumFontSize,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: kFlexibleSize(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: kFlexibleSize(10)),
                          child: Text(
                            '${data?[index].invoiceDateFormat ?? '-'}',
                            style: kTransactionStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '₹ ${data?[index].dueAmt} Due ',
                              style: kTransactionStyle,
                            ),
                            // if (data?[index].isPaymentDue == true)
                            //   Padding(
                            //     padding: const EdgeInsets.all(2),
                            //     child: Container(
                            //       padding: EdgeInsets.symmetric(
                            //           vertical: kFlexibleSize(2),
                            //           horizontal: kFlexibleSize(6)),
                            //       decoration: BoxDecoration(
                            //           color: dividerColor,
                            //           borderRadius: BorderRadius.circular(3)),
                            //       child: Text(
                            //         'Pay Now',
                            //         style: TextStyle(
                            //             fontSize: kSmallFontSize,
                            //             color: kRedColor,
                            //             fontWeight: FontWeight.w700),
                            //       ),
                            //     ),
                            //   )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
