import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class NotificationHelper {
  static final _instance = _getInstance();
  static Object get instance => _instance;
  static FlutterLocalNotificationsPlugin _getInstance() {
    return FlutterLocalNotificationsPlugin();
  }

  static Future<bool?> requestPermission() async {
    return await _instance
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await _instance.initialize(
      initializationSettings,
    );
  }

  // Method 1
  static Future showNotificationWithSound() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "channelId",
      "channelName",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      icon: "ic_launcher",
      sound: RawResourceAndroidNotificationSound("ic_sound"),
      enableVibration: true,
      styleInformation: BigTextStyleInformation(""),
    );

    //? ios
    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
      sound: 'ic_sound.aiff',
    );

    //? create notification
    final NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
      macOS: darwinNotificationDetails,
    );

    //? schedule notification
    await _instance.show(
      0,
      "Notification! 🚀",
      "Hello World!👋",
      notificationDetails,
      payload: 'It could be anything you pass',
    );
  }
}
