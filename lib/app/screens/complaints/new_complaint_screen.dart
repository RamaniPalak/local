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
import 'package:local/app/views/custom_popup_view.dart';
import 'package:provider/provider.dart';

class NewComplaintsScreen extends BasePage {
  NewComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<NewComplaintsScreen> createState() => _NewComplaintsScreenState();
}

class _NewComplaintsScreenState extends BaseState<NewComplaintsScreen> {

  TextEditingController noteController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  var related = ['Housekeeping', 'Frontdesk'];
  var priority = ['High', 'Medium', 'Low'];

  String? selectRelated;
  String? selectPriority;

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
      if (titleController.text.trim().isEmpty) {
        throw 'Please enter title';
      }

      if (selectRelated == null) {
        throw 'Please select related to';
      }
      if (selectPriority == null) {
        throw 'Please select priority';
      }
      if (noteController.text.trim().isEmpty) {
        throw 'Please enter description';
      }

      // if (imagelist.isEmpty) {
      //   throw 'Please select image';
      // }
      //
      // if (imagelist.length <= 0) {
      //   throw 'select image';
      // }

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

      await provider.insertComplain(
          paths: imagelist.map((e) {
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
      backgroundColor: const Color(0xfff2f3f7),
      appBar: AppBar(
        title: const Text(
          'New Complaints',
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: kBlackColor,
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
                        height: kFlexibleSize(180),
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
                                        child: Container(
                                          margin: const EdgeInsets.all(8.0),
                                          width: kFlexibleSize(100),
                                          decoration: BoxDecoration(
                                              color: kBgColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Center(child: addBlueIcon),
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
      ),
    );
  }

  Widget image(int index) {
    return SizedBox(
      width: kFlexibleSize(110),
      // height: kFlexibleSize(130),
      child: img != null
          ? Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        child: Image.file(
                      imagelist[index],
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Positioned(
                  child: InkWell(
                      onTap: () {
                        CustomPopup(context,
                            title: '',
                            message: 'Are you sure you want to delete ?',
                            primaryBtnTxt: 'DELETE', primaryAction: () {
                          setState(() {
                            imagelist.removeAt(index);
                          });
                        }, secondaryBtnTxt: 'CANCEL', secondaryAction: () {});
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              kFlexibleSize(15),
                            )),
                        child: deleteImage,
                        height: kFlexibleSize(30),
                        width: kFlexibleSize(30),
                      )),
                  right: 1,
                  top: 1,
                )
              ],
            )
          : Padding(
              padding: EdgeInsets.only(top: kFlexibleSize(20)),
              child: Container(
                width: kFlexibleSize(95),
                height: kFlexibleSize(115),
                decoration: BoxDecoration(
                    color: kBgColor, borderRadius: BorderRadius.circular(10.0)),
                child: addBlueIcon,
              ),
            ),
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
