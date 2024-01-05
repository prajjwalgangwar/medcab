import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medcab_assignment/elements/divider.dart';
import 'package:medcab_assignment/utils/constants.dart';

class CarouselSliderHealthCard extends StatefulWidget {
  const CarouselSliderHealthCard({super.key});

  @override
  CarouselSliderHealthCardState createState() =>
      CarouselSliderHealthCardState();
}

class CarouselSliderHealthCardState extends State<CarouselSliderHealthCard> {
  final List<String> imageList = [
    AppConstants.image2,
    AppConstants.image1,
    AppConstants.image2,
    AppConstants.image1,
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: MDivider(
            marginTop: 10,
            marginBottom: 4,
            color: Colors.grey.shade300,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 2.7,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: imageList.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(url),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          imageList.length,
                          (index) => Container(
                                width: 10.0,
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentIndex == index
                                      ? Colors.blueGrey
                                      : Colors.grey,
                                ),
                              )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
