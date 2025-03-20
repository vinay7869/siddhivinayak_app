import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderItems extends StatefulWidget {
  const CarouselSliderItems({super.key});

  @override
  State<CarouselSliderItems> createState() => _CarouselSliderItemsState();
}

class _CarouselSliderItemsState extends State<CarouselSliderItems> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  List images = [
    {"id": 0, "imagePath": 'assets/sd1.png'},
    {"id": 1, "imagePath": 'assets/sd2.png'},
    {"id": 2, "imagePath": 'assets/sd3.png'},
  ];

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: isSelected ? 12 : 8,
        width: isSelected ? 12 : 8,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.red : Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      width: 100,
      child: Stack(
        children: [
          CarouselSlider(
              items: images
                  .map((item) => Image.asset(
                        item['imagePath'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                  .toList(),
              options: CarouselOptions(
                aspectRatio: 1,
                autoPlay: true,
                scrollPhysics: const BouncingScrollPhysics(),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )),
          Positioned(
              bottom: 27,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < images.length; i++)
                    buildIndicator(currentIndex == i)
                ],
              ))
        ],
      ),
    );
  }
}
