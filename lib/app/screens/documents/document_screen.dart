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
import 'package:local/app/views/network_image.dart';
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

            context
                .read<DocumentProviderImpl>()
                .uploadDoc(path: img?.path ?? '');
          } catch (e) {
            print("Exception:");
            print(e);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe5e5e5),
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
              title: 'No Data Found'));
    }

    final isLoading = document.getDocumentRes?.state == Status.LOADING ||
        document.uploadDocumentRes?.state == Status.LOADING ||
        document.deleteDocumentRes?.state == Status.LOADING;

    print("doc isLoading");

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: kFlexibleSize(15),
                      right: kFlexibleSize(15),
                      top: kFlexibleSize(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${docTitle[index]}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: kMediumFontSize,
                              fontWeight: FontWeight.w400)),
                      if (myObj?.originalDocumentPath != null)
                        InkWell(
                          onTap: () {
                            CustomPopup(context,
                                title: '',
                                message: 'Are you sure you want to delete',
                                primaryBtnTxt: 'DELETE', primaryAction: () {
                              context
                                  .read<DocumentProviderImpl>()
                                  .deleteDoc(docId: myObj?.documentId ?? '');
                              context
                                  .read<DocumentProviderImpl>()
                                  .deleteDocumentRes;
                            },
                                secondaryBtnTxt: 'CANCEL',
                                secondaryAction: () {});
                          },
                          child: Container(
                            width: kFlexibleSize(40),
                            height: kFlexibleSize(40),
                            child: Center(
                              child: Container(
                                width: kFlexibleSize(20),
                                height: kFlexibleSize(20),
                                child: deleteImage,
                              ),
                            ),
                          ),
                        ),
                      if (myObj?.originalDocumentPath == null)
                        InkWell(
                          onTap: () {
                            context
                                .read<DocumentProviderImpl>()
                                .selectDocumentNo = myObj?.documentNo ?? '';
                            context
                                .read<DocumentProviderImpl>()
                                .selectDocumentType = docTitle[index];
                            pickImage?.selectImage();
                          },
                          child: Container(
                            width: kFlexibleSize(40),
                            height: kFlexibleSize(40),
                            child: Center(
                              child: Container(
                                width: kFlexibleSize(20),
                                height: kFlexibleSize(20),
                                child: addGreyImage,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: kFlexibleSize(10)),
                if (myObj?.originalDocumentPath != null)
                  Container(
                    padding: EdgeInsets.only(
                        left: kFlexibleSize(10),
                        right: kFlexibleSize(10),
                        bottom: kFlexibleSize(5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kFlexibleSize(10)),
                      child: Container(
                        height: kFlexibleSize(180),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 10,
                            blurRadius: 20,
                            offset: Offset(0, 13), // changes position of shadow
                          ),
                        ]),
                        child: CustomNetWorkImage(
                            url: '${myObj?.originalDocumentPath }',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                if (myObj?.originalDocumentPath == null)
                  ClipRRect(
                      borderRadius: BorderRadius.circular(kFlexibleSize(10)),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: kFlexibleSize(10),
                              right: kFlexibleSize(10),
                              bottom: kFlexibleSize(5)),
                          height: kFlexibleSize(180),
                          child: licenseImage))
              ],
            ),
          );
        },
      ),
    );
  }
}
