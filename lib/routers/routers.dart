import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/routers/router_handler.dart';
import 'package:flutter_demo/utils/analytics.dart';
import 'package:flutter_demo/widgets/index.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String widgetDemo = '/widget-demo';
  static String codeView = '/code-view';
  static String webViewPage = '/web-view-page';

  static void configureRoutes(Router router) {
    List widgetDemosList = new WidgetDemoList().getDemos();
    router.notFoundHandler = new Handler(
        handlerFunc:
            (BuildContext context, Map<String, List<String>> params) {});
    router.define(home, handler: homeHandler);
    router.define('/category/:type', handler: categoryHandler);
    router.define('/category/error/404', handler: widgetNotFoundHandler);
    router.define(codeView, handler: fullScreenCodeDialog);
    router.define(webViewPage, handler: webViewPageHandler);
    widgetDemosList.forEach((demo) {
      Handler handler = new Handler(handlerFunc:
          (BuildContext context, Map<String, List<String>> params) {
        print('组件路由 params = $params widgetsItem=${demo.routerName}');
        analytics
            .logEvent(name: 'component', parameters: {'name': demo.routerName});
        return demo.buildRouter(context);
      });
      router.define('${demo.routerName}', handler: handler);
    });
  }
}
