import 'dart:io';
import 'package:flutter/material.dart';
import 'package:local/app/data/entity/res_entity/res_getdocument.dart';
import 'package:local/app/providers/document_provider.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/utils/enums.dart';
import 'package:local/app/utils/image_picker.dart';
import 'package:local/app/utils/no_data_found_view.dart';
import 'package:local/app/views/common_images.dart';
import 'package:local/app/views/custom_popup_view.dart';
import 'package:local/app/views/loading_small.dart';
import 'package:provider/provider.dart';

class DocumentScreen extends StatefulWidget {
  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  var docTitle = ['Aadhar Card', 'Driving License', 'Employment Card'];

  File? img;

  PickImage? pickImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<DocumentProviderImpl>().getDocument();
    });

    pickImage = PickImage(
        context: context,
        updateFile: () async {
          try {
            print(pickImage?.imageFile?.path);

            img = pickImage?.imageFile as File?;

            context.read<DocumentProviderImpl>().uploadDoc(path: img?.path ?? '');

          } catch (e) {
            print("Exception:");
            print(e);
          }
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
        body: document());
  }

  Widget document() {
    final document = context.watch<DocumentProviderImpl>();

    final data = document.getDocumentRes?.data?.data;

    final hasError = document.getDocumentRes?.state == Status.ERROR ||
        document.getDocumentRes?.state == Status.UNAUTHORISED;


    if (hasError) {
      return Center(
          child: NoDataFoundView(
              retryCall: () {
                context.read<DocumentProviderImpl>().getDocument();
              },
              title: 'No Profile Data Found'));
    }

    final isLoading = document.getDocumentRes?.state == Status.LOADING ||
        document.uploadDocumentRes?.state == Status.LOADING ||
        document.deleteDocumentRes?.state == Status.LOADING;

    print("doc isLoading");
    print(isLoading);

    if (isLoading) {
      return Center(child: LoadingSmall());
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kFlexibleSize(15)),
      child: ListView.builder(
        itemCount: docTitle.length,
        itemBuilder: (context, index) {
          ResGetDocumentData? myObj;
          try {
            myObj = data
                ?.where((element) {
                  print(element.documentTitle);
                  return element.documentTitle == docTitle[index];
                })
                .toList()
                .first;
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
                    if (myObj?.originalDocumentPath != null)
                      Padding(
                        padding: EdgeInsets.only(
                          right: kFlexibleSize(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            CustomPopup(context,
                                title: 'Delete',
                                message: 'Are you want to Delete',
                                primaryBtnTxt: 'OK', primaryAction: () {
                              context.read<DocumentProviderImpl>().deleteDoc(docId: myObj?.documentId ?? '');
                              context.read<DocumentProviderImpl>().deleteDocumentRes;
                            },
                                secondaryBtnTxt: 'CANCEL',
                                secondaryAction: () {});
                          },
                          child: Container(
                            width: kFlexibleSize(15),
                            height: kFlexibleSize(15),
                            child: deleteImage,
                          ),
                        ),
                      ),
                    if (myObj?.originalDocumentPath == null)
                      Padding(
                        padding: EdgeInsets.only(
                          right: kFlexibleSize(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.read<DocumentProviderImpl>().selectDocumentNo = myObj?.documentNo ?? '';
                            context.read<DocumentProviderImpl>().selectDocumentType = docTitle[index];
                            pickImage?.selectImage();
                          },
                          child: Container(
                            width: kFlexibleSize(15),
                            height: kFlexibleSize(15),
                            child: addGreyImage,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: kFlexibleSize(10)),
                if (myObj?.originalDocumentPath != null)
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
                if (myObj?.originalDocumentPath == null)
                  Container(height: kFlexibleSize(180), child: licenseImage)
              ],
            ),
          );
        },
      ),
    );
  }
}
