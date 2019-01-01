import 'package:cores/domain/models/color_item.dart';
import 'package:cores/presentation/utils/colorutils.dart';
import 'package:flutter/material.dart';

class ColorList extends StatelessWidget {
  final List<ColorItem> colors;

  const ColorList({
    Key key,
    this.colors = const [],
  });

  int itemCount() => colors.length;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount(),
      itemBuilder: _createCard,
    );
  }

  Widget _createCard(BuildContext context, int position) {
    if (position >= itemCount()) return null;

    var item = colors[position];
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(getColorHexFromStr(COLOR_MAP[item.id])),
                radius: 20.0,
              ),
              title: Text(item.name),
            ),
          ],
        ),
      ),
    );
  }
}
