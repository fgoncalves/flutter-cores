import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String image;
  final double radius;

  const CircularImage({
    Key key,
    @required this.image,
    this.radius: 100.0,
  })  : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill, image: Image.network(image).image),
        ));
  }
}
