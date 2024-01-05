import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWithIndicator extends StatefulWidget {
  const CarouselSliderWithIndicator({super.key});

  @override
  CarouselSliderWithIndicatorState createState() =>
      CarouselSliderWithIndicatorState();
}

class CarouselSliderWithIndicatorState
    extends State<CarouselSliderWithIndicator> {
  final List<String> imageList = [
    'https://img.freepik.com/free-vector/hepatoprotector-realistic-composition_1284-26181.jpg?w=2000',
    'https://thumbs.dreamstime.com/b/vitamins-supplements-as-capsule-fruit-vegetables-nuts-beans-inside-nutrient-pill-natural-medicine-health-treatment-d-110319057.jpg',
    'https://www.sapnamed.com/wp-content/uploads/2019/12/supplements-for-spine-health-sapnamed-1024x640.jpg',
    'https://aanmc.org/wp-content/uploads/2022/07/Are-Supplements-Safe-512x383.jpeg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 1.6,
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
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.map((url) {
                      int index = imageList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.grey.shade600
                              : Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
