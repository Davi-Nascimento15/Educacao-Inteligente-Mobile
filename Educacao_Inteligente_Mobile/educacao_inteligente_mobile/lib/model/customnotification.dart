import 'package:educacao_inteligente_mobile/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  CustomNotification({
    this.id,
    this.title,
    this.body,
    this.payload,
  });
}

class NotificationService {
  FlutterLocalNotificationsPlugin localNotificationsPlugin;
  AndroidNotificationDetails androidDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    setupAndroidDetails();
    setupNotifications();
  }

  setupAndroidDetails() {
    androidDetails = const AndroidNotificationDetails(
      'chat_notifications_details',
      'chating',
      channelDescription: 'Este é o canal para mensagens',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
  }

  setupNotifications() async {
    await initializeNotifications();
  }

  initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onSelectNotification: _onSelectNotification,
    );
  }

  _onSelectNotification(String payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.push(
        null,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    }
  }

  showLocalNotification(CustomNotification notification) {
    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(
        android: androidDetails,
      ),
      payload: notification.payload,
    );
  }

  checkForNotifications() async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _onSelectNotification(details.payload);
    }
  }
}
