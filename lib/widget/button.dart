import 'package:flutter/material.dart';

Widget button(String text) {
  return Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.blueAccent,
    ),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
    ),
  );
}
