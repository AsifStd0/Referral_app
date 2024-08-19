import 'package:onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../style/colors.dart';
import '../SignIn/sign_in_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
            width: 0.0,
            color: whiteColor,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Fire & Water',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w300,
                      color: mainBlueColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/images/onboard1.png',
                    height: Get.height / 2.2,
                    //width: 389.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 0.90.sw,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur  elit. Nam dapibus ac libero id ndit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: mainBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
            width: 0.0,
            color: whiteColor,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Biohazard & Trauma',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w300,
                      color: mainBlueColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/images/onboard2.png',
                    height: Get.height / 2.2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 0.90.sw,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur  elit. Nam dapibus ac libero id ndit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: mainBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
            width: 0.0,
            color: whiteColor,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 30.h),
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    'Disaster Restoration Services',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w300,
                      color: mainBlueColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/images/onboard3.png',
                    height: Get.height / 2.2,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 0.90.sw,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur  elit. Nam dapibus ac libero id ndit.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        color: mainBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: mainBlueColor,
      child: Container(
        height: 56.h,
        width: 280.w,
        child: InkWell(
          borderRadius: defaultSkipButtonBorderRadius,
          onTap: () {
            if (setIndex != null) {
              index++;
              setIndex(index);
            }
          },
          child: const Padding(
            padding: defaultSkipButtonPadding,
            child: Center(
              child: Text(
                'NEXT',
                style: TextStyle(color: whiteColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: mainBlueColor,
      child: Container(
        height: 56.h,
        width: 280.w,
        child: InkWell(
          borderRadius: defaultProceedButtonBorderRadius,
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('OnBoardingScreensViewed', true);

            Get.offAll(SignInScreen());
          },
          child: const Padding(
            padding: defaultProceedButtonPadding,
            child: Center(
              child: Text(
                'GET STARTED',
                style: TextStyle(color: whiteColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: whiteColor,
                border: Border.all(
                  width: 0.0,
                  color: whiteColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIndicator(
                        netDragPercent: dragDistance,
                        pagesLength: pagesLength,
                        indicator: Indicator(
                          activeIndicator:
                              ActiveIndicator(color: mainBlueColor),
                          closedIndicator: ClosedIndicator(
                              color: mainBlueColor, borderWidth: 3),
                          indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                            polygon: DesignType.polygon_circle,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  index == pagesLength - 1
                      ? _signupButton
                      : _skipButton(setIndex: setIndex),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
