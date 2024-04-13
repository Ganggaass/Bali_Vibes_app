import 'package:aceh_food/pages/crud.dart';
import 'package:aceh_food/pages/home.dart';
import 'package:aceh_food/pages/keranjang.dart';
import 'package:aceh_food/pages/login.dart';
import 'package:aceh_food/pages/news_screen.dart';
import 'package:aceh_food/pages/profile.dart';
import 'package:flutter/material.dart';

class DrawerScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment(0.0, 0.1),
          colors: [Colors.white.withOpacity(0.8), Colors.white], //
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage('assets/balinese.jpeg'),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Latihan API'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsScreen(),
                  ));
            },
          ),
           ListTile(
              title: const Text('Latihan CRUD'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTypes(),
                  ),
                );
              },
            ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
            },
          ),
          ListTile(
            title: const Text('Keranjang'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Keranjang(),
                  ));
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Logout',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.logout,
                  color: Colors.red,
                )
              ],
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
