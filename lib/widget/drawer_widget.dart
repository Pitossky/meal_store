import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget drawListTile(
    String tileTitle,
    IconData tileIcon,
    VoidCallback tileFunction,
  ) {
    return ListTile(
      onTap: tileFunction,
      leading: Icon(
        tileIcon,
        size: 25,
      ),
      title: Text(
        tileTitle,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(
              20,
            ),
            margin: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).splashColor,
            child: Text(
              'MEALS',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          drawListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          drawListTile(
            'Settings',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed('/filters');
            },
          ),
        ],
      ),
    );
  }
}
