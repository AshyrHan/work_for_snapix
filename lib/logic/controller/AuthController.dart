import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_work2/logic/model/users.dart';
import 'package:test_work2/ui/home.dart';

class AuthController extends GetxController {
  var users = List<Users>().obs;

  //
  void signIn(String login, String pass) {
    if (login.isEmpty || pass.isEmpty) {
      snackbar('Поля должны быть заполнены');
    } else {
      if (checkLogin(login)) {
        if (checkpassword(pass)) {
          print('ENTER SUCCESSFULL');
          Get.to(Home());
        } else {
          snackbar('Не правильный пароль');
        }
      } else {
        snackbar('Не правильный логин');
      }
    }
  }

  bool checkLogin(login) {
    int _result = users.indexWhere((element) => element.login == login);
    if (!_result.isNegative) {
      return true;
    } else {
      return false;
    }
  }

  bool checkpassword(pass) {
    int _result = users.indexWhere((element) => element.password == pass);
    if (!_result.isNegative) {
      return true;
    } else {
      return false;
    }
  }

  void signUp(String login, String pass) {
    if (login.isEmpty || pass.isEmpty) {
      snackbar('Поля должны быть заполнены');
    } else {
      users.add(Users(login: login, password: pass));

      Get.to(Home());
    }
  }

  void snackbar(message) {
    return Get.snackbar('Ошибка', message, backgroundColor: Colors.white);
  }

  @override
  void onInit() {
    List _users = GetStorage().read<List>('users');

    if (_users != null) {
      users = _users.map((e) => Users.fromJson(e)).toList().obs;
    }

    ever(users, (_) {
      GetStorage()
          .write('users', users.toJson())
          .then((value) => print('writed'))
          .catchError((e) => print(e));
    });

    super.onInit();
  }
}
