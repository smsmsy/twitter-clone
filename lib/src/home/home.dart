import 'package:flutter/material.dart';
import 'package:twitter_clone/src/home/body/dummy_home_body.dart';
import 'package:twitter_clone/src/home/slider_drawer/slider_drawer_app_bar.dart';
import 'package:twitter_clone/src/home/slider_drawer/slider_drawer_menu.dart';
import 'package:twitter_clone/src/home/slider_drawer/slider_drawer_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SliderDrawerView(
        appBarOption: SliderDrawerAppBarOption(
          title: Expanded(
            child: Text(
              'ホーム',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        drawer: SliderDrawerMenu.fixed(
          width: 200,
          body: Center(
            child: Text(
              'Drawer Menu',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        body: DummyHomeBody(),
      ),
    );
  }
}
