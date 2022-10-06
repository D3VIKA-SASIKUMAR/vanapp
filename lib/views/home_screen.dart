import 'package:flutter/material.dart';
import 'package:vanapp/views/goods_reciever_screen.dart';
import 'package:vanapp/views/view_scanned_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    const ViewScannedProductScreen(),
    const GoodsRecieverScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const ListTile(),
            ListTile(
              title: const Text('View product details'),
              onTap: () => setState(() => currentIndex = 0),
            ),
            ListTile(
              title: const Text('Goods reciever'),
              onTap: () => setState(
                () => currentIndex = 1,
              ),
            ),
          ],
        ),
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}
