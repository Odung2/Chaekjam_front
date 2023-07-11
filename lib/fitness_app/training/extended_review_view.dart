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
        title: Text('Other Review Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data?.titleTxt ?? ''),
            Text(data?.subTxt ?? ''),

            // 필요한 정보 표시
          ],
        ),
      ),
    );
  }
}