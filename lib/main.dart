import 'package:flutter/material.dart';
import 'package:flutter_shader_loader/loading.dart';
import 'package:flutter_shader_loader/loading_widget.dart';

late final Loading loadingShader;
Future<void> main() async {
  loadingShader = await Loading.compile();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fancy Loading',
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShaderSpinner();
  }
}
