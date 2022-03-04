import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/base_button.dart';

class DialogComponent extends StatefulWidget {
  DialogComponent({Key? key, this.color, this.img, this.id, this.message})
      : super(key: key);

  Color? color;
  Image? img;
  String? id;
  String? message;

  @override
  _DialogComponentState createState() => _DialogComponentState();
}

class _DialogComponentState extends State<DialogComponent> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent, //this right here
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Container(
          height: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 30,
                  height: 30,
                  child: widget.img,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.message ?? '',
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.bottomRight,
                  child: BaseAppButton(
                onTap: (){
                  Navigator.pop(context);
                },
                title: 'OK',
                    color: kPrimaryColor,
              ),
              )
            ],
          ),
        ),
        // child: Stack(
        //   children: <Widget>[
        //     Align(
        //       alignment: Alignment(0, 1),
        //       child: Container(
        //         height: 160,
        //         width: MediaQuery.of(context).size.width * 0.55,
        //         decoration: const BoxDecoration(
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(30),
        //           ),
        //           color: Colors.white,
        //         ),
        //         child: Center(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 widget.message ?? '',
        //                 style: const TextStyle(
        //                     fontWeight: FontWeight.w800, fontSize: 20),
        //                 textAlign: TextAlign.center,
        //               ),
        //               const SizedBox(
        //                 height: 10,
        //               ),
        //               widget.id == null
        //                   ? Container()
        //                   : Text(
        //                 "ID: ${widget.id}",
        //                 style: TextStyle(fontWeight: FontWeight.w300),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Align(
        //       alignment: Alignment(0, -1),
        //       child: Container(
        //         height: 60,
        //         width: 60,
        //         decoration:
        //         BoxDecoration(color: widget.color, shape: BoxShape.circle),
        //         child: widget.img,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
