import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class MyReviewData {
  MyReviewData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = "",

  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  String reviews;


  static List<MyReviewData> mylist = [];


  Future<String> validateJWTToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? successParameter = prefs.getString('success_parameter');

    // Use the retrieved value as needed
    return successParameter!;
  }

  //가보자고
  Future<void> initializeMyReviewList() async {
    String? userToken = await validateJWTToken();

    final url = Uri.parse(
        'http://172.10.5.121:443/users/' + userToken);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // print(response);
        final jsonData = json.decode(response.body);

        final List<dynamic> userData = jsonData as List<dynamic>;
        print(userData);
        final userName = userData[0]['username'] as String;
        final List<dynamic> titles = userData[0]['title'] as List<dynamic>;
        final List<dynamic> imageLinks = userData[0]['imagelink'] as List<dynamic>;
        final List<dynamic> contents = userData[0]['content'] as List<dynamic>;
        mylist = titles.map((title) {
          var index = titles.indexOf(title);
          // print(index);




          return MyReviewData(
            imagePath: imageLinks[index],
            titleTxt: title,
            subTxt: userName,
            reviews: contents[index],
          );
        }).toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
