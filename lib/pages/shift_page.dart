import 'package:ams/colors.dart';
import 'package:flutter/material.dart';

final List<String> date = <String>[
  '10/12/2024',
  '15/11/2024'
];
final List<String> time = <String>[
  '7AM-12PM',
  '3PM-10PM'
];
final List<String> ward = <String>[
  '22',
  '45A'
];


final List<String> status =
    List.generate(date.length, (index) => 'pending');

class shiftPage extends StatefulWidget {
  const shiftPage({super.key});

  @override
  State<shiftPage> createState() => _shiftPageState();
}

class _shiftPageState extends State<shiftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shift'),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: date.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(child: Text('SH')),
            title: Text('Date: ${date[index]}'),
            subtitle: Text('Time: ${time[index]}'),
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
                Icons.restore,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                'Request Swap',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          value: 'rs',
          enabled: true,
          height: 30,
        ),
      ],
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ).then((value) {
      if (value == 'rs') {
        setState(() {
          status[index] = 'confirm';
          SnackBar(
            content: const Text('Request for Swap Sent!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
        });
        // showNotification();
      } 
      // else if (value == 'reschedule') {
      // } else if (value == 'cancel') {
      //   setState(() {
      //     date.removeAt(index);
      //     time.removeAt(index);
      //     status.removeAt(index);
      //   });
      // }
    });
  }
}



