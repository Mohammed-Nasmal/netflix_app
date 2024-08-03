import 'package:flutter/material.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlack,
        title: Text(
          "Smart downloads",
          style: TextStyle(fontSize: 15, color: ColorConstants.mainWhite),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Indroducing downloads for you",
            style: TextStyle(
                color: ColorConstants.mainWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamusbibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa,id ut ipsum aliquam  enim non posuere pulvinar diam.",
            textAlign: TextAlign.justify,
            style: TextStyle(color: ColorConstants.mainWhite, fontSize: 11),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(100)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 41,
            width: 400,
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "Set up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              height: 33,
              width: 280,
              color: Colors.grey.shade800,
              child: Center(
                  child: Text(
                "Find Somethings to download",
                style: TextStyle(
                    color: ColorConstants.mainWhite,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
