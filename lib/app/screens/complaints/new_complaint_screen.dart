import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/base_button.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/textfield_common.dart';

class NewComplaintsScreen extends StatefulWidget {
  const NewComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<NewComplaintsScreen> createState() => _NewComplaintsScreenState();
}

class _NewComplaintsScreenState extends State<NewComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f3f7),
      appBar: AppBar(
        title: Text(
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
                  child: TextFieldCommon(title: 'Title', hint: 'Enter Title')),
              Padding(
                padding: EdgeInsets.all(kFlexibleSize(20)),
                child: Column(
                  children: [
                    SizedBox(height: kFlexibleSize(20)),
                    CommonDropDown(
                        data: ['Housekeeping', 'Cleaning'],
                        hint: 'Select',
                        title: 'Related to',
                        onChange: (value) {}),
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
                      height: 170,
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
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    right: kFlexibleSize(15),
                                    top: kFlexibleSize(10),
                                    bottom: kFlexibleSize(10)),
                                width: (MediaQuery.of(context).size.width - 40) / 3,
                                height: kFlexibleSize(100),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: detailImage,
                                ),
                              );
                            },
                          ))
                        ],
                      ),
                    ),
                    SizedBox(height: kFlexibleSize(30)),
                    Container(
                        padding: EdgeInsets.only(
                          left: kFlexibleSize(30),
                          right: kFlexibleSize(30),
                        ),
                        child: BaseAppButton(
                          color: kPrimaryColor,
                          title: 'SUBMIT',
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
