import 'package:flutter/material.dart';
import 'package:local/app/providers/auth_provider.dart';
import 'package:local/app/screens/auth/enter_otp_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/base_text_field.dart';
import 'package:local/app/views/common_images.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future loginUser(BuildContext context) async {
    try {
      final auth = Provider.of<AuthProviderImpl>(context, listen: false);

      await auth.logInUser(mobile: mobileController.text);
      if (auth.loginUserRes?.state == Status.COMPLETED) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => EnterOtpScreen()));
      }
    } catch (e) {
      ShowSnackBar(context: context, message: '${e.toString()}');
    }
  }

  final mobileController = TextEditingController();

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
                Text('Enter Mobile Number',
                    style: kAuthTitleStyle, textAlign: TextAlign.start),
                SizedBox(height: kFlexibleSize(20.0)),
                BaseTextField(
                  hint: 'Mobile Number',
                  keyboardType: TextInputType.phone,
                  controller: mobileController,
                ),
                SizedBox(height: kFlexibleSize(30.0)),
                loginBtn(context),
                SizedBox(
                  height: kFlexibleSize(10),
                )
              ],
            ),
          ),
          Container(width: double.infinity, child: appBottomImage),
        ],
      ),
    ));
  }

  BaseAppButton loginBtn(BuildContext context) {
    final isLoading =
        context.read<AuthProviderImpl>().loginUserRes?.state == Status.LOADING;

    return BaseAppButton(
      isLoading: isLoading,
      title: 'GET OTP',
      color: kPrimaryColor,
      onTap: () {
        loginUser(context);
      },
    );
  }
}
