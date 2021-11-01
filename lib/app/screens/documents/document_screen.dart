import 'package:flutter/material.dart';
import 'package:local/app/data/entity/res_entity/res_getdocument.dart';
import 'package:local/app/providers/document_provider.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';
import 'package:provider/provider.dart';

class DocumentScreen extends StatefulWidget {
  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  var docTitle = ['Driving License','Aadhar Card', 'Employment Card'];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<DocumentProviderImpl>().getDocument();
    });
  }

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
      body: document()
    );
  }

  Widget document() {

    final document = context.watch<DocumentProviderImpl>();

    final data = document.getDocumentRes?.data?.data;

    List<String> list = docTitle;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
      child: ListView.builder(
        itemCount: docTitle.length,
        itemBuilder: (context, index) {

          ResGetDocumentData? myObj;

          try {
            myObj = data?.where((element) {

              print(element.documentTitle);

              return element.documentTitle == docTitle[index];
            }).toList().first;

          } catch (e) {
            print(e);
          }

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
                if(myObj?.originalDocumentPath != null)
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
                  child: Image.network('${myObj?.originalDocumentPath}'),
                ),
                if(myObj?.originalDocumentPath == null)
          Container(
          height: kFlexibleSize(180),)
              ],
            ),
          );
        },
      ),
    );
  }



}
