import 'package:flutter/material.dart';


class HomeTopBar extends StatefulWidget {
  String userName = 'DEFAULT_NAME';
  HomeTopBar({Key? key}) : super(key: key);
  HomeTopBar.bar (String s, {Key? key}) : super(key: key) {
    userName = s;
  }

  @override
  _HomeTopBarState createState() => _HomeTopBarState();
}

class _HomeTopBarState extends State<HomeTopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 0.0),
      child: Column (
        children : [
          Text(
            'Welcome back, ${widget.userName}',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 0.0),
            child: Row (
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.attach_money,
                        size: 40.0,
                      ),
                      Text(
                        'ETH:',
                        style: TextStyle(
                          fontSize: 25.0
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1,),
                const Expanded(
                  flex: 5,
                  child: Text(
                    '\$5000',
                    style: TextStyle(
                        fontSize: 25.0
                    ),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
