import 'package:flutter/material.dart';
import 'package:local/app/providers/profile_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:local/app/views/textfield_common.dart';
import 'package:provider/provider.dart';

class BankDetailScreen extends BasePage {
  BankDetailScreen({Key? key}) : super(key: key);

  @override
  _BankDetailScreenState createState() => _BankDetailScreenState();
}

class _BankDetailScreenState extends BaseState<BankDetailScreen> {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController acNumController = TextEditingController();
  TextEditingController IFSCController = TextEditingController();
  TextEditingController acHolderController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();

  updateProfile() async {
    try {
      if (branchNameController.text.trim().isEmpty) {
        throw 'Please enter branch name ';
      }
      if (bankNameController.text.trim().isEmpty) {
        throw 'Please enter bank name';
      }
      if (IFSCController.text.trim().isEmpty) {
        throw 'Please enter ifsc code';
      }
      if (acHolderController.text.trim().isEmpty) {
        throw 'Please enter ac holder name';
      } if (acNumController.text.trim().isEmpty) {
        throw 'Please enter ac number';
      }



      final provider = Provider.of<ProfileProviderImpl>(context, listen: false);

      provider.userBankData?.acBranchName = branchNameController.text;
      provider.userBankData?.acBankName = bankNameController.text;
      provider.userBankData?.acifscCode = IFSCController.text;
      provider.userBankData?.acHolderName = acHolderController.text;
      provider.userBankData?.acNo = acNumController.text;

      await provider.updateBankDetails();

      handleRes(res: provider.updatedBankRes!, context: context);

      if (provider.updatedBankRes?.state == Status.COMPLETED) {
        Navigator.of(context).pop();
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

      await profile.userBankDetail();

      final data = profile.userBankRes?.data?.data;

      setState(() {
        bankNameController.text = data?.bankDetail?.acBankName ?? '';
        acNumController.text = data?.bankDetail?.acNo ?? '';
        IFSCController.text = data?.bankDetail?.acifscCode ?? '';
        acHolderController.text = data?.bankDetail?.acHolderName ?? '';
        branchNameController.text = data?.bankDetail?.acBranchName ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bank Details',
          ),
        ),
        body: _body(context));
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: kFlexibleSize(20), right: kFlexibleSize(20)),
          child: Column(
            children: [
              SizedBox(
                height: kFlexibleSize(20),
              ),
              TextFieldCommon(
                hint: 'Enter Bank Name',
                title: 'Bank Name',
                controller: bankNameController,
              ),
              SizedBox(
                height: kFlexibleSize(20),
              ),
              TextFieldCommon(
                title: 'Account Number',
                hint: 'Enter Account Number',
                controller: acNumController,
              ),
              SizedBox(
                height: kFlexibleSize(20),
              ),
              TextFieldCommon(
                title: 'IFSC Code',
                hint: 'Enter IFSC Code',
                controller: IFSCController,
              ),
              SizedBox(
                height: kFlexibleSize(20),
              ),
              TextFieldCommon(
                title: 'Account Holder Name',
                hint: 'Enter Account Holder Name',
                controller: acHolderController,
              ),
              SizedBox(
                height: kFlexibleSize(20),
              ),
              TextFieldCommon(
                title: 'Branch Name',
                hint: 'Enter Branch Name',
                controller: branchNameController,
              ),
              SizedBox(
                height: kFlexibleSize(50),
              ),
              button(),
              SizedBox(
                height: kFlexibleSize(20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    final isLoading =
        context.read<ProfileProviderImpl>().updatedBankRes?.state ==
            Status.LOADING;

    return Container(
      width: kFlexibleSize(315),
      // padding:
      //     EdgeInsets.only(left: kFlexibleSize(20), right: kFlexibleSize(20)),
      child: BaseAppButton(
        title: 'SAVE',
        isLoading: isLoading,
        color: kPrimaryColor,
        onTap: () {
          updateProfile();
        },
      ),
    );
  }
}
