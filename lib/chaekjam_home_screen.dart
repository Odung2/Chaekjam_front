import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/login_webview.dart';
import 'package:flutter/material.dart';
import 'fitness_app/fitness_app_home_screen.dart';
import 'model/homelist.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    var brightness = MediaQuery
        .of(context)
        .platformBrightness;
    bool isLightMode = brightness == Brightness.light;

    return Scaffold(
      backgroundColor:
      isLightMode == true ? AppTheme.white : AppTheme.nearlyBlack,
      body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Padding(
                padding: EdgeInsets.only(top: MediaQuery
                    .of(context)
                    .padding
                    .top),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/images/chaekjam_nubjuki.png'),
                    Center(

                      child: Text(
                        '책잼',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: 'Line',
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: size.width * 0.8,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              '책잼, 독서의 새로운 차원!\n독서모임을 만들고, 함께 책을 읽는 사람들과 소통해보세요. \n감상 공유, 독서 후기 작성, 다양한 독서 모임 참여 등 다채로운 기능을 경험해보세요. \n책을 사랑하는 이들을 위한 독서 플랫폼, 지금 책잼에서 독서의 재미를 더해보세요!',
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Line',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ],
                          onTap: () {
                            print("I am executing");
                          },
                        ),
                      ),
                    ),
                    SizedBox( //버튼 아래 여백 공간
                        height: 30
                    ),
                    SizedBox( //버튼 아래 여백 공간
                        height: 16
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyWebView()),
                          );
                          // Perform Kakao login here
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero, // 패딩 제거
                          minimumSize: Size(215, 48), // 최소 크기 설정
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          primary: Color(0xFFFEE500),
                        ),
                        child: Text(
                          '카카오톡으로 로그인',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF4E4E4E),
                            fontSize: 18,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.28,
                          ),
                        ),
                      ),
                    ),
                    SizedBox( //버튼 아래 여백 공간
                        height: 16
                    ),
                  ],
                ),
              );

            }
          },
      ),


    );
  }

}