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

  static List<OtherReviewListData> hotelList = <OtherReviewListData>[
    OtherReviewListData(
      imagePath: 'assets/reviews/no_human_longer.png',
      titleTxt: '인간실격',
      subTxt: '인간실격 클럽',
      dist: 2.0,
      reviews: "다자이 오사무의 인간실격. 다자이에게 있어서 '인간'이란 무엇인가. 인간이란 어떤 조건을 만족하는가에 대해 치밀...",
      rating: 3.5,
      perNight: 180,
    ),
    OtherReviewListData(
      imagePath: 'assets/hotel/hotel_2.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: "74",
      rating: 4.5,
      perNight: 200,
    ),
    OtherReviewListData(
      imagePath: 'assets/hotel/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: "62",
      rating: 4.0,
      perNight: 60,
    ),
    OtherReviewListData(
      imagePath: 'assets/hotel/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: "90",
      rating: 4.4,
      perNight: 170,
    ),
    OtherReviewListData(
      imagePath: 'assets/hotel/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: "240",
      rating: 4.5,
      perNight: 200,
    ),
  ];
}
