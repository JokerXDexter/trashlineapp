import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import 'home_controller.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:trashline/views/upload_multiple_files.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:trashline/views/second_screen.dart';
import 'package:trashline/views/home_screen.dart';

Future<void> _openSITE() async {
  String googleURL =
      'https://www.surabaya.go.id/id/page/0/8079/dinas-kebersihan-dan-pertamanan';
  await canLaunchUrlString(googleURL)
      ? await launchUrlString(googleURL)
      : throw 'Could not launch $googleURL';
}

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('TRASHLINE'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => authC.logout(),
            icon: Icon(Icons.logout),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: IconButton (
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context)=>AlertDialog(
                    alignment: Alignment.center,
                    title: Center(child: Text('About Us'),),

                    content: Text('TrashLine adalah Aplikasi Mobile yang berfungsi agar masyarakat dapat melaporkan apabila terdapat sampah yang berserakan di lingkungan sekitar kepada Petugas Kebersihan Kota',textAlign: TextAlign.center,),
                    actions: [
                      IconButton(
                          onPressed: () {
                            _openSITE();
                          },
                          icon: const Icon(Icons.local_post_office_outlined)),
                    ],
                  ));
            },
          ),
        ),

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            )
        ),

      ),

      body: Container(

        width: double.infinity,
        child: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(32),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 200,
            ),
            //====================================================================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        // MaterialPageRoute(builder: (context) => second_screen())
                        PageTransition(
                          child:HomePage(),
                          type: PageTransitionType.leftToRight,
                        ),
                      ),
                      label: Text('UPLOAD SAMPAH'),
                    icon: Icon(Icons.upload),

                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).push(
                      // MaterialPageRoute(builder: (context) => second_screen())
                      PageTransition(
                        child:second_screen(),
                        type: PageTransitionType.leftToRight,
                      ),
                    ),
                    label: Text('LIHAT SAMPAH'),
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              // child: MaterialButton(
              //   color: Colors.green,
              //   minWidth: double.infinity,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8)),
              //   height: 50,
              //   onPressed: () {
              //     Get.to(() => MultiFileUplaodScreen());
              //   },
              //   child: Text("Multi File"),
              // ),
            )
            //====================================================================


          ]),
        ),
      ),

    );
  }
}