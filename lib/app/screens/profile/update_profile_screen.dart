import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:local/app/providers/profile_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/textfield_common.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends BasePage {
  UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends BaseState<UpdateProfileScreen> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  updateProfile() async {
    try {
      final provider = Provider.of<ProfileProviderImpl>(context, listen: false);

      provider.member?.firstName = fNameController.text;
      provider.member?.lastName = lNameController.text;
      provider.member?.mobileNo = mobileController.text;
      provider.member?.eMail = emailController.text;

      await provider.updateUserProfile();

      handleRes(res: provider.updatedUserRes!, context: context);

      if (provider.updatedUserRes?.state == Status.COMPLETED) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      ShowSnackBar(context: context, message: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      final profile = Provider.of<ProfileProviderImpl>(context, listen: false);

      await profile.userDetail();

      final data = profile.userDetailRes?.data?.data;

      setState(() {
        fNameController.text = data?.meber?.firstName ?? '';
        lNameController.text = data?.meber?.lastName ?? '';
        mobileController.text = data?.meber?.mobileNo ?? '';
        emailController.text = data?.meber?.eMail ?? '';

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F3F7),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Update Profile',
          style: kAppBarTitleStyle,
        ),
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: kFlexibleSize(120 + 30 + 30),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(kFlexibleSize(20)),
                  bottomRight: Radius.circular(kFlexibleSize(20)),
                ),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: kFlexibleSize(120),
                      width: kFlexibleSize(120),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(kFlexibleSize(60)),
                          color: Colors.grey),
                      child: profileImage,
                    ),
                    Positioned(
                      child: Container(
                        child: Center(child: cameraImage),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              kFlexibleSize(15),
                            )),
                        height: kFlexibleSize(30),
                        width: kFlexibleSize(30),
                      ),
                      top: kFlexibleSize(4),
                      right: kFlexibleSize(2),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: kFlexibleSize(20),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: kFlexibleSize(20), right: kFlexibleSize(20)),
              child: Column(
                children: [
                  TextFieldCommon(
                    title: 'First Name',
                    hint: 'Enter First Name',
                    controller: fNameController,
                  ),
                  SizedBox(
                    height: kFlexibleSize(20),
                  ),
                  TextFieldCommon(
                    title: 'Last Name',
                    hint: 'Enter Last Name',
                    controller: lNameController,
                  ),
                  SizedBox(height: kFlexibleSize(20)),
                  TextFieldCommon(
                    title: 'Phone No.',
                    hint: 'Enter Phone No.',
                    controller: mobileController,
                  ),
                  SizedBox(height: kFlexibleSize(20)),
                  TextFieldCommon(
                    title: 'Email',
                    hint: 'Enter Email',
                    controller: emailController,
                  ),
                ],
              ),
            ),
            SizedBox(height: kFlexibleSize(50)),
            button(),
            SizedBox(
              height: kFlexibleSize(20),
            ),
          ],
        ),
      ),
    );
  }

  Widget button() {

    final isLoading =  context.watch<ProfileProviderImpl>().updatedUserRes?.state == Status.LOADING;
    return Container(
      padding:
          EdgeInsets.only(left: kFlexibleSize(30), right: kFlexibleSize(30)),
      child: BaseAppButton(
        color: kPrimaryColor,
        isLoading: isLoading ,
        title: 'UPDATE',
        onTap: () {
         updateProfile();
        },
      ),
    );
  }
}
