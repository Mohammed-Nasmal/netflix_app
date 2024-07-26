import 'package:flutter/material.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';

class NewArrivalCard extends StatelessWidget {
  const NewArrivalCard({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      color: ColorConstants.greey,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network(
                fit: BoxFit.cover, height: 55, width: 113, imageUrl),
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Arrival",
                style: TextStyle(color: ColorConstants.mainWhite, fontSize: 14),
              ),
              Text(
                "El Chapo",
                style: TextStyle(
                    color: ColorConstants.mainWhite.withOpacity(.83),
                    fontSize: 14),
              ),
              Text(
                "Nov 6",
                style: TextStyle(
                    color: ColorConstants.mainWhite.withOpacity(.47),
                    fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
