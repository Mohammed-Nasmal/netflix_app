import 'package:flutter/material.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 5),
            _buildReferrelSection(),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.check, color: ColorConstants.mainWhite, size: 30),
                SizedBox(width: 6),
                Text(
                  "My List",
                  style: TextStyle(
                      color: ColorConstants.mainWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade800),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "App Settings",
                      style: TextStyle(
                          color: ColorConstants.mainWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Account",
                      style: TextStyle(
                          color: ColorConstants.mainWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Help",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: ColorConstants.mainWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Sign Out",
                      style: TextStyle(
                          color: ColorConstants.mainWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Container _buildReferrelSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.grey.shade800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.sms, color: ColorConstants.mainWhite),
              SizedBox(width: 6),
              Text(
                "Tell friends about Netflix.",
                style: TextStyle(
                    color: ColorConstants.mainWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              "Lorem ipsum dolor sit anet, consectur elit. sit quem dui, vivamus bibundum ut.A morbi mi tortur ut felis non accumsan accumsan quis.Massa,",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 11),
          Text(
            "Terms & Conditions",
            textAlign: TextAlign.justify,
            style: TextStyle(
                decorationThickness: 2,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                color: ColorConstants.mainWhite,
                fontSize: 10,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.black,
                    filled: true,
                    border: InputBorder.none),
              )),
              SizedBox(width: 7),
              Container(
                alignment: Alignment.center,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: ColorConstants.mainWhite,
                child: Text(
                  "Copy Link",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          SizedBox(height: 21),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(ImageConstants.USER1_PNG),
              SizedBox(
                height: 41,
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Image.asset(ImageConstants.USER2_PNG),
              SizedBox(
                height: 41,
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.mail,
                color: Colors.white,
                size: 35,
              ),
              SizedBox(
                height: 41,
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 35,
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                        fontSize: 17,
                        color: ColorConstants.mainWhite,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )
        ],
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
