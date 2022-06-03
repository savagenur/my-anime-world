import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:my_animes/pages/main_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
              title: "Organise your anime",
              body:
                  "Know which episode you're on.\nRate what you've seen.\n\nEasily compare with friends.",
              image: buildImage("assets/images/process.png"),
              decoration: getPageDecoration()),
          PageViewModel(
              title: "Discuss anime",
              body:
                  "Talk about the latest episode.\nDiscuss upcoming series.\n\nShare thoughts with other fans",
              image: buildImage("assets/images/meeting.png"),
              decoration: getPageDecoration()),
          PageViewModel(
              title: "Discover new anime",
              body:
                  "See what's airing in Japan.\nCheck out trending series.\n\nNew favorites are waiting.",
              image: buildImage("assets/images/research.png"),
              decoration: getPageDecoration()),
        ],
        next: Text('Next'),
        done: InkWell(
            child: Text(
          'Start',
          style: TextStyle(fontSize: 22),
        )),
        onDone: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainPage()));
        },
      ),
    );
  }

  Widget buildImage(String assetName) => Center(child: Image.asset(assetName));
  PageDecoration getPageDecoration() {
    return PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(
          fontSize: 20,
        ),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.all(24),
        bodyPadding: EdgeInsets.symmetric(vertical: 20));
  }
}
