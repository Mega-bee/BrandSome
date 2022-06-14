import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/BrandCard.dart';
import '../widgets/notification_screen.dart';
import '../widgets/personal_page.dart';
import '../widgets/searbar_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  void onSelected(BuildContext context, item) {
    switch (item) {
      case 0:
        print("Clicking add business");
        break;
      case 1:
        print("Clicking add post");
        break;
    }
  }

  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Brandsome",
            style: TextStyle(color: primaryColor),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchBarScreen()),
              );
            },
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
              color: Color(0xff262626),
              icon: Icon(Icons.add_circle_outline),
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      padding: EdgeInsets.all(10),
                      value: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add Business",
                            style: TextStyle(color: Colors.white),
                          ),
                          ImageIcon(
                            AssetImage(
                                "assets/images/material-business-center.png"),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      padding: EdgeInsets.all(10),
                      value: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add post",
                            style: TextStyle(color: Colors.white),
                          ),
                          ImageIcon(
                            AssetImage(
                              "assets/images/ionic-ios-paper.png",
                            ),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ]),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              icon: Icon(Icons.notifications_none),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              indicatorColor: primaryColor,
              unselectedLabelColor: Colors.white38,
              controller: _tabController,
              isScrollable: true,
              padding: const EdgeInsets.only(left: 10.0),
              tabs: [
                Tab(text: "Personal"),
                Tab(text: "Properties"),
                Tab(text: "Cars"),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: TabBarView(
              controller: _tabController,
              children: [
                PersonalPage(),
                Text('ollo'),
                Text('hello'),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              "Advanced interests",
              style: TextStyle(
                  color: primaryColor, decoration: TextDecoration.underline),
            ),
          ),
      Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (context, index) {
              return NewsCard();
            }),
      )
    ])
    );



  }
}
