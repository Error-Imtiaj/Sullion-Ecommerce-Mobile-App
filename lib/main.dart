import 'dart:async';

import 'package:ecommerce_project/features/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(const SullionApp());
}

