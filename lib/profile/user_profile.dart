import 'package:flutter/material.dart';
import 'package:test_project/style/main_app_color.dart';

class ListProfile extends StatelessWidget {
  final String imgPath;
  final String name;
  final String heroClass;

  const ListProfile({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.heroClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: MainAppColor.mainColor,
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 22,
            ),
            Container(
              decoration: const BoxDecoration(
                color: MainAppColor.topBarColor,
              ),
              width: MediaQuery.of(context).size.width,
              height: 63,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: MainAppColor.normalColor,
                        size: 18,
                      ),
                    ),
                  ),
                  const Center(
                      child: Text("Other profile",
                          style: MainFontstyle.mainFont1)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 29,
                bottom: 29,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.blue),
                    height: 172,
                    width: 172,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 90.0,
                      backgroundImage: AssetImage(imgPath),
                    ),
                  ),
                  Text(
                    name,
                    style: MainFontstyle.mainFont1,
                  ),
                  Text(
                    heroClass,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: MainAppColor.bottomBarColor,
              ),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "9M",
                        style: TextStyle(
                            color: MainAppColor.mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Followers",
                        style: MainFontstyle.mainFont2,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(14),
                    width: 6,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: MainAppColor.mainColor,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "1,660",
                        style: TextStyle(
                            color: MainAppColor.mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Following",
                        style: MainFontstyle.mainFont2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      const BoxDecoration(color: MainAppColor.normalColor),
                  child: SingleChildScrollView(
                    child: Column(
                      children: const <Widget>[],
                    ),
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration:
                      const BoxDecoration(color: MainAppColor.normalColor),
                  child: Container(
                    margin: const EdgeInsets.only(left: 28),
                    child: const Text(
                      "10 Tasks remain",
                      style: MainFontstyle.mainFont2,
                    ),
                  ),
                ),
              ],
            ),
            /////
          ],
        ),
      ),
    );
  }
}
