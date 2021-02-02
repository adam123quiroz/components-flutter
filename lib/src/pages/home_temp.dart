import 'package:flutter/material.dart';

class HomeTempPage extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components Temp"),
      ),
      body: ListView(
        children: _createItemShortWay(),
      ),
    );
  }

  _createItemShortWay() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text("Anything"),
            leading: Icon(Icons.exposure),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
