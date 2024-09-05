import 'package:ams/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final List<String> headline = <String>[
  '10/12/2024',
  '15/11/2024',
  '29/9/2024',
  '10/12/2024',
  '15/11/2024',
  '29/9/2024'
];
final List<String> entries = <String>[
  'Vadodara',
  'Ahmedabad',
  'Vadodara',
  'Vadodara',
  'Ahmedabad',
  'Anand'
];
final List<String> status = List.generate(headline.length, (index) => 'pending');

enum SampleItem { itemOne, itemTwo, itemThree }

class appointmentPage extends StatefulWidget {
  const appointmentPage({super.key});

  @override
  State<appointmentPage> createState() => _appointmentPageState();
}

class _appointmentPageState extends State<appointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Appointment at ${headline[index]}'),
            subtitle: Text('Location: ${entries[index]}'),
            trailing: const Icon(Icons.menu),
            tileColor: status[index] == 'confirm' ? Colors.green[100] : null,
            onTap: () {
              showDropdownMenu(context, index);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  void showDropdownMenu(BuildContext context, int index) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        const PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.confirmation_num,
                color: AppColors.textColorBlack,
              ),
              SizedBox(width: 10),
              Text(
                'Confirm',
                style: TextStyle(color: AppColors.textColorBlack),
              ),
            ],
          ),
          value: 'confirm',
          enabled: true,
          height: 30,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.restore,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                'Reschedule',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          value: 'reschedule',
          enabled: true,
          height: 30,
        ),
        PopupMenuItem(
          child: Row(
            children: [
              Icon(
                Icons.cancel,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          value: 'cancel',
          enabled: true,
          height: 30,
        ),
      ],
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ).then((value) {
      if (value == 'confirm') {
        setState(() {
          status[index] = 'confirm';
        });
        showNotification();
      } else if (value == 'reschedule') {
      } else if (value == 'cancel') {
        setState(() {
          headline.removeAt(index);
          entries.removeAt(index);
          status.removeAt(index);
        });
      }
    });
  }
}

void showNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await FlutterLocalNotificationsPlugin().initialize(initializationSettings);

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.max,
    priority: Priority.high,
    channelShowBadge: false,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await FlutterLocalNotificationsPlugin().show(
    0,
    'Appointment Confirmed',
    'Your appointment has been confirmed.',
    platformChannelSpecifics,
  );
}