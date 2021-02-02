import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }

  _list() {
    return FutureBuilder<List<User>>(
      builder: (context, AsyncSnapshot<List<User>> asyncSnapshot) {
        return ListView(children: _listItems(asyncSnapshot.data, context));
      },
      future: menuProvider.fetchUsers(),
      initialData: [],
    );
  }

  _listItems(List<User> data, BuildContext context) {
    final List<Widget> options = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt.name),
        subtitle: Text(opt.email),
        leading: getIcon('add_alert'),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blueAccent,
        ),
        onTap: () {
          /*final route = MaterialPageRoute(
            builder: (context) => AlertPage(),
          );
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, '/alerts');
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }
}
