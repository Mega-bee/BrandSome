import 'package:brandsome/utils/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/notification_screen.dart';
import '../widgets/searbar_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                            AssetImage("assets/images/ionic-ios-paper.png",),
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
    );
  }
}
