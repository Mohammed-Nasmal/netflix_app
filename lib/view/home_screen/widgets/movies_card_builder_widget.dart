import 'package:flutter/material.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';

class MoviesCardBuilderWidget extends StatelessWidget {
  const MoviesCardBuilderWidget({
    super.key,
    this.isCircle = false,
    this.customHeight = 161,
    this.customWidth = 103,
    required this.title,
    required this.posterImages,
  });
  final bool isCircle; //  true for making items circular
  final double customHeight;
  final double customWidth;
  final String title;
  final List<String> posterImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            title,
            style: TextStyle(
                color: ColorConstants.mainWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 22),
        SizedBox(
          height: isCircle ? customWidth : customHeight,
          child: ListView.separated(
            itemCount: posterImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                decoration: BoxDecoration(
                  shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                  color: Colors.amber,
                  image: DecorationImage(
                      image: NetworkImage(posterImages[index]),
                      fit: BoxFit.cover),
                ),
                height: customHeight,
                width: customWidth,
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 7,
            ),
          ),
        ),
        SizedBox(height: 22),
      ],
    );
  }
}
