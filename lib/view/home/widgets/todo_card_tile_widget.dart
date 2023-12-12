import 'package:flutter/material.dart';
import 'package:todo_bloc/constants/constants.dart';

class TodoCardTileWidget extends StatelessWidget {
  var todo;

   TodoCardTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0xFF2C3E50),
          Color(0xFFBDC3C7),
        ]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "todo tile",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ]),
            Kheight10,
            Text(
              "description",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}