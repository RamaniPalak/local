import 'package:flutter/material.dart';
import 'package:local/app/utils/constants.dart';
import 'package:local/app/views/common_images.dart';

class ImageAndDetailsScreen extends StatelessWidget {
  const ImageAndDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: size.height * 0.37,
                child: Image.network(
                  'https://bocadolobo.com/en/inspiration-and-ideas/wp-content/uploads/2020/07/feature-image-70-1400x930.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                padding: EdgeInsets.all(kFlexibleSize(20)),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur dolor sit adipiscing consectetur elit.',
                          style: TextStyle(
                              color: kFontColor,
                              fontSize: kBigFontSize,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: kFlexibleSize(5)),
                        Text(
                          'By Chandresh Anand',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: kRegularFontSize,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kFlexibleSize(15)),
                    Container(height: 1, color: dividerColor),
                    SizedBox(height: kFlexibleSize(15)),
                    Column(
                      children: [
                        leadingIconWidget(
                            leading: clockBlackImage,
                            text: '7:00 am to 9:00 am'),
                        SizedBox(height: kFlexibleSize(10)),
                        leadingIconWidget(
                            leading: calendarBlackImage, text: 'Jan 4 2021'),
                        SizedBox(height: kFlexibleSize(10)),
                        leadingIconWidget(
                            leading: callImage, text: '+91 98765 43210'),
                      ],
                    ),
                    SizedBox(height: kFlexibleSize(15)),
                    Container(height: 1, color: dividerColor),
                    SizedBox(height: kFlexibleSize(15)),
                    Text(
                      """Lorem ipsum dolor sit amet, consectetur is adipiscing elit. Quis eget nisl duis facilisis feugiat eget. Pretium aenean leo sit amet iaculis sit tempor, augue was the suspendisse.
                       Tempor placerat venenatis, sit enim. In lorem neque sit ut ultricies enim sed orci, vel.
                     Sit elementum aliquet ac nec tortor eget interdum. Vel volutpat eu quisque the cursus vitae aliquam phallus sit. Diam enim nibh is lacus, massa luctus adipiscing varius id nam. Venenatis tellus maecenas tristique in. Faucibus augue vitae at orci vestibulum pulvinar.
                    Tempor placerat venenatis, sit enim. In lorem neque sit ut ostriches enim sed orc, vel. Sit elementum aliquot ac nec tortor eget interdum. Vel volutpat eu quisque the cursus vitae aliquam phasellus sit. Diam enim nibh is lacus, massa luctus adipiscing varius id nam. Venenatis tellus maecenas tristique in. Faucibus augue vitae at orci vestibulum pulvinar""",
                      style: kLongTitleStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row leadingIconWidget({required Widget leading, required String text}) {
    return Row(
      children: [
        Container(
            height: kFlexibleSize(16),
            width: kFlexibleSize(16),
            child: leading),
        SizedBox(
          width: kFlexibleSize(10),
        ),
        Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontSize: kMediumFontSize,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
