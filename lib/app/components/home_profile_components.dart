import 'package:flutter/material.dart';
import 'package:local/app/components/dailog_component.dart';
import 'package:local/app/data/entity/res_entity/res_reservation.dart';
import 'package:local/app/providers/razorpay_provider.dart';
import 'package:local/app/screens/timer/timer_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/user_prefs.dart';
import 'package:local/app/views/common_images.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileComponents extends StatefulWidget {
  ProfileComponents({Key? key, this.reservationData, this.onTap, this.userData})
      : super(key: key);

  final ResReservationData? reservationData;
  LocalUser? userData;
  final GestureTapCallback? onTap;

  @override
  State<ProfileComponents> createState() => _ProfileComponentsState();
}

class _ProfileComponentsState extends State<ProfileComponents> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    // reservationDetail();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // context.read<RazorPayProviderImpl>().transGetById();
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

  void _showDialog({String? id, String? msg, Image? img, Color? colors}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return DialogComponent(
          color: colors,
          img: img,
          message: msg,
          id: id,
        );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    //_showDialog(msg: 'Transaction\nSuccessful',img: successImg,colors: Colors.green[700]);
    Fluttertoast.showToast(
      msg: "SUCCESS: " + response.paymentId!,
      toastLength: Toast.LENGTH_SHORT,
    );
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => TimerScreen(),
    ))
        .then((value) {
      if (value == true) {
        widget.reservationData;
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    //_showDialog(msg: 'Transaction\nFailed',img: errorImg,colors: Colors.red[700]);
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  // reservationDetail() async {
  //   var res = await Reservation.shared.getUser;
  //
  //   setState(() {
  //     reservationData = res;
  //   });
  // }
  //
  // ResReservationData? reservationData;

  @override
  Widget build(BuildContext context) {
    final razorPay = context.watch<RazorPayProviderImpl>();

    final data = razorPay.generateOrderIdRes?.data?.data;

    void openCheckout() async {
      print(data?.orderId);
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
        'prefill': {
          'contact': widget.userData?.mobile,
          'email': widget.userData?.email
        },
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint('Error: e');
      }
    }

    return Container(
      height: kFlexibleSize(150),
      width: double.infinity,
      color: kPrimaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Padding(
              padding: EdgeInsets.only(left: kFlexibleSize(20)),
              child: Container(
                  height: kFlexibleSize(85),
                  width: kFlexibleSize(90),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kFlexibleSize(45)),
                    child: Container(color: Colors.white, child: profileImage),
                  )),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(left: kFlexibleSize(14)),
                    child: Text(
                      '${widget.userData?.displayName ?? '-'}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kProfileTitle,
                    )),
                Container(
                    padding: EdgeInsets.only(
                      left: kFlexibleSize(14),
                    ),
                    child: Text(
                      '${widget.reservationData?.propertyName ?? '-'}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kRegularProfileText,
                    )),
                SizedBox(
                  height: kFlexibleSize(10),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                            left: kFlexibleSize(14),
                          ),
                          child: boxes(
                              hasPadding: true,
                              key:
                                  '₹ ${widget.reservationData?.folioBalance ?? '-'}',
                              value: 'Payment Due')),
                    ),
                    Container(
                        height: 30,
                        padding: EdgeInsets.only(top: kFlexibleSize(5)),
                        child: VerticalDivider(color: kDivider)),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                            left: kFlexibleSize(14),
                          ),
                          child: boxes(
                              hasPadding: true,
                              key: '${widget.reservationData?.roomNo ?? '-'}',
                              value: 'Room No.')),
                    )
                  ],
                ),
                SizedBox(
                  height: kFlexibleSize(5),
                ),
                widget.reservationData?.isPaymentDue == true
                    ? InkWell(
                        onTap: () async {
                          await context
                              .read<RazorPayProviderImpl>()
                              .generateOrderId();
                          //  context.read<RazorPayProviderImpl>().orderID = data?.orderId;
                          // context.read<RazorPayProviderImpl>().refTransId = data?.refRazorPayTransId;
                          openCheckout();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: kFlexibleSize(14)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: kFlexibleSize(2),
                                horizontal: kFlexibleSize(6)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kFlexibleSize(3))),
                            child: Text(
                              'Pay Now',
                              style: TextStyle(
                                  fontSize: kSmallFontSize,
                                  color: kRedColor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget boxes(
    {required bool hasPadding, required String key, required String value}) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$key',
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
              fontSize: kBigFontSize,
              fontWeight: FontWeight.w900,
              color: Colors.white),
        ),
        Text('$value',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: kLightStyle),
      ],
    ),
  );
}
