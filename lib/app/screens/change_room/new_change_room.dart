import 'dart:io';
import 'package:flutter/material.dart';
import 'package:local/app/data/entity/req_entity/req_addcomplain.dart';
import 'package:local/app/providers/list_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/screens/complaints/new_complaint_screen.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/base_button.dart';
import 'package:provider/provider.dart';

class NewChangeRoomScreen extends BasePage {
   NewChangeRoomScreen({Key? key}) : super(key: key);

  @override
  State<NewChangeRoomScreen> createState() => _NewChangeRoomScreenState();
}

class _NewChangeRoomScreenState extends BaseState<NewChangeRoomScreen> {

  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  var related = ['Frontdesk'];
  var priority = ['High', 'Medium', 'Low'];

  String? selectRelated;
  String? selectPriority;

  List<File> imageList = [];

  insert() async {
    try {
      if (titleController.text.trim().isEmpty) {
        throw 'Please enter title';
      }

      if (selectPriority == null) {
        throw 'Please select priority';
      }
      if (noteController.text.trim().isEmpty) {
        throw 'Please enter description';
      }

      final provider = Provider.of<ListProviderImpl>(context, listen: false);

      provider.complainData?.ticketTitle = titleController.text;
      provider.complainData?.ticketNote = noteController.text;
      provider.complainData?.issueRelatedTypeTerm = selectRelated;
      provider.complainData?.priorityTerm = selectPriority;

      provider.complainData = ReqAddComplain(
          ticketTitle: titleController.text,
          ticketNote: noteController.text,
          priorityTerm: selectPriority,
          issueRelatedTypeTerm: 'Frontdesk');

      await provider.insertComplain(
          paths: imageList.map((e) {
            return e.path;
          }).toList()
      );

      handleRes(res: provider.insertComplainRes!, context: context);

      if (provider.insertComplainRes?.state == Status.COMPLETED) {
        Navigator.of(context).pop();
      }

    } catch (e) {
      ShowSnackBar(context: context, message: e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F3F7),
      appBar: AppBar(
        title: const Text(
          'Request for Change Room',
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kFlexibleSize(20),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(20), right: kFlexibleSize(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: kLongTitleStyle,
                      ),
                      SizedBox(height: kFlexibleSize(6)),
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.circular(kFlexibleSize(10))),
                        child: TextField(
                          maxLines: 2,
                          style: kLongTitleStyle,
                          controller: titleController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Title',
                              hintStyle: kLongTitleStyle),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(kFlexibleSize(20)),
                  child: Column(
                    children: [
                      //  SizedBox(height: kFlexibleSize(20)),
                      textField(title: 'Related to',hint: '',value: 'Frontdesk'),
                      SizedBox(height: kFlexibleSize(20)),
                      CommonDropDown(
                          data: priority,
                          hint: 'Select',
                          title: 'Priority',
                          selectedValue: selectPriority,
                          onChange: (value) {
                            selectPriority = value;
                          }),
                      SizedBox(height: kFlexibleSize(20)),
                      Column(
                        children: [
                          Text(
                            'Description',
                            style: kLongTitleStyle,
                          ),
                          SizedBox(height: kFlexibleSize(6)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: kFlexibleSize(15)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(kFlexibleSize(10))),
                            child: TextField(
                              maxLines: 6,
                              style: kLongTitleStyle,
                              controller: noteController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter Description',
                                  hintStyle: kLongTitleStyle),
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                      ),
                      SizedBox(height: kFlexibleSize(20)),
                      SizedBox(height: kFlexibleSize(30)),
                      btn()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column textField({required String title, required String hint,String? value}) {
    return Column(
      children: [
        Text(
          '$title',
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: TextField(
            readOnly: true,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: value,
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }


  Widget btn() {
    final isLoading =
        context.watch<ListProviderImpl>().insertComplainRes?.state ==
            Status.LOADING;

    return Container(
        width: kFlexibleSize(315),
        child: BaseAppButton(
          color: kPrimaryColor,
          isLoading: isLoading,
          onTap: () {
            insert();
          },
          title: 'SUBMIT',
        ));
  }
}
