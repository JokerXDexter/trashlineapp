import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/app_pages.dart';
import 'login_controller.dart';
import 'package:trashline/splash.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              controller: controller.emailC,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: controller.passC,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.green,
              // ),
              onPressed: () =>
                  authC.login(controller.emailC.text, controller.passC.text),
              child: Text("LOGIN"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun ? "),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () => Get.toNamed(Routes.SIGNUP),
                  child: Text("DAFTAR SEKARANG"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}