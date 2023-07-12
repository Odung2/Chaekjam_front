# :bulb: 책잼

> 👍 서로 함께 공통의 과제를 함으로써, 서버 및 DB를 활용하는 것에 익숙해지기


## 💻 Target Output -> Android Application Development by Kotlin
<img src="https://img.shields.io/badge/Android-3DDC84?style=flat-square&logo=android&logoColor=white"/> <img src="https://img.shields.io/badge/Android Studio-3DDC84?style=flat-square&logo=Android Studio&logoColor=white"/>
- [x] Building My Contacts.
- [x] Building My Image Gallery.
- [x] Free topic. In our case, Wise Sayings Generator(Kor).

Download our demo apk here -> 
[download APK](https://drive.google.com/file/d/1h7dVyx5X3itwq6C6Bf_071fLmV-kykjV/view?usp=sharing)
<br/>
## 🙆 Members
|Name|Education|github ID|
|:---|:---|:---|
|송도윤|GIST 전기전자컴퓨터공학부|[SongDerrick](https://github.com/SongDerrick/)|
|민지연|KAIST 전산학부|[jjangddu](https://github.com/Odung2/)|

please vist my blog haha 😄 -> [도윤송의 블로그](https://doyoonsong.vercel.app)
<br/>



## 📖 Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Installation](#installation)
- [Contributing](#contributing)
- [Acknowledgements](#acknowledgments)
  
## Project Description

지금 책잼은 독서를 새로운 차원으로 끌어올릴 수 있는 독서 플랫폼입니다. 책을 사랑하는 이들을 위해 다양한 기능을 제공하고 있습니다.
<br>
<br>
먼저, 책모임 홍보 서비스를 통해 독서 모임을 만들고 다른 사람들과 함께 책을 읽을 수 있게 도와드립니다. 
<br>
이를 통해 독서를 좀 더 즐겁고 의미 있는 경험으로 만들 수 있습니다. 
<br>
독서 모임에서는 책에 대한 감상을 공유하고, 독서 후기를 작성하여 다른 사람들과 소통할 수 있습니다.
<br>
<br>
또한, 책에 대한 기록을 남기고 다른 사람들과 공유하는 서비스를 제공합니다. 
<br>
내가 읽은 책들과 감상평을 기록하여 독서 경험을 기록으로 남길 수 있습니다. 
<br>
이를 통해 자신의 독서 성취를 확인하고, 다른 사람들과 읽은 책에 대한 이야기를 나눌 수 있습니다.
<br>
<br>
뿐만 아니라, 지금 어떤 책들을 읽고 있는지 알 수 있는 서비스도 제공합니다. 
<br>
다른 사람들의 독서 현황을 확인하여 독서 동기부여를 받을 수 있습니다.
<br>
<br>
또한, 내가 읽은 책들에 대한 추천도 받을 수 있어 새로운 독서 목록을 찾는 데 도움이 됩니다.
<br>
<br>
<br>
지금 책잼은 독서의 재미를 더하고, 독서를 사랑하는 사람들이 함께 소통하고 성장할 수 있는 플랫폼입니다. 
<br>
책잼을 통해 독서를 더욱 풍부하고 의미 있는 경험으로 만들어보세요!

### Loading Page             

|<img src="images/Screenshot_1.jpg" alt="Sc1" width="270" height="570">|

### Tab 1 : ☎️ 북클럽 모음
<img src="images/Screenshot_2.jpg" alt="Sc2" width="270" height="570"> <img src="images/Screenshot_5.jpg" alt="Sc5" width="270" height="570"> <img src="images/Tab1.gif" alt="Sc4" width="270" height="570">

북클럽 모음은 서버의 클럽, 모임 데이터를 모아볼 수 있는 화면입니다.<br>
북클럽 모음 종류는 정기적인 모임, 책을 기준으로 만나는 비정기적인 모임. 두 가지 종류의 모임을 모두 제공합니다.

### Tab 2 : 📑 리뷰모아             
<img src="images/Screenshot_3.jpg" alt="Sc3" width="270" height="570"> <img src="images/Screenshot_6.jpg" alt="Sc3" width="270" height="570"> <img src="images/Tab2.gif" alt="Sc4" width="270" height="570">

리뷰모아는 서버의 리뷰 데이터를 모아볼 수 있는 화면입니다.<br>
리뷰 데이터 가져오기: initializeOtherReviewList() 메서드를 호출하여 서버에서 리뷰 데이터를 가져옵니다. 해당 메서드는 비동기로 호출되므로 FutureBuilder 위젯을 사용하여 데이터가 로드될 때까지 대기하는 동안 로딩 상태를 표시할 수 있습니다.
리뷰 목록 표시: ListView.builder 위젯을 사용하여 가져온 리뷰 데이터를 목록 형태로 표시합니다. 각 리뷰 항목은 OtherReviewListView 위젯으로 표현되며, 애니메이션 효과와 함께 나타납니다.
애니메이션 효과: 각 리뷰 항목은 애니메이션 컨트롤러와 애니메이션을 사용하여 부드럽게 나타납니다. 스크롤할 때 애니메이션 효과가 적용되어 리스트가 부드럽게 움직입니다.
상세 리뷰 보기: 리뷰 목록의 리뷰 글을 클릭하면, 해당 리뷰만 큰 화면으로 따로 확인할 수 있습니다.

### Tab 3 : 👅 나의 리뷰                   
<img src="images/Screenshot_4.jpg" alt="Sc4" width="270" height="570"> <img src="images/Tab3.gif" alt="Sc4" width="270" height="570">

나의 리뷰는 이용자가 새로운 리뷰를 추가할 수 있는 화면입니다.<br>
새 리뷰 작성 : "existingNote"를 통해 리뷰를 작성할 수 있습니다.
제목 입력: 책의 제목을 입력하는 텍스트 필드를 제공합니다. 입력한 제목은 "titleController"를 통해 관리됩니다.
내용 입력: 책에 대한 리뷰 내용을 입력하는 텍스트 필드를 제공합니다. 입력한 내용은 "contentController"를 통해 관리됩니다.
노트 저장: "SAVE" 버튼을 클릭하면 현재 작성한 리뷰가 저장됩니다. 저장된 리뷰는 서버에 저장되거나 업데이트됩니다.

### Tab 3 : 👅 이스터에그                   
<img src="images/Screenshot_4.jpg" alt="Sc4" width="270" height="570"> <img src="images/Tab3.gif" alt="Sc4" width="270" height="570">

신기한 기능을 추가해보았습니다<br>
즐겨주세요

### Tab 3 : 👅 프로필                   
<img src="images/Screenshot_4.jpg" alt="Sc4" width="270" height="570"> <img src="images/Tab3.gif" alt="Sc4" width="270" height="570">

프로필 화면은 카카오톡 로그인을 통해 사용자 정보를 받아와 사용자 정보를 적절히 배치한 화면입니다.<br>
사용자의 프로필 사진을 띄우고, 서버에서 해당되는 사용자의 정보를 가져와 몇 권을 읽었고, 어떤 클럽에 가입되어 있는지 알려줍니다.

## Features

<br/>Main Activity<br/>
We used navgationcontroller to make three tabs in bottom. It is 'Phone, gallery, Wise Saying'

<br/>Phone<br/>
We used Relativelayout to put floating action button and recyclerview in one page.
In recyclerview, we put phonedata having 'name' and 'phoneNum'. 
<br/>
<img width="178" alt="image" src="https://github.com/SongDerrick/android_three_tab/assets/55375379/6c95836d-4c93-4cc5-b37f-99c82024cb43">
<br/>
one item of recyclerview is like this.

and if We push FAB(Floating Action Button), the bottom sheet appears to add contact.
<br/>
<img width="177" alt="image" src="https://github.com/SongDerrick/android_three_tab/assets/55375379/59ea947d-9f46-4fa2-87c3-2eae30d3fcad"><br/>
This is a capture of bottom sheet. <br/>
We can click 'ic_phone' to change our phone into calling page.

<br/>Gallery<br/>

in fragment_home.xml, we made recyclerview to show our gallery. and in activity_detailed.xml, we made detailed image view.
We used StaggeredGridLayoutManager to make grid resized depending on component image's size.<br/>
<img width="181" alt="image" src="https://github.com/SongDerrick/molcamp_week_1/assets/55375379/bfba0a94-e11b-432e-802c-12662aa9d9c9"><br/>
this is the detailed image view of our application.


<br/>Wise Saying<br/>

in fragment_notifications.xml we made Relativelayout that has progressbar and two textviews.we used api from https://api.qwer.pw/
we parsed wise saying with dashbar, dividing the wise saying and the person who made it.
  
## Installation

Nothing Special.<br/>
Clone and Build project in Android Studio.


## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!
<br/>
1.Fork the Project<br/>
2.Create your Feature Branch (```git checkout -b feature/AmazingFeature```)<br/>
3.Commit your Changes (```git commit -m 'Add some AmazingFeature'```)<br/>
4.Push to the Branch (```git push origin feature/AmazingFeature```)<br/>
5.Open a Pull Request<br/>

## Acknowledgments

<[https://api.qwer.pw/](https://github.com/mitesh77/Best-Flutter-UI-Templates.git)https://github.com/mitesh77/Best-Flutter-UI-Templates.git> <br/>
<[https://developer.android.com/docs?hl=ko](https://github.com/roshanrahman/flutter-notes-app.git)https://github.com/roshanrahman/flutter-notes-app.git  > <br/>
