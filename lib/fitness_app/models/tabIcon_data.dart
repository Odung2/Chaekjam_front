import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/fitness_app/meetinggroup_default.jpg',
      selectedImagePath: 'assets/fitness_app/meetinggroup_end.jpg',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/review_default.jpg',
      selectedImagePath: 'assets/fitness_app/review_end.jpg',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/egg_default.jpg',
      selectedImagePath: 'assets/fitness_app/egg_end.jpg',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/profile_default.jpg',
      selectedImagePath: 'assets/fitness_app/profile_end.jpg',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
