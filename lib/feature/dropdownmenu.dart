import 'package:ams/colors.dart';
import 'package:flutter/material.dart';

void showDropdownMenu(BuildContext context) {
  showMenu(
    // color: AppColors.accentColor,
    context: context,
    position: const RelativeRect.fromLTRB(
        100, 100, 100, 100), // adjust the position as needed
    items: [
      const PopupMenuItem(
        child: Row(
          children: [
            Icon(
              Icons.confirmation_num,
              color: AppColors.textColorBlack,
            ), // Leading icon
            SizedBox(width: 10), // Add some space between icon and text
            Text(
              'Confirm',
              style: TextStyle(
                  color: AppColors.textColorBlack), // White text color
            ),
          ],
        ),
        value: 'confirm',
        enabled: true,
        height: 30, // Adjust the height as needed
      ),
      PopupMenuItem(
        child: Row(
          children: [
            Icon(
              Icons.restore,
              color: Colors.black,
            ), // Leading icon
            SizedBox(width: 10), // Add some space between icon and text
            Text(
              'Reschedule',
              style: TextStyle(color: Colors.black), // White text color
            ),
          ],
        ),
        value: 'reschedule',
        enabled: true,
        height: 30, // Adjust the height as needed
      ),
      PopupMenuItem(
        child: Row(
          children: [
            Icon(
              Icons.cancel,
              color: Colors.black,
            ), // Leading icon
            SizedBox(width: 10), // Add some space between icon and text
            Text(
              'Cancel',
              style: TextStyle(color: Colors.black), // White text color
            ),
          ],
        ),
        value: 'cancel',
        enabled: true,
        height: 30, // Adjust the height as needed
      ),
    ],
    elevation: 8.0, // Set elevation here
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Add rounded corners
    ),
  ).then((value) {
    if (value == 'confirm') {
      
    } else if (value == 'reschedule') {
      
    }
    else if (value == 'cancel') {
      
    }
  });
}
