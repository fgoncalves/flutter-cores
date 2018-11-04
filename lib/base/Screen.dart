import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton fab;

  const Screen({
    Key key,
    @required this.title,
    @required this.body,
    this.fab,
  })  : assert(title != null),
        assert(body != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
