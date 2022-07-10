import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_project/addtask_page.dart';
import 'package:test_project/followers.dart';
import 'package:test_project/following.dart';
import 'package:test_project/model/to_do_model.dart';
import 'package:test_project/service/to_do_list_service.dart';
import 'package:test_project/style/main_app_color.dart';
import 'package:test_project/user_widget/list_text_description.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ToDoModel> toDoList = ToDoListService.getToDoList();

  Widget _imageProfile() {
    return Container(
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
      child: const CircleAvatar(
        radius: 90.0,
        backgroundImage: AssetImage("assets/imageProfile.png"),
      ),
    );
  }

  Widget _name() {
    return const Text("Shoto Todoroki 555", style: MainFontstyle.mainFontName);
  }

  Widget _status() {
    return const Text(
      "student",
      style: MainFontstyle.mainFontNameClass,
    );
  }

  Widget _profile() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          _imageProfile(),
          _name(),
          _status(),
        ],
      ),
    );
  }

  Widget _followers() {
    return InkWell(
      onTap: () {
        _onNavigate(const FollowersPage());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "9M",
            style: GoogleFonts.roboto(
              textStyle: MainFontstyle.mainFont1,
              color: MainAppColor.mainColor,
            ),
          ),
          Text(
            "Followers",
            style: GoogleFonts.roboto(textStyle: MainFontstyle.mainFont2),
          ),
        ],
      ),
    );
  }

  Widget _following() {
    return InkWell(
      onTap: () {
        _onNavigate(const FollowingPage());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "1,660",
            style: GoogleFonts.roboto(
              textStyle: MainFontstyle.mainFont1,
              color: MainAppColor.mainColor,
            ),
          ),
          Text(
            "Following",
            style: GoogleFonts.roboto(textStyle: MainFontstyle.mainFont2),
          ),
        ],
      ),
    );
  }

  Widget _followBar() {
    return Container(
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
          _followers(),
          Container(
            margin: const EdgeInsets.all(14),
            width: 6,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: MainAppColor.mainColor,
            ),
          ),
          _following(),
        ],
      ),
    );
  }

  Widget _listView() {
    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: MainAppColor.normalColor,
          ),
          child: ListView.separated(
            itemCount: toDoList.length,
            itemBuilder: (_, int index) {
              return Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: const BoxDecoration(
                      color: MainAppColor.mainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: ListTile(
                        onTap: () => _onNavigate(TextDescription(
                          toDo: toDoList[index],
                        )),
                        title: Text(
                          toDoList[index].topic ?? '-',
                          style: GoogleFonts.roboto(
                            textStyle: MainFontstyle.mainFont1,
                          ),
                        ),
                        subtitle: Text(
                          toDoList[index].datetime ?? '-',
                          style: GoogleFonts.roboto(
                            textStyle: MainFontstyle.mainFont1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      width: 86,
                      height: 85,
                      decoration: const BoxDecoration(
                        color: MainAppColor.buttonColor,
                      ),
                      child: GestureDetector(
                        child: const Text(
                          "Done",
                          style: MainFontstyle.mainFont1,
                        ),
                        onTap: () => _onDelete(toDoList[index]),
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (_, int indexT) =>
                const Divider(endIndent: 15, indent: 15),
          )),
    );
  }

  void _onDelete(ToDoModel toDo) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text(
            "Are you sure to done this task ?",
            style: MainFontstyle.mainFont2,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    ToDoListService.reMoveToDo(toDo);

                    Navigator.pop(context, true);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 66,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MainAppColor.mainColor,
                    ),
                    child: const Text(
                      "Yes",
                      style: MainFontstyle.mainFont1,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 66,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MainAppColor.normalColor,
                    ),
                    child: const Text("No", style: MainFontstyle.mainFont2),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _bottomBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: const BoxDecoration(color: MainAppColor.bottomBarColor),
          child: Container(
            margin: const EdgeInsets.only(left: 28),
            child: Text(
              "${ToDoListService.getToDoList().length} Tasks remain",
              style: GoogleFonts.roboto(
                textStyle: MainFontstyle.mainFont1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addbutton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(
          right: 24,
          bottom: 32,
        ),
        height: 65,
        width: 65,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: MainAppColor.buttonColor,
            borderRadius: BorderRadius.circular(60)),
        child: IconButton(
          icon: const Icon(Icons.add),
          color: MainAppColor.normalColor,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddTask()))
                .then((_) => setState(() {}));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            color: MainAppColor.mainColor,
          ),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: 22,
                  ),
                  _profile(),
                  _followBar(),
                  _listView(),
                  _bottomBar(),
                ],
              ),
              _addbutton(),
            ],
          )),
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
