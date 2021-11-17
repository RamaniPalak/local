import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/extensions.dart';
import 'package:local/app/views/common_images.dart';


class DatePickView extends StatefulWidget {
  DatePickView({Key? key, required this.title, required this.selectedDate,this.passedDate,this.minDate,this.maxDate}) : super(key: key);

  final String title;

  final Function(DateTime) selectedDate;

  final DateTime? passedDate;

  final DateTime? minDate;

  final DateTime? maxDate;

  @override
  _DatePickViewState createState() => _DatePickViewState();
}

class _DatePickViewState extends State<DatePickView> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      currentDate: widget.passedDate,
        context: context,
        initialDate: widget.passedDate ?? DateTime.now(),
        firstDate: widget.maxDate ?? DateTime.now(),
        lastDate: widget.minDate ?? DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.selectedDate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: Container(
          height: kFlexibleSize(45.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: kCommonShadow,
          ),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kFlexibleSize(15.0)),
                      child: Text(
                        '${(selectedDate == null ? widget.title : selectedDate!.toStrCommonFormat())}',
                        style: TextStyle(
                          fontSize: kRegularFontSize,
                        ),
                      ))),
              Container(
                margin: EdgeInsets.all(kFlexibleSize(12)),
                // padding: EdgeInsets.only(right: 10),
                height: kFlexibleSize(20.0),
                child: calendarBlackImage,
              )
            ],
          )),
    );
  }
}
