import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/features/app/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await locator();
  WidgetsFlutterBinding.ensureInitialized();
  final _secureStorage = getIt<SecureStorage>();
  runApp(const MyApp());
}



