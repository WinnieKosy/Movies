import 'package:flutter/material.dart';

class OnBoardingWidget extends StatefulWidget {
  final String title;
  final String description;
  final Image image;
  final int currentScreen;
  final int screenNo;
  const OnBoardingWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentScreen,
    required this.screenNo,
  }) : super(key: key);

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  PageController controller = PageController(initialPage: 0);
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(children: [
        Stack(
          children: [
            SizedBox(height: size.height, child: widget.image),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(widget.title), Text(widget.description)],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
