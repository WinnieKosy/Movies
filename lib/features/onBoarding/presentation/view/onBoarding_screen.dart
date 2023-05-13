import 'package:flutter/material.dart';
import 'package:i_movies/features/onBoarding/presentation/components/onBoarding_screen_widget.dart';
import 'package:i_movies/utils/constants/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController controller = PageController(initialPage: 0);
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            OnBoardingWidget(
              image: Image.asset(
                'assets/images/theater.jpg',
                fit: BoxFit.cover,
              ),
              title: 'jjj',
              currentScreen: 0,
              description: 'kkk',
              screenNo: 3,
            ),
            OnBoardingWidget(
              image: Image.asset(
                'assets/images/popcorn.jpg',
                fit: BoxFit.cover,
              ),
              title: '',
              currentScreen: 1,
              description: '',
              screenNo: 3,
            ),
            OnBoardingWidget(
              image: Image.asset(
                'assets/images/chat.jpg',
                fit: BoxFit.cover,
              ),
              title: '',
              currentScreen: 2,
              description: '',
              screenNo: 3,
            )
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 70,
            child: Visibility(
              visible: !isLastPage,
              replacement: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 1.2, 50),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.registrationScreen);
                  },
                  child: const Text('Get Started'),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      controller.jumpToPage(2);
                    },
                    child: const Text('Skip'),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const WormEffect(
                          dotColor: Colors.grey,
                          activeDotColor: Colors.blueGrey),
                      onDotClicked: (index) {
                        controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: const Text('Next'),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
