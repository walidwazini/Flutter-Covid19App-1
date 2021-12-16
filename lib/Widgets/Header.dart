import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Constant.dart';

class Header extends StatelessWidget {
  final String? image;
  final String textTop;
  final String textBottom;
  final double? offset;

  const Header({
    Key? key,
    this.image,
    required this.textTop,
    required this.textBottom,
    this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
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
            // image: AssetImage(image)
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
                    image!,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: 20,
                    left: 150,
                    child: Text(
                      'Stay at home',
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                  Container()
                ],
              ),
            )
          ],
        ),
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
