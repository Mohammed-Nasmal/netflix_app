import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/dummy_db.dart';
import 'package:netflix_app/utils/constants/color_constants.dart';
import 'package:netflix_app/utils/constants/image_constants.dart';
import 'package:netflix_app/view/home_screen/widgets/movies_card_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMoviePosterSection(),
            SizedBox(height: 11),
            _buildPlaySection(),
            SizedBox(height: 40),
            MoviesCardBuilderWidget(
              haveInfocard: false,
              title: "Previews",
              customWidth: 102,
              isCircle: true,
              posterImages: DummyDb.moviePostersListd1,
            ),
            MoviesCardBuilderWidget(
              haveInfocard: true,
              posterImages: DummyDb.moviePostersListd2,
              title: "Continue Watching for Emenalo",
            ),
            MoviesCardBuilderWidget(
              haveInfocard: false,
              posterImages: DummyDb.moviePostersListd3,
              title: "Popular on Netflix",
            ),
            MoviesCardBuilderWidget(
              haveInfocard: false,
              posterImages: DummyDb.moviePostersListd4,
              title: "Trending Now",
              customHeight: 251,
              customWidth: 154,
            ),
            MoviesCardBuilderWidget(
              haveInfocard: false,
              posterImages: DummyDb.moviePostersListd5,
              title: "Top 10 in Nigeria Today",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              Icons.add,
              color: ColorConstants.mainWhite,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "My List",
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontSize: 14,
              ),
            )
          ],
        ),
        SizedBox(
          width: 42,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(6)),
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                size: 40,
                color: ColorConstants.mainBlack,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Play",
                style: TextStyle(
                  color: ColorConstants.mainBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 42,
        ),
        Column(
          children: [
            Icon(
              Icons.info_outline,
              color: ColorConstants.mainWhite,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Info",
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontSize: 14,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildMoviePosterSection() {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              print("Page changed to $index");
            },
            scrollDirection: Axis.horizontal,
          ),
          items: DummyDb.moviePostersListd1.map((posterUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(posterUrl),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 415,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [ColorConstants.mainBlack, Colors.transparent],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImageConstants.nlogo_PNG),
                    Text(
                      "TV shows",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorConstants.mainWhite,
                      ),
                    ),
                    Text(
                      "Movies",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorConstants.mainWhite,
                      ),
                    ),
                    Text(
                      "My List",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorConstants.mainWhite,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageConstants.Top_10_PNG),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "#2 in Nigeria Today",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorConstants.mainWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
