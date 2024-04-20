// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/models/model_app.dart';

class TODOApp extends StatefulWidget {
  const TODOApp({Key? key}) : super(key: key);

  @override
  State<TODOApp> createState() => _TODOAppState();
}

class _TODOAppState extends State<TODOApp> {
  String userName = "Name";
  bool isName = false;
  // TimeOfDay time = TimeOfDay.now();
  // DateTimeRange dateRange =
  //     DateTimeRange(start: DateTime.now(), end: DateTime.now());
  TimeOfDay time = TimeOfDay.now();

  DateTimeRange daterange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  DateTime selectDate = DateTime.now();
  var image;
  Future<void> getImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final pickerImage = await imagePicker.pickImage(source: source);

    if (pickerImage != null) {
      setState(() {
        image = File(pickerImage.path);
      });
    }
  }

  late int index;
  List todoList = [];
  final TextEditingController title = TextEditingController();
  final TextEditingController profileName = TextEditingController();

  final TextEditingController decs = TextEditingController();
  final TextEditingController titleEdit = TextEditingController();
  final TextEditingController descEdit = TextEditingController();

  bool istitle = false;
  bool isdecs = false;

  bool bodyColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor
          ? const Color.fromARGB(255, 59, 58, 58)
          : const Color.fromARGB(255, 143, 208, 238),
      appBar: AppBar(
        backgroundColor: bodyColor
            ? const Color.fromARGB(255, 59, 58, 58)
            : const Color.fromARGB(255, 143, 208, 238),
        title: Center(
          child: Text(
            "TODO APP",
            style: TextStyle(
              color: bodyColor
                  ? Colors.white
                  : const Color.fromARGB(255, 49, 48, 48),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor:
            bodyColor ? const Color.fromARGB(255, 59, 58, 58) : Colors.white,
        child: Column(
          children: [
            SizedBox(height: 40),
            Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: image != null ? FileImage(image) : null,
                    child: image == null ? Text("Upload your Profile") : null,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 1,
                  child: IconButton(
                    onPressed: () {
                      // getImage(ImageSource.gallery);
                      getImage(ImageSource.camera).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.transparent,
                            content: Center(
                                child: Text("profile uploded Scuccessfully"))));
                      });
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 110,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                    color: bodyColor ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        image = null;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.transparent,
                          content: Center(
                              child: Text("profile is Delete Successfully"))));
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
            Divider(),
            ListTile(
              title: Text(
                "Theme",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: bodyColor ? Colors.white : Colors.black,
                ),
              ),
              trailing: Switch(
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.white,
                value: bodyColor,
                onChanged: (value) {
                  setState(() {
                    bodyColor = !bodyColor;
                  });
                },
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Column(
                        children: [
                          Text("Enter your name"),
                          TextField(
                            controller: profileName,
                            decoration: InputDecoration(
                              hintText: "enter your name",
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (profileName.text.isEmpty) {
                                        todoList.add(todoList[index].title);
                                        userName = profileName.text;
                                        isName != isName;
                                        Navigator.pop(context);
                                      }
                                    });
                                  },
                                  child: Text("Add")),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                            ],
                          )
                        ],
                      ));
                    });
              },
              child: InkWell(
                onTap: () {
                  setState(() {
                    isName != isName;
                  });
                },
                child: ListTile(
                  title: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: isName == false
                          ? Text(" Name")
                          : Text("${profileName.text}")),
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: Column(
                                children: [
                                  Text("Enter your name"),
                                  TextField(
                                    controller: profileName,
                                    decoration: InputDecoration(
                                      hintText: "enter your name",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (profileName.text.isEmpty) {
                                                todoList
                                                    .add(todoList[index].title);
                                              }
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Text("Add")),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel")),
                                    ],
                                  )
                                ],
                              ));
                            });
                      },
                      icon: Icon(Icons.edit)),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bodyColor == false
                  ? Text(
                      "Title:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "Title:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
              SizedBox(height: 10),
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  labelText: "Title",
                  prefixIcon: Icon(Icons.title),
                  hintText: "Enter a title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              bodyColor == false
                  ? Text(
                      "Description:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "Description:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
              SizedBox(height: 10),
              TextFormField(
                controller: decs,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: "Description",
                  hintText: "Enter a description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Time:",
                    style: TextStyle(
                        // color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    label: Text("Select Time"),
                    icon: Icon(Icons.watch_later),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(140, 40),
                        shadowColor: Colors.black,
                        shape: ContinuousRectangleBorder()),
                    onPressed: () async {
                      TimeOfDay? selectTime = await showTimePicker(
                          context: context, initialTime: time);

                      if (selectTime != null) {
                        setState(() {
                          time = selectTime;
                        });
                      }
                    },
                    // child: Text("Set Time")
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Date:",
                    style: TextStyle(
                        // color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    label: Text("Set Date"),
                    icon: Icon(Icons.calendar_month),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(147, 40),
                        shadowColor: Colors.black,
                        shape: ContinuousRectangleBorder()),
                    onPressed: () async {
                      DateTime? selectDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2030));
                      if (selectDate != null) {
                        setState(() {
                          selectDate = selectDate;
                        });
                      }
                    },
                    // child: Text("Set Date")
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                    shadowColor: Colors.black,
                    // shape: ContinuousRectangleBorder()
                  ),
                  onPressed: () {
                    setState(() {
                      if (title.text.isNotEmpty || decs.text.isNotEmpty) {
                        todoList
                            .add(TodoModel(title: title.text, desc: decs.text));

                        // istitle == true
                        //     ? todoList
                        //         .add(TodoModel(title: title.text, desc: decs.text))
                        //     : Text("data");
                        // isdecs == true
                        //     ? todoList
                        //         .add(TodoModel(title: title.text, desc: decs.text))
                        //     : Text("data");
                      } else {
                        // Show a message when both title and description are empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.transparent,

                            // backgroundColor: Colors.pink,
                            // width: 200,
                            // shape: ShapeBorder.lerp(, b, t),
                            // margin: EdgeInsets.all(12),
                            //
                            // duration: Duration(seconds: 2),
                            content: Center(
                                child: Text(
                              'Please enter your title and Descrption!',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                            action: SnackBarAction(label: "", onPressed: () {}),
                          ),
                        );
                      }

                      title.clear();
                      decs.clear();
                    });
                  },
                  child: Text(
                    "Add Task",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.amber,
                        child: Icon(Icons.delete),
                      ),
                      child: Card(
                        color: bodyColor
                            ? const Color.fromARGB(255, 59, 58, 58)
                            : const Color.fromARGB(255, 143, 208, 238),
                        shadowColor: Colors.black,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Selected Date:",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${selectDate.toString().substring(0, 11)}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Selected Time:",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: bodyColor
                                            ? Colors.white.withOpacity(0.8)
                                            : const Color.fromARGB(
                                                255, 59, 58, 58),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              title: Text("Title:  ${todoList[index].title}"),
                              subtitle:
                                  Text("Description:  ${todoList[index].desc}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.amber,
                                            title: Text(
                                                "Do you want to change your task?"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextFormField(
                                                  controller: titleEdit,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText: "Edit title",
                                                  ),
                                                ),
                                                SizedBox(height: 15),
                                                TextFormField(
                                                  controller: descEdit,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    hintText:
                                                        "Edit description",
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (titleEdit.text
                                                                  .isEmpty ||
                                                              descEdit.text
                                                                  .isEmpty) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                content: Center(
                                                                  child: Text(
                                                                    "Please put something..",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            todoList[index]
                                                                    .title =
                                                                titleEdit.text;
                                                            todoList[index]
                                                                    .desc =
                                                                descEdit.text;
                                                            Navigator.pop(
                                                                context);
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                content: Center(
                                                                  child: Text(
                                                                      "Your data is update Successfully.."),
                                                                ),
                                                              ),
                                                            );
                                                            titleEdit.clear();
                                                            descEdit.clear();
                                                          }
                                                        });
                                                      },
                                                      child: Text("Add"),
                                                    ),
                                                    SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel"),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        todoList.removeAt(index);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.transparent,
                                            content: Center(
                                              child: Text(
                                                  "Your data is Deleted Successfully.."),
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
