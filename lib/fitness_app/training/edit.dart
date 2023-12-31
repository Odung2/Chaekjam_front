import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/painting.dart' as prefix0;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditNotePage extends StatefulWidget {


  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  bool isDirty = false;
  bool isNoteNew = true;
  FocusNode titleFocus = FocusNode();
  FocusNode contentFocus = FocusNode();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // titleController.text = currentNote.title;
    // contentController.text = currentNote.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    focusNode: titleFocus,
                    autofocus: true,
                    controller: titleController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onSubmitted: (text) {
                      titleFocus.unfocus();
                      FocusScope.of(context).requestFocus(contentFocus);
                    },
                    onChanged: (value) {
                      markTitleAsDirty(value);
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                        fontFamily: 'Line',
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Enter a title',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 32,
                          fontFamily: 'Line',
                          fontWeight: FontWeight.w700),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    focusNode: contentFocus,
                    controller: contentController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value) {
                      markContentAsDirty(value);
                    },
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Start typing...',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontFamily: 'Line',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
            ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    height: 80,
                    color: Theme.of(context).canvasColor.withOpacity(0.3),
                    child: SafeArea(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: handleBack,
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.delete_outline),
                            onPressed: () {
                              handleDelete();
                            },
                          ),
                          AnimatedContainer(
                            margin: EdgeInsets.only(left: 10),
                            duration: Duration(milliseconds: 200),
                            width: isDirty ? 100 : 0,
                            height: 42,
                            curve: Curves.decelerate,
                            child: ElevatedButton.icon(
                              // color: Theme.of(context).accentColor,
                              // textColor: Colors.white,
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(100),
                              //         bottomLeft: Radius.circular(100))),
                              icon: Icon(Icons.done),
                              label: Text(
                                'SAVE',
                                style: TextStyle(letterSpacing: 1),
                              ),
                              onPressed: handleSave,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ));
  }
  Future<String> validateJWTToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? successParameter = prefs.getString('success_parameter');

    // Use the retrieved value as needed
    return successParameter!;
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void handleSave() async {
    print(titleController.text);
    String? userToken = await validateJWTToken();
    final url = Uri.parse(
        'http://172.10.5.121:443/users/' + userToken);// Replace with your actual URL
    String title = titleController.text;
    String content = contentController.text;

    try {
      DateTime now = DateTime.now();
      String currentDate = "${now.year}-${now.month}-${now.day}";
      final response = await http.post((url),
        body: {
          'title': title,
          'content': content,
          'start_date' : currentDate,
          'end_date' : currentDate,
        },
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        // Request successful
        print('Data sent successfully');
        goBack(context);
      } else {
        // Request failed
        print('Failed to send data. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
    // setState(() {
    //   currentNote.title = titleController.text;
    //   currentNote.content = contentController.text;
    //   print('Hey there ${currentNote.content}');
    // });
    // if (isNoteNew) {
    //   var latestNote = await NotesDatabaseService.db.addNoteInDB(currentNote);
    //   setState(() {
    //     currentNote = latestNote;
    //   });
    // } else {
    //   await NotesDatabaseService.db.updateNoteInDB(currentNote);
    // }
    // setState(() {
    //   isNoteNew = false;
    //   isDirty = false;
    // });
    // widget.triggerRefetch();
    // titleFocus.unfocus();
    // contentFocus.unfocus();
  }

  void markTitleAsDirty(String title) {
    setState(() {
      isDirty = true;
    });
  }

  void markContentAsDirty(String content) {
    setState(() {
      isDirty = true;
    });
  }

  void markImportantAsDirty() {
    // setState(() {
    //   currentNote.isImportant = !currentNote.isImportant;
    // });
    // handleSave();
  }

  void handleDelete() async {
    if (isNoteNew) {
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text('Delete Note'),
              content: Text('This note will be deleted permanently'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('DELETE',
                      style: prefix0.TextStyle(
                          color: Colors.red.shade300,
                          fontFamily: 'Line',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1)),
                  onPressed: () {
                  //   await NotesDatabaseService.db.deleteNoteInDB(currentNote);
                  //   widget.triggerRefetch();
                  //   Navigator.pop(context);
                  //   Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: Text('CANCEL',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Line',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }

  void handleBack() {
    Navigator.pop(context);
  }
}