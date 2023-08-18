import 'package:flutter/material.dart';
import 'package:link_development_task/my_app.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule(); // this function for call dependency injection
  runApp(MyApp());
}
