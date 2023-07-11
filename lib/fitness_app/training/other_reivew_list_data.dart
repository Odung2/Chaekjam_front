import 'package:http/http.dart' as http;
import 'dart:convert';


class OtherReviewListData {
  OtherReviewListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = "",
    this.rating = 4.5,
    this.perNight = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  String reviews;
  int perNight;

  static List<OtherReviewListData> hotelList = [];

  //가보자고
  Future<void> initializeOtherReviewList() async {
    final url = 'http://172.10.5.121:443/review/'; // Replace with your API URL
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response);

        final jsonData = json.decode(response.body);

        final List<dynamic> reviewsData = jsonData as List<dynamic>;
        //print(reviewsData);
        hotelList = reviewsData.map((reviewData) {
          var index = reviewsData.indexOf(reviewData);
          print(reviewData);

          final user_id = reviewData['user_id'] as int;
          final book_id = reviewData['book_id'] as int;
          final title = reviewData['title'] as String;
          final meeting_id = reviewData['meeting_id'] as int;
          final rating = reviewData['rating'] as String;
          final content_id = reviewData['content_id'] as int;
          final content = reviewData['content'] as String;
          final username = reviewData['username'] as String;
          final imagelink = reviewData['imagelink'] as String;

          return OtherReviewListData(
            imagePath: imagelink,
            titleTxt: title,
            subTxt: username,
            reviews: content,
            rating: double.parse(rating),
          );
        }).toList();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }


// static List<OtherReviewListData> hotelList = <OtherReviewListData>[
  //   OtherReviewListData(
  //     imagePath: 'assets/reviews/no_human_longer.png',
  //     titleTxt: '인간실격',
  //     subTxt: '인간실격 클럽',
  //     dist: 2.0,
  //     reviews: "다자이 오사무의 인간실격. 다자이에게 있어서 '인간'이란 무엇인가. 인간이란 어떤 조건을 만족하는가에 대해 치밀...",
  //     rating: 3.5,
  //     perNight: 180,
  //   ),
  //   OtherReviewListData(
  //     imagePath: 'assets/reviews/why_fish_dont_exist.jpg',
  //     titleTxt: '물고기는 존재하지 않는다',
  //     subTxt: '송도윤',
  //     dist: 4.0,
  //     reviews: "‘물고기’ 하면 보통 어떤 생각이 드나요? 땡그란 눈에 아가미, 비늘 등 아마 물고기의 특징이 주로 떠오를 것입니다. 그런 물고기가 존재하지 않는다니, 어떤 의미일지 궁금하지 않나요? 물고기가 존재하지 않는다 하면, 여러 생각이 들 수 있겠죠. 환경오염으로 물고기들이 멸종한 이야기일 수도 있고, 물고기들의 존재가 얼마나 중요한지 일깨워주는 이야기일 수도 있을 거예요. 하지만 이 책에서 말하는 물고기는 저희가 보통 생각하는 ‘물고기’ 한 개체를 말하는 것이 아닙니다. 이 책에서 말하는 물고기는 ‘어류’를 말하고 있습니다.그러므로 『물고기가 존재하지 않는다』라는 이 책 제목의 의미는 물고기, 즉 ‘어류’라는 것이 존재하지 않는다는 의미입니다. 포유류, 조류, 양서류 등의 분류 체계에서 어류가 없다는 것입니다. ‘어류’가 존재하지 않는다는 말에 당황하고, 자신의 상식이 부정당한 것 같다는 생각이 드시는 분이 있을 겁니다. 그것이 바로 이 책의 핵심이라고 할 수 있습니다. 우리가 그동안 당연하게 생각하고 의심 없이 받아들였던 그 생각들이, 사실은 진실이 아닐 수도 있다는 것입니다. 그것이 바로 왜 제가 이 책의 대상을 대학생, 성인 이상으로 선정한 이유기도 합니다. 책의 내용이 어렵거나 난해해서가 아닌, 누구나 보편적인 교육을 받았다면 생각할 수 있는 상식을 깨부수기 때문에 기초적인 지식을 갖춘 사람이 좀 더 이 책의 주제를 깊이 이해할 수 있다고 생각했기 때문입니다. 저희가 초·중·고 기본 교육을 받으면서 생물의 분류를 배우잖아요. 다양한 지식은 없어도 이런 분류체계에 대한 기본 지식 정도는 가지고 이 책을 접하면 좋으리라 생각합니다.자신의 지식이 오히려 자신의 족쇄일 수 있다는 사실, 그 사실을 받아들일 준비가 된 분들에게 이 책을 추천합니다. 저희는 진리라고 하면 보통 의심 없이 받아들이는 경향이 있습니다. 그런 진리, 체계 등에 대해 한 번도 생각해보지 않은 분들은 이 책을 읽으면 감회를 느끼겠다고 생각합니다.이 책의 저자인 ‘룰루밀러’를 소개하겠습니다. 룰루밀러는 과학 기자로, 이 『물고기가 존재하지 않는다』가 그녀의 첫 번째 전기입니다. 그런데도 폭발적인 인기를 끌었습니다. 그녀는 자기 삶에 대한 고민이 아주 컸습니다. 어느 날, 그녀는 자기 아버지에게 인생의 의미를 묻습니다. 그러자 아버지는 기다렸다는 듯 인생은 아무 의미 없는 것이고, 운명도, 계획도, 그저 태어나서 죽는 것뿐이라고 말합니다. 그녀는 더욱더 혼란스러워하며 그 ‘혼돈’ 속에서 자신만의 해답을 찾으려 노력합니다. 그러던 중 ‘데이비드 조던’을 알게 되어 그를 자신 인생의 롤모델로 삼으려 합니다. 자기 일을 우직하게 하는 그가 자신의 ‘혼돈’을 해결해주겠다고 생각하였기 때문입니다.데이비드 조던은 이 책에 전반적으로 등장하는 주요 인물입니다. 이 사람을 한마디로 표현한다면 ‘열광적인 분류학자’입니다. 어렸을 때 이름 모르는 꽃을 분류하는 그를 보며, 모두 이상하게 생각하였지만, 그는 그 일을 멈추지 않았습니다. 단순한 꽃들, 분류에서 더 나아가 모든 물고기를 분류하겠다는 야망을 품게 되었습니다. 하지만 그의 노력을 비웃듯이, 많은 시련이 있었습니다. 1906년, 샌프란시스코 대지진으로 수집한 어류 표본이 모두 내동댕이쳐졌습니다. 그렇지만 그는 좌절하지 않고 물고기 피부 하나하나에 이름표를 꿰매 붙였습니다.",
  //     rating: 4.5,
  //     perNight: 200,
  //   ),
  //   OtherReviewListData(
  //     imagePath: 'assets/hotel/hotel_3.png',
  //     titleTxt: 'Grand Royal Hotel',
  //     subTxt: 'Wembley, London',
  //     dist: 3.0,
  //     reviews: "62",
  //     rating: 4.0,
  //     perNight: 60,
  //   ),
  //   OtherReviewListData(
  //     imagePath: 'assets/hotel/hotel_4.png',
  //     titleTxt: 'Queen Hotel',
  //     subTxt: 'Wembley, London',
  //     dist: 7.0,
  //     reviews: "90",
  //     rating: 4.4,
  //     perNight: 170,
  //   ),
  //   OtherReviewListData(
  //     imagePath: 'assets/hotel/hotel_5.png',
  //     titleTxt: 'Grand Royal Hotel',
  //     subTxt: 'Wembley, London',
  //     dist: 2.0,
  //     reviews: "240",
  //     rating: 4.5,
  //     perNight: 200,
  //   ),
  // ];
}
