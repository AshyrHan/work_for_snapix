import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget header(String text, IconData icon) {
  return Container(
    width: Get.width,
    height: Get.height * 0.35,
    decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: Get.height * 0.05,
        ),
        Icon(
          icon,
          size: 55,
          color: Colors.white,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    ),
  );
}
