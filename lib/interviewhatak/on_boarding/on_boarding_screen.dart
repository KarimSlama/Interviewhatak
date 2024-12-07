import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interviewhatak/core/helpers/extensions.dart';
import 'package:interviewhatak/core/helpers/spacing.dart';
import 'package:interviewhatak/core/routing/routes.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';
import 'package:interviewhatak/core/theming/app_strings/app_string.dart';
import 'package:interviewhatak/interviewhatak/on_boarding/models/boarding_list.dart';
import 'package:interviewhatak/interviewhatak/on_boarding/widgets/boarding_item_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              AppString.skip,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.orange,
                  ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 600.h,
            child: PageView.builder(
              onPageChanged: (value) {
                if (value == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BoardingItemWidget(
                boardingModel: boarding[index],
              ),
              itemCount: boarding.length,
            ),
          ),
          verticalSpace(15),
          SmoothPageIndicator(
            controller: pageController,
            count: boarding.length,
            effect: ExpandingDotsEffect(
              dotWidth: 12.0,
              dotHeight: 12.0,
              spacing: 5.0,
              expansionFactor: 3.0,
              dotColor: AppColors.grey,
              activeDotColor: AppColors.orange,
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    }
                    pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: isLast
                      ? Text(
                          AppString.start,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.orange,
                                  ),
                        )
                      : Text(
                          AppString.next,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.orange,
                                  ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } //end build()

  void submit() {
    context.pushNamed(Routes.loginScreen);
  }
}
