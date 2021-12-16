import 'package:flutter/material.dart'; // ignore: filenames
import 'package:flutter_svg/svg.dart';

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
      body: Column(
        children: [
          Text('Hello'),
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 50, 20, 0),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: const [Colors.blue, Colors.white]),
                image: DecorationImage(
                  image: AssetImage('Assets/Images/virus.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset('Assets/Icons/menu.svg'),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'Assets/Icons/Drcorona.svg',
                          width: 230,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                        Positioned(
                          top: 20,
                          left: 150,
                          child: Text(
                            'Stay at home',
                            style: null,
                          ),
                        ),
                        Container()
                      ],
                    ),
                  )
                ],
              ),
            ),
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
                    value: selected ? 'Choose' : dropDownValue,
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
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: const [
                          TextSpan(
                            text: 'Case',
                            style: null,
                          ),
                          TextSpan(
                            text: 'Update as of March 28',
                            style: null,
                          )
                        ]
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
