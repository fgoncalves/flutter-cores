import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyLevelList extends StatelessWidget {
  final Function() onRetryTapped;

  const EmptyLevelList({
    Key key,
    @required this.onRetryTapped,
  })  : assert(onRetryTapped != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'images/empty_list.svg',
            color: Colors.pink[500],
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'Seems like we failed to load the levels!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: FlatButton(
              child: const Text('RETRY'),
              onPressed: onRetryTapped,
            ),
          ),
        ],
      ),
    );
  }
}
