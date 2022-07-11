import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/model/to_do_model.dart';

import 'package:test_project/profile_page.dart';
import 'package:test_project/service/to_do_list_service.dart';
import 'package:test_project/style/main_app_color.dart';

class AddTask extends StatefulWidget {
  final String? title;

  const AddTask({Key? key, this.title}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late final TextEditingController _editTopic;
  late final TextEditingController _editDescription;
  String time = ("Date : ") +
      DateFormat("yyyy/MM/dd kk:mm").format(DateTime.now()).toString();

  @override
  void initState() {
    _editTopic = TextEditingController(text: widget.title ?? '');
    _editDescription = TextEditingController();

    super.initState();
  }

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
            "Add task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )),
        ],
      ),
    );
  }

  Widget topic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Text(
                "Topic",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              child: TextButton(
                child: const Text(
                  "Clear",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () => _editTopic.clear(),
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          height: 43,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: TextField(
              controller: _editTopic,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Text(
            "Description",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
          ),
          width: MediaQuery.of(context).size.width,
          height: 155,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: TextField(
              controller: _editDescription,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showBox(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    final text1 = _editTopic.text;
                    final text2 = _editDescription.text;
                    final text3 = time;
                    if (text1.isNotEmpty) {
                      ToDoListService.saveToDo(ToDoModel(
                        topic: text1,
                        description: text2,
                        datetime: text3,
                      ));
                      Navigator.pushAndRemoveUntil<void>(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ProfilePage()),
                        (route) => false,
                      );
                    }
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 66,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: const Text(
                      "No",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Widget mainList() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            children: [
              topic(),
              description(),
            ],
          ),
        )),
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            showBox("Are you sure to done this task ?");
          },
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(42, 198, 76, 1),
            ),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: const Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
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
