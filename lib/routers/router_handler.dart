import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//app首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return new AppPage();
  }
);

var categoryHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return new CategoryHome(params["type"]?.first);
  }
);

var widgetNotFoundHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return new WidgetNotFound();
  }
);

var fullScreenCodeDialog = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new FullScreenCodeDialog(filePath:params['filePath']?.first);
  }
);

var webViewPageHandler = new Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return new WebViewPage(params['url']?.first,params['title']?.first)
  }
);