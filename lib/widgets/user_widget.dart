import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: Colors.green),
            borderRadius: BorderRadius.circular(100),
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: Colors.grey[400],
              size: 68,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tommy Berns',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: Color(0xff0141ac)),
            ),
            Row(
              children: [
                Text(
                  'Los Angeles',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey),
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.green,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
