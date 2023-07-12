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
                    // const SizedBox(
                    //   width: 48,
                    // ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor('#F8FAFB'),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(16.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            // const SizedBox(
                            //   width: 48 + 24.0,
                            // ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 16),
                                      child: Text(
                                        data!.titleTxt,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 28,
                                          letterSpacing: 0.27,
                                          color: FitnessAppTheme.nearlyDarkBlue,
                                        ),
                                      ),
                                    ),
                                    // const Expanded(
                                    //   child: SizedBox(),
                                    // ),
                                    Flexible(flex:1, child: Spacer()),
                                    Image.network(data!.imagePath),
                                    Flexible(flex:1, child: Spacer()),
                                    Flexible(
                                      // padding: const EdgeInsets.only(
                                      //     right: 16, bottom: 8),
                                      flex:7,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Flexible(
                                            flex:1,
                                            child: Text(     //디자인 수업료 부분이라 삭제
                                              '${data!.subTxt}',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'WorkSans',
                                                fontWeight: FontWeight.w200,
                                                fontSize: 24,
                                                letterSpacing: 0.27,
                                                color: Colors.black45,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex:1,
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '${data!.rating}',
                                                  textAlign:
                                                  TextAlign.right,
                                                  style: TextStyle(
                                                    fontFamily: 'WorkSans',
                                                    fontWeight:
                                                    FontWeight.w200,
                                                    fontSize: 24,
                                                    letterSpacing: 0.27,
                                                    color: Colors.black54,
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
                                          Flexible(
                                            flex: 8,
                                            child: Text(     //디자인 수업료 부분이라 삭제
                                              '${data!.reviews}',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'WorkSans',
                                                fontWeight: FontWeight.w200,
                                                fontSize: 24,
                                                letterSpacing: 0.27,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Padding(    //Join Course 파트인거 같아서 삭제
                                    //   padding: const EdgeInsets.only(
                                    //       bottom: 16, right: 16),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //     MainAxisAlignment
                                    //         .spaceBetween,
                                    //     crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    //     children: <Widget>[
                                    //       // Text(    //이게 수업료 파트
                                    //       //   '\$${category!.money}',
                                    //       //   textAlign: TextAlign.left,
                                    //       //   style: TextStyle(
                                    //       //     fontWeight: FontWeight.w600,
                                    //       //     fontSize: 18,
                                    //       //     letterSpacing: 0.27,
                                    //       //     color: DesignCourseAppTheme
                                    //       //         .nearlyBlue,
                                    //       //   ),
                                    //       // ),
                                    //       Container(
                                    //         decoration: BoxDecoration(
                                    //           color: DesignCourseAppTheme
                                    //               .nearlyBlue,
                                    //           borderRadius:
                                    //           const BorderRadius.all(
                                    //               Radius.circular(
                                    //                   8.0)),
                                    //         ),
                                    //         child: Padding(
                                    //           padding:
                                    //           const EdgeInsets.all(
                                    //               4.0),
                                    //           child: Icon(
                                    //             Icons.add,
                                    //             color:
                                    //             DesignCourseAppTheme
                                    //                 .nearlyWhite,
                                    //           ),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
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
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //         top: 24, bottom: 24, left: 16),
              //     child: Row(
              //       children: <Widget>[
              //         ClipRRect(
              //           borderRadius:
              //           const BorderRadius.all(Radius.circular(16.0)),
              //           child: AspectRatio(
              //               aspectRatio: 1.0,
              //               child: Image.network(data!.imagePath)),
              //         )
              //       ],
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.network(data?.imagePath ?? ''),
        //     Text(data?.titleTxt ?? ''),
        //     Text(data?.subTxt ?? ''),
        //     Text(data?.reviews ?? ''),
        //     // 필요한 정보 표시
        //   ],
        // ),
      ),
    );
  }
}