import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_work2/logic/controller/AuthController.dart';
import 'package:test_work2/ui/signup.dart';
import 'package:test_work2/widget/button.dart';
import 'package:test_work2/widget/header.dart';
import 'package:test_work2/widget/textInput.dart';

class SignIn extends StatelessWidget {
  final TextEditingController loginContr = TextEditingController();
  final TextEditingController passContr = TextEditingController();
  final AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header('Вход', Icons.account_box),

            SizedBox(
              height: Get.height * 0.1,
            ),

            // Инпуты
            Container(
              width: Get.width * 0.85,
              height: Get.height * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textInput('Логин', false, loginContr),
                  textInput('Пароль', true, passContr),
                  GestureDetector(
                      onTap: () {
                        controller.signIn(loginContr.text, passContr.text);
                      },
                      child: button('Вход')),
                  GestureDetector(
                      onTap: () => Get.to(SignUp()), child: newUser()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
