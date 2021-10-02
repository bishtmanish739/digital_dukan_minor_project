import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroSlides extends StatefulWidget {
  IntroSlides({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _IntroSlidesState createState() => _IntroSlidesState();
}

class _IntroSlidesState extends State<IntroSlides> {
  final introshown = GetStorage();
  void onDone(context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/initialScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: IntroductionScreen(
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          next: Container(
            width: 200,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
          skip: Container(
            width: 200,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                'Skip',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
          done: Container(
            width: 200,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              child: Text(
                'Done',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
          onDone: () {
            onDone(context);
          },
          onSkip: () {
            onDone(context);
          },
          pages: [
            PageViewModel(
              title: "Welcome To Digital Dukaan",
              body: "We Created something specail for you..",
              image: const Center(
                  child: Icon(
                Icons.shopping_cart,
                color: Colors.green,
                size: 100,
              )),
              footer: MaterialButton(
                onPressed: () {
                  // On button presed
                },
                child: const Text("Let's Go !"),
              ),
            ),
            PageViewModel(
              title: "Now All Nearby Shop Availble In Your Pocket",
              body:
                  "You need not to stand in a boring queue for products. You can Order Now and pick them later too",
              image: const Center(
                  child: Icon(
                Icons.shopping_basket,
                color: Colors.green,
                size: 200,
              )),
              footer: MaterialButton(
                onPressed: () {
                  // On button presed
                },
                child: const Text(
                  "Let's Go !",
                ),
              ),
            )
          ],
        ));
  }
}
