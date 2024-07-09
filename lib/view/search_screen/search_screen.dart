import 'package:flutter/material.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';
import 'package:netflix_app/dummy_db.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 23,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.mic,
                    size: 24,
                    color: Colors.grey,
                  ),
                  hintText: "Search for a show, movie, genre, e.t.c.",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade800,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Top searches",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ColorConstants.mainWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 26.75,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: DummyDb.searchScreenList.length,
                itemBuilder: (context, index) => Container(
                  color: Colors.grey.shade800,
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    children: [
                      Container(
                        width: 146,
                        height: 76,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                DummyDb.searchScreenList[index]["url"]!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          DummyDb.searchScreenList[index]["Name"]!,
                          style: TextStyle(
                              color: ColorConstants.mainWhite, fontSize: 14.72),
                        ),
                      ),
                      Icon(Icons.play_circle_outline_rounded,
                          size: 28, color: Colors.white),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
