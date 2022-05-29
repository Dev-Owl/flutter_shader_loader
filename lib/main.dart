import 'package:flutter/material.dart';
import 'package:flutter_shader_loader/loading.dart';
import 'package:flutter_shader_loader/loading_widget.dart';

late final Loading loadingShader;
Future<void> main() async {
  loadingShader = await Loading.compile();
  runApp(
    MaterialApp(
      title: 'Fancy Loading',
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    ),
  );
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: const Text('Super app')),
        drawer: const Icon(Icons.menu),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox.square(
                dimension: 300,
                child: ShaderSpinner(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading your data',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ],
        ));
  }
}
