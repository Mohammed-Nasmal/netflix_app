import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix_app/dummy_db.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';
import 'package:netflix_app/utils/constants/image_constants.dart';
import 'package:netflix_app/view/global_widgets/user_name_card.dart';

class Morescreen extends StatefulWidget {
  const Morescreen({super.key});

  @override
  State<Morescreen> createState() => _MorescreenState();
}

class _MorescreenState extends State<Morescreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: SafeArea(
        child: Column(
          children: [
            _buildUserSelectionScreen(),
            SizedBox(height: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: ColorConstants.mainWhite,
                ),
                SizedBox(width: 6),
                Text(
                  "Manage Profiles",
                  style: TextStyle(color: ColorConstants.mainWhite),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.sms,
                        color: ColorConstants.mainWhite,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Tell friends about Netflix.",
                        style: TextStyle(
                            color: ColorConstants.mainWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Lorem ipsum dolor sit amet,consectetur adipiscing elit.Sit quam dui,vivamus bibendum ut.A morbi mi totro ut feils non accumson quis.Nassa,",
                    style: TextStyle(color: ColorConstants.mainWhite),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _buildUserSelectionScreen() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  DummyDb.usersList.length,
                  (index) => UserNameCard(
                        onCardPressed: () {
                          selectedIndex = index;

                          setState(() {});
                        },
                        height: index == selectedIndex ? 70 : 60,
                        width: index == selectedIndex ? 73 : 65,
                        imagePath:
                            DummyDb.usersList[index]["imagePath"].toString(),
                        userName: DummyDb.usersList[index]["name"].toString(),
                      ))),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            height: 60,
            width: 63,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: ColorConstants.mainWhite)),
            child: Center(
              child: Icon(
                Icons.add,
                color: ColorConstants.mainWhite,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
