import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  final List<String> newItem = [
    'assets/images/illustrations/slider_1.jpg',
    'assets/images/illustrations/slider_2.jpg',
    'assets/images/illustrations/slider_3.jpg',
  ];

  CardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.90,
      ),
      items: newItem.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(item, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // const Positioned(
                  //   bottom: 10,
                  //   left: 10,
                  //   child: Text(
                  //     "Special Offer",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
