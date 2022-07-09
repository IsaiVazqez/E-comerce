import 'package:flutter/cupertino.dart';
import 'package:shop_app/features/home/widgets/list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('My shop'),
        backgroundColor: Color.fromRGBO(183, 148, 246, 1),
      ),
      child: ListViewProducts(),
    );
  }
}
