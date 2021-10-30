import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class DocumentScreen extends StatelessWidget {
  var docTitle = ['Adhar Card ', 'Driving License', 'Employment Card'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Documents',
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
        child: ListView.builder(
          itemCount: docTitle.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kFlexibleSize(10))),
              margin: EdgeInsets.all(kFlexibleSize(5)),
              padding: EdgeInsets.all(kFlexibleSize(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${docTitle[index]}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: kMediumFontSize,
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: EdgeInsets.only(
                          right: kFlexibleSize(15),
                        ),
                        child: Container(
                          width: kFlexibleSize(15),
                          height: kFlexibleSize(15),
                          child: deleteImage,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: kFlexibleSize(10)),
                  Container(
                    height: kFlexibleSize(180),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kFlexibleSize(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 10,
                            blurRadius: 20,
                            offset: Offset(0, 13), // changes position of shadow
                          ),
                        ]),
                    child: licenseImage,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
