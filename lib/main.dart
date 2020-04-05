import 'package:flutter/material.dart';
import 'package:paas/providers/client_bar.dart';
import 'package:paas/providers/dashboard_bar.dart';
import 'package:provider/provider.dart';
import 'pages/navigator.dart';
import 'pages/dashboard.dart';
import 'pages/client.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashboardBar(),),
        ChangeNotifierProvider(create: (context) => ClientBar(),),
      ],
      
      child: MaterialApp(
        title: "Flutter Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: NavigatorPage(),
        routes: {
          "dashboard": (context) => DashboardPage(),
          "client": (context) => ClientPage(),
        },
      ),
    );
  }
}
