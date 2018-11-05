import 'package:flutter/material.dart';

import '../../data/models/Level.dart';

class LevelCard extends StatelessWidget {
  final Level level;

  const LevelCard({
    Key key,
    @required this.level,
  })  : assert(level != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('tapping'),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: Image.network(level.image).image),
                )),
            SizedBox(
              height: 8.0,
            ),
            Text(
              level.title,
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
