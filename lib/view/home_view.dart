import 'package:flutter/material.dart';
import 'package:matador/theme/color.dart';
import 'package:matador/widgets/custom_carousel.dart';
import 'package:matador/widgets/home_categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: CustomColors.primaryColor,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Matador",
          style: TextStyle(
            color: CustomColors.scaffoldBackgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //search function
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            CarouselWidget(
              images: [
                'assets/images/carousel1.jpg',
                'assets/images/carousel2.jpg',
                'assets/images/carousel3.jpg',
                'assets/images/carousel4.jpg',
                'assets/images/carousel5.jpg',
              ],
            ),
            SizedBox(
              height: 200,
              child: CategoryGridView(
                icons: [
                  'assets/images/genre20.jpg',
                  'assets/images/genre28.jpg',
                  'assets/images/genre22.jpg',
                  'assets/images/genre30.jpg',
                  'assets/images/genre12.jpg',
                  'assets/images/genre13.jpg',
                  'assets/images/genre8.jpg',
                  'assets/images/genre21.jpg',
                  'assets/images/genre26.jpg',
                  'assets/images/genre17.jpg',
                ],
              ),
            ),
          ],
        ),
      ),
      // Add the rest of your HomePage widget here
    );
  }
}
