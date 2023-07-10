import 'package:http/http.dart' as http;
import 'dart:convert';


class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  var pngList = ['book1.png', 'book3.png', 'book2.png', 'book4.png'];
  var colorList = [['#FA7D82','#FFB295'],['#738AE6', '#5C5EDD'],['#FE95B6','#FF5287'],['#6F72CA','#1E1466']];
  static List<MealsListData> RegList = [];
  static List<MealsListData> UnRegList = [];

  Future<void> initializeRegList() async {
    final url = 'http://172.10.5.121:443/meeting/reg'; // Replace with your API URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);

        final List<dynamic> meetingsData = jsonData as List<dynamic>;
        print(meetingsData);
        RegList = meetingsData.map((meetingData) {
          var index = meetingsData.indexOf(meetingData);
          var veriIndex = index%4;
          var startC = '';
          var endC = '';
          var pngsrc = '';
          if (veriIndex == 0){
            startC = colorList[0][0];
            endC = colorList[0][1];
            pngsrc = pngList[0];
          } else if (veriIndex == 1){
            startC = colorList[1][0];
            endC = colorList[1][1];
            pngsrc = pngList[1];
          } else if (veriIndex == 2) {
            startC = colorList[2][0];
            endC = colorList[2][1];
            pngsrc = pngList[2];
          } else {
            startC = colorList[3][0];
            endC = colorList[3][1];
            pngsrc = pngList[3];
          }


          final title = meetingData['title'] as String;
          final location = meetingData['location'] as String;
          final description = meetingData['description'] as String;

          return MealsListData(
            imagePath: 'assets/fitness_app/' + pngsrc,
            titleTxt: title,
            kacl: 0,
            meals: <String>[location, 'description', 'Apple'],
            startColor: startC,
            endColor: endC,
          );
        }).toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> initializeUnRegList() async {
    final url = 'http://172.10.5.121:443/meeting/un_reg'; // Replace with your API URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {

        final jsonData = json.decode(response.body);

        final List<dynamic> meetingsData = jsonData as List<dynamic>;
        print(meetingsData);
        UnRegList = meetingsData.map((meetingData) {
          var index = meetingsData.indexOf(meetingData);
          var veriIndex = index%4;
          var startC = '';
          var endC = '';
          var pngsrc = '';
          if (veriIndex == 0){
            startC = colorList[0][0];
            endC = colorList[0][1];
            pngsrc = pngList[0];
          } else if (veriIndex == 1){
            startC = colorList[1][0];
            endC = colorList[1][1];
            pngsrc = pngList[1];
          } else if (veriIndex == 2) {
            startC = colorList[2][0];
            endC = colorList[2][1];
            pngsrc = pngList[2];
          } else {
            startC = colorList[3][0];
            endC = colorList[3][1];
            pngsrc = pngList[3];
          }
          final title = meetingData['title'] as String;
          final location = meetingData['location'] as String;
          final description = meetingData['description'] as String;
          return MealsListData(
            imagePath: 'assets/fitness_app/' + pngsrc,
            titleTxt: title,
            kacl: 0,
            meals: <String>[location, 'description', 'Apple'],
            startColor: startC,
            endColor: endC,
          );
        }).toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


//   static List<MealsListData> tabIconsList = <MealsListData>[
//     MealsListData(
//       imagePath: 'assets/fitness_app/book1.png',
//       titleTxt: 'Book Club 1',
//       kacl: 525,
//       meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
//       startColor: '#FA7D82',
//       endColor: '#FFB295',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book3.png',
//       titleTxt: 'Book Club 2',
//       kacl: 602,
//       meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
//       startColor: '#738AE6',
//       endColor: '#5C5EDD',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book2.png',
//       titleTxt: 'Book Club 3',
//       kacl: 0,
//       meals: <String>['Recommend:', '800 kcal'],
//       startColor: '#FE95B6',
//       endColor: '#FF5287',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book4.png',
//       titleTxt: 'Dinner',
//       kacl: 0,
//       meals: <String>['Recommend:', '703 kcal'],
//       startColor: '#6F72CA',
//       endColor: '#1E1466',
//     ),
//     MealsListData(
//     imagePath: 'assets/fitness_app/book1.png',
//     titleTxt: 'Book Club 4',
//     kacl: 600,
//     meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
//     startColor: '#FA7D82',
//     endColor: '#FFB295',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book3.png',
//       titleTxt: 'Book Club 2',
//       kacl: 602,
//       meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
//       startColor: '#738AE6',
//       endColor: '#5C5EDD',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book2.png',
//       titleTxt: 'Book Club 3',
//       kacl: 0,
//       meals: <String>['Recommend:', '800 kcal'],
//       startColor: '#FE95B6',
//       endColor: '#FF5287',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book4.png',
//       titleTxt: 'Dinner',
//       kacl: 0,
//       meals: <String>['Recommend:', '703 kcal'],
//       startColor: '#6F72CA',
//       endColor: '#1E1466',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book1.png',
//       titleTxt: 'Book Club 1',
//       kacl: 525,
//       meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
//       startColor: '#FA7D82',
//       endColor: '#FFB295',
//     ),
//     MealsListData(
//       imagePath: 'assets/fitness_app/book3.png',
//       titleTxt: 'Book Club 2',
//       kacl: 602,
//       meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
//       startColor: '#738AE6',
//       endColor: '#5C5EDD',
//     ),
//   ];
 }
