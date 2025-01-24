
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
// Future<void> scheduleDailyNotification() async {
//   const AndroidNotificationDetails androidNotificationDetails =
//       AndroidNotificationDetails(
//     'daily_notifications_channel', // Channel ID
//     'Daily Notifications', // Channel name
//     channelDescription: 'Channel for daily notifications',
//     importance: Importance.max,
//     priority: Priority.high,
//   );

//   const NotificationDetails notificationDetails =
//       NotificationDetails(android: androidNotificationDetails);

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     0, // Notification ID
//     'Daily Reminder', // Notification title
//     'This is your daily notification!', // Notification body
//     _nextInstanceOfTime(9, 0), // Notification time (9:00 AM)
//     notificationDetails,
//     androidAllowWhileIdle: true,
//     matchDateTimeComponents: DateTimeComponents.time,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.wallClockTime,
//   );
//   tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduledTime =
//       tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

//   // If the time has already passed for today, schedule it for tomorrow
//   if (scheduledTime.isBefore(now)) {
//     scheduledTime = scheduledTime.add(const Duration(days: 1));
//   }
//   return scheduledTime;
// }

// }

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {}
  static Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotification,
        onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification);
            await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    // Future<void> showInstantNottification(String tiitle, String body) async {
    //   const NotificationDetails plateformChannelSpecifices =
    //       NotificationDetails(
    //           android: AndroidNotificationDetails('channelId', 'channelName',
    //               importance: Importance.high, priority: Priority.high));
    //   await flutterLocalNotificationsPlugin.show(
    //       0, 'title', body, plateformChannelSpecifices);
    // }

    Future<void> scheduleDailyNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'daily_notifications_channel', // Channel ID
    'Daily Notifications', // Channel name
    channelDescription: 'Channel for daily notifications',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
tz.TZDateTime nextInstanceOfTime(int hour, int minute) {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledTime =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

  // If the time has already passed for today, schedule it for tomorrow
  if (scheduledTime.isBefore(now)) {
    scheduledTime = scheduledTime.add(const Duration(days: 1));
  }
  return scheduledTime;
}
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0, // Notification ID
    'Daily Reminder', // Notification title
    'This is your daily notification!', // Notification body
    nextInstanceOfTime(21, 00), // Notification time (9:00 AM)
    notificationDetails,
    matchDateTimeComponents: DateTimeComponents.time,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime, androidScheduleMode: AndroidScheduleMode.alarmClock,
  );
}
flutterLocalNotificationsPlugin
    .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
    ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    }
  }

  