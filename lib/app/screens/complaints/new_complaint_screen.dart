import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:local/app/data/entity/req_entity/req_addcomplain.dart';
import 'package:local/app/providers/list_provider.dart';
import 'package:local/app/screens/base/base_state_full.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/image_picker.dart';
import 'package:local/app/utils/show_snack_bar.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/textfield_common.dart';
import 'package:provider/provider.dart';

class NewComplaintsScreen extends BasePage {
  NewComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<NewComplaintsScreen> createState() => _NewComplaintsScreenState();
}

class _NewComplaintsScreenState extends BaseState<NewComplaintsScreen> {
  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  var related = ['Housekeeping', 'Cleaning'];
  var priority = ['High', 'Medium', 'Low'];

  String? selectRelated;
  String? selectPriority;

  var point = 5;
  PickImage? pickImage;

  File? img;

  List<File> imagelist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pickImage = PickImage(
        context: context,
        updateFile: () async {
          try {
            setState(() {
              img = pickImage?.imageFile as File?;
              imagelist.add(img!);
            });
          } catch (e) {
            print("Exception:");
            print(e);
          }
        });
  }

  insert() async {
    try {
      if (noteController.text.isEmpty || titleController.text.isEmpty) {
        throw 'Please enter value';
      }
      if (selectRelated == null || selectPriority == null) {
        throw 'Please select';
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
          issueRelatedTypeTerm: selectRelated);

      await provider.insertComplain(paths: imagelist.map((e) {

        return e.path;

      }).toList());

      if (handleRes(res: provider.insertComplainRes!, context: context)) {
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      ShowSnackBar(context: context, message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3f7),
      appBar: AppBar(
        title: const Text(
          'New Complaints',
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: kFlexibleSize(20),
              ),
              Container(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(20), right: kFlexibleSize(20)),
                  child: TextFieldCommon(
                    title: 'Title',
                    hint: 'Enter Title',
                    controller: titleController,
                  )),
              Padding(
                padding: EdgeInsets.all(kFlexibleSize(20)),
                child: Column(
                  children: [
                    //  SizedBox(height: kFlexibleSize(20)),
                    CommonDropDown(
                        data: related,
                        hint: 'Select',
                        title: 'Related to',
                        selectedValue: selectRelated,
                        onChange: (value) {
                          selectRelated = value;
                        }),
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
                    SizedBox(
                      height: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Add Images :',
                            style: kLongTitleStyle,
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imagelist.length >= 5
                                  ? imagelist.length
                                  : imagelist.length + 1,
                              itemBuilder: (context, index) {
                                if (imagelist.length < 5) {
                                  if (imagelist.length == index) {
                                    return InkWell(
                                      onTap: () {
                                        pickImage?.selectImage();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          // padding: EdgeInsets.only(
                                          //     right: kFlexibleSize(15),
                                          //     left: kFlexibleSize(15),
                                          //     top: kFlexibleSize(15),
                                          //     bottom: kFlexibleSize(10)),
                                          width: kFlexibleSize(100),
                                          height: kFlexibleSize(120),
                                          decoration: BoxDecoration(
                                              color: kBgColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Center(child: addBlueIcon),
                                        ),
                                      ),
                                    );
                                  }
                                }
                                return image(index);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: kFlexibleSize(30)),
                    btn()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget image(int index) {
    return Padding(
      padding: EdgeInsets.only(
          right: kFlexibleSize(15),
          top: kFlexibleSize(15),
          bottom: kFlexibleSize(10)),
      child: Container(
        width: kFlexibleSize(100),
        height: kFlexibleSize(120),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            setState(() {
              imagelist.removeAt(index);
            });
          },
          child: Center(
              child: img != null
                  ? Container(
                  width: kFlexibleSize(100),
                  height: kFlexibleSize(120),
                  child: Image.file(imagelist[index]))
                  : Container(
                      width: kFlexibleSize(100),
                      height: kFlexibleSize(120),
                decoration: BoxDecoration(
                    color: kBgColor,
                    borderRadius:
                    BorderRadius.circular(10.0)),
                      child: addBlueIcon,
                    )),
        ),
      ),
    );
  }

  Widget btn() {
    final isLoading =
        context.watch<ListProviderImpl>().insertComplainRes?.state ==
            Status.LOADING;

    return Container(
        padding: EdgeInsets.only(
          left: kFlexibleSize(30),
          right: kFlexibleSize(30),
        ),
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

class CommonDropDown extends StatefulWidget {
  CommonDropDown(
      {this.title,
      this.hint,
      required this.data,
      this.selectedValue,
      required this.onChange});

  final String? title;
  final String? hint;
  final List<String> data;
  late String? selectedValue;
  final Function(String?) onChange;

  @override
  _CommonDropDownState createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  // var _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) Text('${widget.title}'),
        if (widget.title != null) SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: DropdownButton<String>(
              value: widget.selectedValue,
              style: kAppBarTitle,
              isExpanded: true,
              underline: SizedBox(),
              items: widget.data.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              hint: Text(
                widget.hint ?? '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: kMediumFontSize,
                    fontWeight: FontWeight.w400),
              ),
              onChanged: (String? value) {
                widget.onChange(value);
                setState(() {
                  widget.selectedValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
