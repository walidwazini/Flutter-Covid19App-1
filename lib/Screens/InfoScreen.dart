import 'package:covid19_app_1/Constant.dart';
import 'package:flutter/material.dart';

import '../Widgets/Header.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            image: 'Assets/Icons/coronadr.svg',
            textTop: 'Get to know',
            textBottom: 'About Covid-19',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Symptoms', style: kTitleTextStyle),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SymptomCard(
                      image: 'Assets/Images/headache.png',
                      title: 'Headache',
                      isActive: false,
                    ),
                    SymptomCard(
                      image: 'Assets/Images/caugh.png',
                      title: 'Cough',
                      isActive: true,
                    ),
                    SymptomCard(
                      image: 'Assets/Images/fever.png',
                      title: 'Fever',
                      isActive: false,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String? image;
  final String? title;
  final bool isActive;

  const SymptomCard({
    Key? key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          boxShadow: [
            isActive
                ? BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20,
                    color: kActiveShadowColor,
                  )
                : BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: kShadowColor,
                  ),
          ]),
      child: Column(
        children: [
          Image.asset(
            image!,
            height: 90,
          ),
          Text(
            title!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
