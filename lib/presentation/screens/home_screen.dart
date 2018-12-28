import 'package:cores/base/screen.dart';
import 'package:cores/presentation/containers/level_list_container.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final Function() onInit;

  const Home({
    Key key,
    @required this.onInit,
  })  : assert(onInit != null),
        super(key: key);

  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      title: 'Home',
      body: LevelListContainer(),
    );
  }
}
