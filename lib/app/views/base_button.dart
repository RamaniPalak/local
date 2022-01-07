import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

import 'loading_small.dart';

class BaseButton extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onTap;
  final bool? isLoading;

  const BaseButton(
      {required Widget? child, GestureTapCallback? onTap, bool? isLoading})
      : child = child,
        onTap = onTap,
        isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      child: child,
      onTap: onTap,
    );
  }
}

class AppButton extends BaseButton {
  const AppButton(
      {required Widget? child, GestureTapCallback? onTap, bool? isLoading})
      : super(child: child, onTap: onTap, isLoading: isLoading);
}

class ButtonFill extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final bool? isLoading;
  final EdgeInsets? margin;

  const ButtonFill(
      {required String text,
      GestureTapCallback? onTap,
      bool? isLoading,
      EdgeInsets? margin})
      : text = text,
        onTap = onTap,
        isLoading = isLoading,
        margin = margin;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: (isLoading == true) ? null : onTap,
      isLoading: isLoading,
      child: Container(
        margin: margin,
        height: 44,
        decoration: BoxDecoration(
            color: kPrimaryColor.withAlpha((isLoading == true) ? 80 : 1000),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          widthFactor: 1,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isLoading == true) LoadingSmall(size: kFlexibleSize(15)),
                  if (isLoading == true) SizedBox(width: 10),
                  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class ButtonBorder extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final bool? isLoading;

  const ButtonBorder(
      {required String text, GestureTapCallback? onTap, bool? isLoading})
      : text = text,
        onTap = onTap,
        isLoading = isLoading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: (isLoading == true) ? null : onTap,
      isLoading: isLoading,
      child: Container(
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular((isLoading == true) ? 22.0 : 5.0),
        ),
        child: Center(
          widthFactor: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: (isLoading == true)
                ? LoadingSmall(
                    color: kPrimaryColor,
                  )
                : Text(
                    text,
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}

class BaseAppButton extends StatelessWidget {
  const BaseAppButton(
      {Key? key, this.title, this.onTap, this.isLoading, this.color})
      : super(key: key);

  final String? title;
  final Color? color;

  final GestureTapCallback? onTap;

  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: kFlexibleSize(45.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: kCommonBlueShadow,
        ),
        // padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15.0)),
        child: Container(
          width: double.infinity,
          child: Center(
            child: _child(),
          ),
        ),
      ),
    );
  }

  Widget _child() {
    if (isLoading ?? false) {
      return Container(
          height: 15,
          width: 15,
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ));
    } else {
      return Text(
        title ?? '',
        style: TextStyle(
            fontSize: kRegularFontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      );
    }
  }
}

class BaseAppBtn extends StatelessWidget {
  const BaseAppBtn({Key? key, this.title, this.onTap, this.isLoading})
      : super(key: key);

  final String? title;

  final GestureTapCallback? onTap;

  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: kFlexibleSize(45.0),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: kCommonBlueShadow,
        ),
        // padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: kFlexibleSize(15)),
                child: Text(
                  title ?? '',
                  style: TextStyle(
                      fontSize: kRegularFontSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: kFlexibleSize(18)),
              child: Container(
                width: kFlexibleSize(15),
                child: arrowRightImage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button(
      {Key? key,
      this.title,
      this.color,
      this.textcolor,
      this.onTap,
      this.isLoading})
      : super(key: key);

  final String? title;
  final Color? color;
  final Color? textcolor;
  final GestureTapCallback? onTap;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: kFlexibleSize(45.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: double.infinity,
          child: isLoading == false
              ? Container(
                  height: 15,
                  width: 15,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Center(
                  child: Text(
                    title!,
                    style: TextStyle(
                        fontSize: kRegularFontSize,
                        fontWeight: FontWeight.w700,
                        color: textcolor),
                  ),
                ),
        ),
      ),
    );
  }
}
