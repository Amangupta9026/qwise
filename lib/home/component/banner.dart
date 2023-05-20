import 'package:carousel_animations/carousel_animations.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({super.key});

  final List<String> imageList = [
    "assets/images/skill_banner.png",
    "assets/images/upgrade_banner.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.asset(imageList[index]);
        },
        autoplay: true,
        itemCount: imageList.length,
        scrollDirection: Axis.horizontal,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Colors.grey,
            size: 8,
            activeSize: 8,
          ),
        ),
        viewportFraction: 1,
        control: null,
      ),
    );
  }
}
