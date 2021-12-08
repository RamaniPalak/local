import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/extensions.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/common_images.dart';
import 'package:provider/provider.dart';

class EnterOtpScreen extends BasePage {
  EnterOtpScreen({Key? key, this.otp}) : super(key: key);

  final int? otp;

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends BaseState<EnterOtpScreen> {
  Future VerifyUser(BuildContext context) async {
    try {
      final auth = Provider.of<AuthProviderImpl>(context, listen: false);

      await auth.verifyOTP(
          closure: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          otp: otpTexts);
    } catch (e) {
      ShowSnackBar(context: context, message: '${e.toString()}');
    }
  }

  String otpTexts = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      otpTexts = widget.otp.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(30.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kFlexibleSize(60.0)),
                Container(
                    height: kFlexibleSize(190.0),
                    width: double.infinity,
                    child: appIconImage),
                SizedBox(height: kFlexibleSize(80.0)),
                Text('Enter OTP',
                    style: kAuthTitleStyle, textAlign: TextAlign.start),
                SizedBox(
                  height: kFlexibleSize(20),
                ),
                Container(
                  height: kFlexibleSize(45.0),
                  child: fields(context),
                ),
                SizedBox(
                  height: kFlexibleSize(30),
                ),
                BaseAppButton(
                  title: 'CONTINUE',
                  color: kPrimaryColor,
                  onTap: () {
                    VerifyUser(context);
                  },
                ),
                SizedBox(
                  height: kFlexibleSize(10),
                ),
              ],
            ),
          ),
          Container(width: double.infinity, child: appBottomImage),
        ],
      ),
    ));
  }

  Widget fields(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            otpField(text: '${otpTexts.safeIndexStrFrom(0)}'),
            otpField(text: '${otpTexts.safeIndexStrFrom(1)}'),
            otpField(text: '${otpTexts.safeIndexStrFrom(2)}'),
            otpField(text: '${otpTexts.safeIndexStrFrom(3)}'),
          ],
        ),
        TextField(
          autofocus: true,
          onChanged: (text) {
            if (text.length <= 4) {
              setState(() {
                otpTexts = text;
              });
            }
            if (text.length > 3) {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLines: 1,
          showCursor: false,
          cursorColor: Colors.transparent,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: Colors.transparent, letterSpacing: kFlexibleSize(56.5)),
          cursorHeight: 0.0,
          cursorWidth: 0.0,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusColor: Colors.transparent,
              fillColor: Colors.transparent,
              hoverColor: Colors.transparent),
        )
      ],
    );
  }

  Widget otpField({required String text}) {
    return AspectRatio(
      aspectRatio: 1.33,
      child: Container(
        height: kFlexibleSize(45.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: text.isEmpty ? kCommonShadow : kCommonBlueShadow,
        ),
        child: Container(
          width: double.infinity,
          child: Center(
            child: Text(
              '$text',
              style: TextStyle(
                fontSize: kBigFontSize,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
