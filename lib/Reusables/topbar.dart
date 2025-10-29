import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.black,
                content: Text('Come back later'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Image(image: AssetImage('images/menu.png')),
        ),
        Image(image: AssetImage('images/third.png')),
        CircleAvatar(backgroundImage: AssetImage('images/avatar.jpg')),
      ],
    );
  }
}
