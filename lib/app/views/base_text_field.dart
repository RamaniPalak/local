import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local/app/utils/constants.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {Key? key,
      this.controller,
      this.hint,
      this.keyboardType,
      this.secureText,
      this.isLast,
      this.enabled,
      this.onChanged,
      this.autoFocus})
      : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final TextInputType? keyboardType;
  final bool? secureText;
  final bool? isLast;
  final bool? enabled;
  final bool? autoFocus;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kFlexibleSize(45.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // boxShadow: kCommonShadow,
      ),
      // padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15.0)),
      child: Container(
        width: double.infinity,
        child: Center(
          child: TextField(
            autofocus: autoFocus ?? false,
            enabled: enabled,
            obscureText: secureText ?? false,
            controller: controller,
            onChanged: onChanged,
            inputFormatters: [
              if (keyboardType == TextInputType.number ||
                  keyboardType == TextInputType.numberWithOptions() ||
                  keyboardType == TextInputType.phone)
                FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(fontSize: kRegularFontSize,color: (enabled == false) ? kFontColor.withOpacity(0.5) : kFontColor),
            cursorColor: kPrimaryColor,
            keyboardType: keyboardType,
            textInputAction:
                isLast == true ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
              focusColor: kPrimaryColor,
              hintText: hint,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: kFlexibleSize(15.0)),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(fontSize: kRegularFontSize),
            ),
          ),
        ),
      ),
    );
  }
}


