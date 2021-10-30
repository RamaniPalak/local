import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';


class StuckTheAppPage extends StatefulWidget {
  const StuckTheAppPage({required this.btnTap, required this.text, required this.btnText});

  final Function btnTap;
  final String text;
  final String btnText;

  @override
  _StuckTheAppPageState createState() => _StuckTheAppPageState();
}

class _StuckTheAppPageState extends State<StuckTheAppPage> {
  Container buildContainer(Size size) {
    return Container(
      color: kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height / 3,
            child: Center(
                child: Container(
                  width: size.width / 2.5,
                 // child: appIconImage,
                )),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 30),
                child: Text(
                  widget.text,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white, fontSize: kBigFontSize),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(onTap: (){
                widget.btnTap();
              }, child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text(widget.btnText,
                  style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1.0),
                ),
              ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: buildContainer(_size),
    );
  }
}
