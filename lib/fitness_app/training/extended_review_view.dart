import 'dart:ffi';

import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'other_reivew_list_data.dart';

class ExtendedReviewView extends StatelessWidget{
  final OtherReviewListData? data;

  const ExtendedReviewView({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context){
    //큰 화면으로 보깅

    return Scaffold(
      appBar: AppBar(
        title: new Text(
          '상세 리뷰 보기 🐶',
        ),
        centerTitle: true,
        flexibleSpace: new Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  FitnessAppTheme.nearlyDarkBlue,
                  HexColor('#6A88E5'),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 280,
          child: Stack(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor('#F8FAFB'),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(16.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                      child: Text(
                                        data!.titleTxt,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Line',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 28,
                                          letterSpacing: 0.27,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex:7,
                                      child: SingleChildScrollView(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height,
                                          child: Column(
                                            children: <Widget>[
                                              Image.network(data!.imagePath),
                                              Flexible(flex:1, child: Spacer()),
                                              Flexible(
                                                flex:1,
                                                child: Text(     //디자인 수업료 부분이라 삭제
                                                  '작성자: ${data!.subTxt}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: 'Line',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 24,
                                                    letterSpacing: 0.27,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Flexible(flex:1, child: Spacer()),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      '${data!.rating}',
                                                      textAlign: TextAlign.right,
                                                      style: TextStyle(
                                                        fontFamily: 'Line',
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 20,
                                                        letterSpacing: 0.27,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: FitnessAppTheme.nearlyDarkBlue,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Flexible(flex:1, child: Spacer()),
                                              Flexible(
                                                flex: 14,
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width * 0.9,
                                                  height: MediaQuery.of(context).size.height * 0.9,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.indigo,
                                                      // width:10,
                                                    ),
                                                  ),
                                                  child: Text(     //디자인 수업료 부분이라 삭제
                                                    '${data!.reviews}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontFamily: 'Line',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 20,
                                                      letterSpacing: 0.27,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}