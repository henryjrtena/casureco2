import 'package:banner_carousel/banner_carousel.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:casureco/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(onSignOut: () {}),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          )
        ],
        title: Text(appName),
      ),
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BannerCarousel(
                height: 200.0,
                banners: [
                  BannerModel(imagePath: 'assets/banner_images/1.jpg', id: "1"),
                  BannerModel(imagePath: 'assets/banner_images/2.jpg', id: "2"),
                  BannerModel(imagePath: 'assets/banner_images/3.jpg', id: "3"),
                  BannerModel(imagePath: 'assets/banner_images/4.jpg', id: "4"),
                ],
                onTap: (id) => print(id),
              )
            ],
          ),
        ),
      ),
    );
  }
}
