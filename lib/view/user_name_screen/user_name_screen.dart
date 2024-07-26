import 'package:flutter/material.dart';
import 'package:netflix_app/dummy_db.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';
import 'package:netflix_app/utils/constants/image_constants.dart';
import 'package:netflix_app/view/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:netflix_app/view/global_widgets/user_name_card.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlack,
        centerTitle: true,
        title: Image.asset(
          height: 37.2,
          ImageConstants.nlogo_PNG,
        ),
        actions: [
          Icon(
            Icons.edit,
            color: ColorConstants.mainWhite,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 75),
          shrinkWrap: true,
          itemCount: DummyDb.usersList.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisExtent: 130),
          itemBuilder: (context, index) {
            if (index < DummyDb.usersList.length) {
              return UserNameCard(
                imagePath: DummyDb.usersList[index]["imagePath"].toString(),
                userName: DummyDb.usersList[index]["name"].toString(),
                onCardPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavScreen(),
                      ));
                },
              );
            } else {
              return InkWell(
                onTap: () {
                  DummyDb.usersList.add(
                    {"imagePath": ImageConstants.USER1_PNG, "name": "astdfygh"},
                  );
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: ColorConstants.green,
                      content: Text("Profile adde successfully")));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      ImageConstants.add_PNG,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Add Profile",
                      style: TextStyle(
                        color: ColorConstants.mainWhite,
                        fontSize: 13.25,
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
