import 'package:flutter/material.dart';

import '../../../home_page/ui/widgets/notification_screen.dart';
import '../../../home_page/ui/widgets/searbar_screen.dart';
import '../../../utils/style/colors.dart';
import '../widget/business-card.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
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
        backgroundColor: Colors.black,
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
                icon: ImageIcon(
                  AssetImage("assets/images/filter.png"),
                  color: Colors.white,
                ),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 0,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/sort.png"),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "A-Z",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 1,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                "assets/images/person.png",
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 2,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                "assets/images/views.png",
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Views",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 3,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                "assets/images/paper.png",
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        padding: EdgeInsets.all(10),
                        value: 4,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(
                                "assets/images/fav.png",
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Reviews",
                              style: TextStyle(color: Colors.white),
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
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()),
                  );
                },
                icon: ImageIcon(
                  AssetImage("assets/images/sort-amount-down.png"),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return BusinessCardScreen();
            }));
  }
}
