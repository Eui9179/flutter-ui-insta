import 'package:fast_app_base/common/get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'common/data/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  initGetIt();

  runApp(const App());
}
