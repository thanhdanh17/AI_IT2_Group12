import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: 30, color: Colors.grey[700]),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome,', style: TextStyle(fontSize: 16, color: Colors.grey)),
            Text('Gia Thịnh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        Spacer(),
        Icon(Icons.notifications_none, size: 28),
      ],
    );
  }
}
