import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/routers/application.dart';
import 'package:flutter_demo/utils/shared_preferences.dart';
import 'routers/routers.dart';
import 'package:flutter_demo/utils/provider.dart';
import 'package:flutter_demo/utils/analytics.dart' as Analytics;

const int ThemeColor = 0xFFC91B3A;
SpUtil sp;
var db;

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  showWelcomePage() {
    return new AppPage();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme:
            TextTheme(body1: TextStyle(color: Color(0xFF888888), fontSize: 16)),
        iconTheme: IconThemeData(color: Color(ThemeColor), size: 35),
      ),
      home: new Scaffold(
        body: showWelcomePage(),
      ),
      onGenerateRoute: Application.router.generator,
      navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }
}

void main() async {
  final provider = new Provider();
  await provider.init(true);

  sp = await SpUtil.getInstance();
  new SearchHistoryList(sp);

  db = Provider.db;
  runApp(new MyApp());
}
