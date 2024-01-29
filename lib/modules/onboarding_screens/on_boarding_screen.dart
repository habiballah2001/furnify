import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../layout/layout.dart';
import '../../shared/components.dart';
import '../../shared/constants.dart';
import '../../shared/custom_widgets/custom_texts.dart';
import '../../shared/network/local/cache_helper.dart';
import '../../shared/style/colors.dart';
import 'on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoard', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, const AppLayout());
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  PageView.builder(
                    controller: boardController,
                    itemBuilder: (context, index) => OnBoardingItem(
                      image: Lists.boarding[index].image,
                      title: Lists.boarding[index].title,
                      body: Lists.boarding[index].body,
                    ),
                    itemCount: Lists.boarding.length,
                    onPageChanged: (index) {
                      if (index == Lists.boarding.length - 1) {
                        isLast = true;
                      } else {
                        isLast = false;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: submit,
                          child: InkWell(
                            onTap: submit,
                            child: const TitleLargeText(
                              'Skip',
                            ),
                          ),
                        ),
                        SmoothPageIndicator(
                          effect: const ExpandingDotsEffect(
                            activeDotColor: thColor,
                          ),
                          controller: boardController,
                          count: Lists.boarding.length,
                        ),
                        FloatingActionButton(
                          backgroundColor: secColor,
                          onPressed: () {
                            if (isLast) {
                              submit();
                            } else {
                              boardController.nextPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
