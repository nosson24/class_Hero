import 'package:flutter/material.dart';
import 'package:test_project/profile_page.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/user_widget/hero_card.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  Widget topBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(157, 39, 28, 1),
      ),
      width: MediaQuery.of(context).size.width,
      height: 63,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () async {
                _onNavigate(const ProfilePage());
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const Center(
              child: Text(
            "Following",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )),
        ],
      ),
    );
  }

  Widget mainList() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: const [
            HeroCard(
              imgPath: 'assets/imageProfile3.png',
              name: 'Nezu',
              heroClass: 'Princial',
            ),
            HeroCard(
              imgPath: 'assets/imageProfile2.png',
              name: 'All Might',
              heroClass: 'Heroics Teacher',
            ),
            HeroCard(
              imgPath: 'assets/imageProfile4.png',
              name: 'Midnight',
              heroClass: 'Modern Hero Art History Teacher',
            ),
            HeroCard(
              imgPath: 'assets/imageProfile5.png',
              name: 'Eraser Head',
              heroClass: 'Class 1-A Homeroom Teacher',
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(248, 242, 242, 1)),
          child: Container(
            margin: const EdgeInsets.only(left: 28),
            child: const Text(
              "4 Follower",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: MainAppColor.mainColor,
        ),
        child: Column(
          children: [
            Container(
              height: 22,
            ),
            topBar(),
            mainList(),
            bottomBar(),
          ],
        ),
      ),
    );
  }

  void _onNavigate(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }
}
