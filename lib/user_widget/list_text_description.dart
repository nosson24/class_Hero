import 'package:flutter/material.dart';
import 'package:test_project/model/to_do_model.dart';
import 'package:test_project/profile_page.dart';
import 'package:test_project/service/to_do_list_service.dart';
import 'package:test_project/style/main_app_color.dart';

class TextDescription extends StatelessWidget {
  const TextDescription({
    Key? key,
    required this.toDo,
  }) : super(key: key);

  final ToDoModel toDo;

  // Widget _toDoCard() {
  //   return Container();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MainAppColor.mainColor,
        child: Column(
          children: [
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
                      child:
                          Text("Task detail", style: MainFontstyle.mainFont1)),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 85,
                  decoration: const BoxDecoration(
                    color: MainAppColor.mainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: ListTile(
                      title: Text(
                        toDo.topic ?? '-',
                        style: MainFontstyle.mainFont1,
                      ),
                      subtitle: Text(
                        toDo.datetime ?? '-',
                        style: MainFontstyle.mainFont1,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    alignment: Alignment.center,
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
                      onTap: () => showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text(
                                  "Are you sure to done this task ?",
                                  style: MainFontstyle.mainFont2),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        ToDoListService.reMoveToDo(toDo);
                                        Navigator.pushAndRemoveUntil<void>(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  const ProfilePage()),
                                          (route) => false,
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 66,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: MainAppColor.normalColor,
                                        ),
                                        child: const Text(
                                          "No",
                                          style: MainFontstyle.mainFont2,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: MainAppColor.normalColor,
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 35,
                        right: 35,
                      ),
                      child: Text(
                        toDo.description ?? '-',
                        style: MainFontstyle.mainFont2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
