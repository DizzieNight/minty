import 'package:flutter/material.dart';
import 'news_card.dart';
import 'home_topbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = 'Zander';
  int cardNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget> [
            SliverAppBar(
              pinned: true,
              stretch: true,
              expandedHeight: 250.0,
              backgroundColor: Colors.greenAccent,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: const Icon(Icons.account_circle),
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                centerTitle: true,
                background: HomeTopBar.bar(userName)
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return NewsCard.card(index,);
                },
                childCount: 10
              )
            ),
          ],
        )
      )
    );
  }
}


