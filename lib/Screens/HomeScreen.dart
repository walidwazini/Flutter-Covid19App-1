import 'package:flutter/material.dart'; // ignore: filenames
import 'package:flutter_svg/svg.dart';

import '../Constant.dart';
import '../Widgets/Counter.dart';
import '../Widgets/Header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic dropDownValue;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Header(
              image: 'Assets/Icons/Drcorona.svg',
              textTop: "All you need",
              textBottom: "is stay at home.",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  SvgPicture.asset('Assets/Icons/maps-and-flags.svg'),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropDownValue,
                      underline: SizedBox(),
                      items: ['INA', 'Bangladesh']
                          .map<DropdownMenuItem<String>>((String choice) {
                        return DropdownMenuItem(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Case Update',
                            style: kTitleTextStyle,
                          ),
                          TextSpan(
                            text: 'Update as of March 28',
                            style: TextStyle(
                              color: kTextLightColor,
                            ),
                          )
                        ]),
                      ),
                      Spacer(),
                      Text(
                        'See Details',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 30,
                            color: kShadowColor,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Counter(
                          colorType: kInfectedColor,
                          number: 1046,
                          title: "Infected",
                        ),
                        Counter(
                          colorType: kRecoverColor,
                          number: 46,
                          title: "Recovered",
                        ),
                        Counter(
                          colorType: kDeathColor,
                          number: 87,
                          title: "Deaths",
                        ),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Spread of Vires',
                        style: kTitleTextStyle,),
                      Text(
                        'See details',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'Assets/Images/map.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


