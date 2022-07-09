import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/features/home/widgets/list_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('My shop'),
        backgroundColor: Color.fromRGBO(183, 148, 246, 1),
      ),
      child: ListViewProducts(),
    );
  }
}
