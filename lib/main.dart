import 'package:flutter/material.dart';
import 'package:o4_navigation_and_animation/pages/home_orange.dart';
import 'package:o4_navigation_and_animation/pages/home_teal.dart';
import 'package:o4_navigation_and_animation/pages/welcome.dart';

void main() => runApp(NavigationRoutesAndAnimation());

class NavigationRoutesAndAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Z2P Widgets You Can See',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// NOTE:
      /// If you get an "red screen of death" that says "home == null"
      /// then be sure to read the rest of the error message. It
      /// clearly says that you can't specify both a route that's named
      /// "/" (designating the root of the app) and a "home" property
      /// in your Material app, because they're redundant.
      ///
      /// If you use named routes, don't use the "home" property.

      /// You can set the initial route to whatever you want, but
      /// whatever you set here will be the root page of your app.
      initialRoute: '/',
      routes: {
        /// When navigating to the "/" route, it takes the user to whatever page
        /// you assign as the root page of your app:
        '/': (context) => const Welcome(),
        /// When navigating to any other page (route), you can associate the page
        /// with the name of the route in the route table, here.
        '/routes_one': (context) => const HomeTeal(),
        '/routes_two': (context) => const HomeOrange(),
      },
    );
  }
}
