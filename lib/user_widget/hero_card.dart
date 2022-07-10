import 'package:flutter/material.dart';
import 'package:test_project/profile/user_profile.dart';
import 'package:test_project/style/main_app_color.dart';

class HeroCard extends StatelessWidget {
  final String imgPath;
  final String name;
  final String heroClass;
  // final String profile;

  const HeroCard({
    Key? key,
    required this.imgPath,
    required this.name,
    required this.heroClass,
    // required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 12,
      ),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 85,
      color: MainAppColor.mainColor,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return ListProfile(
                name: name,
                imgPath: imgPath,
                heroClass: heroClass,
              );
            }),
          );
        },
        leading: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              90,
            ),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(imgPath),
          ),
        ),
        title: Text(
          name,
          style: MainFontstyle.mainFont1,
        ),
        subtitle: Text(
          heroClass,
          style: MainFontstyle.mainFontNameClass,
        ),
      ),
    );
  }
}
