import 'package:flutter/material.dart';
import 'package:minty/settings_page.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';
import 'more_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
      home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static String mainURL = 'pro-api.coinmarketcap.com';
  final String apiKEY = 'f2d01237-1cfe-40f7-86fe-38fe53acf467';
  var currencyListingAPI = '${mainURL}cryptocurrency/listings/latest';
  Dio _dio = Dio();
  Future getCoins() async {
    try{

    } catch (error, stackTrace){
      print("exception $error, dd $stackTrace");
      return;
    }
  }

  @override
  void initState() {
    print(getCoins());
  }


  int _currentIndex = 1;

  final PageController _pageController = PageController(initialPage: 1);
  final List<Widget> _screens = [const MorePage(),const HomePage(), const SettingsPage()];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {

    List cryptoData = [];

    print(getCoins());
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 50,
              iconSize: 20,
              currentIndex: _currentIndex,
              backgroundColor: Colors.greenAccent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white38,
              selectedFontSize: 16,
              unselectedFontSize: 13,
              onTap: (value) {
                _onItemTapped(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined),
                  label: 'More',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          )
        ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      );
  }
}

