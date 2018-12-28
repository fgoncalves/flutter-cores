import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton fab;

  const Screen({
    Key key,
    this.title,
    @required this.body,
    this.fab,
  })  : assert(body != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = title == null
        ? null
        : AppBar(
            title: Text(title),
          );
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: fab,
    );
  }
}
