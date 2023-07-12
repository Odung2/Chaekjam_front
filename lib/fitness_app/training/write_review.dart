import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/training/my_review_data.dart';
import 'package:best_flutter_ui_templates/login_webview.dart';
import 'package:flutter/material.dart';
import '../fitness_app_home_screen.dart';
import '../../model/homelist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:best_flutter_ui_templates/fitness_app/ui_view/area_list_view.dart';
import 'package:best_flutter_ui_templates/fitness_app/training/edit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  List<MyReviewData> MyReviewList = [];
  AnimationController? animationController;
  bool multiple = true;
   // Store the BuildContext

  _MyHomePageState();


  @override
  void initState() {
    // initializeMyReviewList();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeMyReviewList();
  }



  Future<void> initializeMyReviewList() async {
      await MyReviewData().initializeMyReviewList();
      setState(() {
        MyReviewList = MyReviewData.mylist;
        // unRegListData = MealsListData.UnRegList;
      });
      print(MyReviewList[0]);
        //print(reviewsData);
        // MyReviewList = userData.map((reviewData) {
        //   var index = userData.indexOf(reviewData);
        //   print(reviewData);
        //
        //   final userName = reviewData['username'] as String;
        //   final userProfile = reviewData['profile_image'] as String;
        //   final reviewCount = reviewData['review_count'];
        //   final List<dynamic> titles = reviewData['title'] as List<dynamic>;
        //   final List<dynamic> imageLinks = reviewData['imagelink'] as List<dynamic>;
        //
        //   return MyReviewData(
        //     imagePath: imagelink,
        //     titleTxt: title,
        //     subTxt: username,
        //     reviews: content,
        //     rating: double.parse(rating),
        //   );
        // }).toList();

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
    final Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar(),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return GridView(
                            padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 16),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: List<Widget>.generate(
                              MyReviewList.length,
                              (int index) {
                                final int count = MyReviewList.length;
                                final Animation<double> animation =
                                    Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: animationController!,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn),
                                  ),
                                );
                                animationController?.forward();
                                return AreaView(
                                //     mainScreenAnimation: animation,
                                // mainScreenAnimationController: animationController!,
                                  title : MyReviewList[index].titleTxt,
                                  imageLink : MyReviewList[index].imagePath,
                                  animation: animation,
                                  animationController: animationController!,
                                );
                                // return HomeListView(
                                //   animation: animation,
                                //   animationController: animationController,
                                //   listData: homeList[index],
                                //   callBack: () {
                                //     Navigator.push<dynamic>(
                                //       context,
                                //       MaterialPageRoute<dynamic>(
                                //         builder: (BuildContext context) =>
                                //             homeList[index].navigateScreen!,
                                //       ),
                                //     );
                                //   },
                                // );
                              },
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: multiple ? 2 : 1,
                              mainAxisSpacing: 24.0,
                              crossAxisSpacing: 24.0,
                              childAspectRatio: 1,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,color: isLightMode ? Colors.white : AppTheme.nearlyBlack,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                  BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: isLightMode ? AppTheme.dark_grey : AppTheme.white,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '나의 리뷰 🐶',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Line',
                    color: isLightMode ? AppTheme.darkText : AppTheme.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: isLightMode ? Colors.white : AppTheme.nearlyBlack,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.add,
                    color: isLightMode ? AppTheme.dark_grey : AppTheme.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNotePage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[

                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
