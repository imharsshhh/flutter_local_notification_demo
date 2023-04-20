import 'package:flutter/material.dart';
import 'package:flutter_local_notification_demo/notification/core/notification_helper.dart';

Future<void> main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  final result = await NotificationHelper.requestPermission();

  if (result ?? false) {
    await NotificationHelper.init();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Function Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FunctionPage(),
    );
  }
}

class FunctionPage extends StatelessWidget {
  const FunctionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                NotificationHelper.showNotificationWithSound();
              },
              child: const Text('Show Notification With Sound'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () {
                NotificationHelper.showNotificationWithSound();
              },
              child: const Text('Show Notification Without Sound'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () async {
                await NotificationHelper.showNotificationWithSound();
              },
              child: const Text('Show Notification With Default Sound'),
            ),
          ],
        ),
      ),
    );
  }
}
