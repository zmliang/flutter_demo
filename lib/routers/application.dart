import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_demo/utils/shared_preferences.dart';

class Application {
  static Router router;
  static TabController controller;
  static SpUtil sharePeferences;

  static Map<String, String> github = {
    'widgetsURL':
        'https://github.com/alibaba/flutter-go/blob/develop/lib/widgets/',
  };
}
