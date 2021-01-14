import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work2/logic/controller/NoteController.dart';

Widget textInput(String hint, bool obscure, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

Widget newUser() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Новый пользователь?',
        style: TextStyle(fontSize: 16, color: Colors.blueAccent),
      )
    ],
  );
}

Widget hometextInput() {
  final TextEditingController textContr = TextEditingController();
  final NoteController controller = Get.put(NoteController());
  return Container(
    width: Get.width * 0.7,
    height: 35,
    child: TextFormField(
      controller: textContr,
      obscureText: false,
      style: TextStyle(fontSize: 12, height: 0.8),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(Icons.add_circle_outline, size: 18, color: Colors.black54),
          onPressed: () {
            controller.addNote(textContr.text);
            textContr.clear();
          },
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Введите текст',
        hintStyle: TextStyle(
          fontSize: 12,
          height: 0.0,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
