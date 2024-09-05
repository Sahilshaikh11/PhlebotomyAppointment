import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class historyPage extends StatefulWidget {
  const historyPage({super.key});

  @override
  State<historyPage> createState() => _appointmentPageState();
}

class _appointmentPageState extends State<historyPage> {
  final List<String> date = <String>['18/7/2024', '26/08/2024'];
  final List<String> location = <String>['Vadodara', 'Vadodara'];
  // final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: date.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(child: Text('H')),
            title: Text('${date[index]}'),
            subtitle: Text('Location: ${location[index]}'),
            onTap: () {
              // alertDialog(context);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

}
