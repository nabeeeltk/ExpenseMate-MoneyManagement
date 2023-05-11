import 'package:flutter/material.dart';


// ignore: camel_case_types
class Terms_condetions extends StatelessWidget {
  const Terms_condetions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'TERMS AND CONDITIONS',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.grey),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: const [
            Text(
              'Welcome to our Money Save App.Please read these terms and conditions carefully before using our app.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                '1: Acceptance of Terms \nBy accessing or using our app, you agree to be bound by these terms and conditions. If you do not agree with any of these terms, please do not use our app.',
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Text(
                '2: Use of the App. \nYou may use our app for personal and non-commercial purposes only. You may not use our app for any illegal or unauthorized purpose, including but not limited to copyright infringement or misuse of intellectual property.',
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Text(
                '3: User Accounts. \nYou may need to create a user account to use some features of our app. You are responsible for maintaining the confidentiality of your account login information and for all activities that occur under your account. You agree to notify us immediately if you suspect any unauthorized use of your account.',
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Text(
                '4: App Content \nAll content available on our app, including but not limited to text, graphics, images, logos, button icons, software, and audio clips, is the property of our company or its licensors and is protected by copyright and other intellectual property laws.',
                style: TextStyle(fontSize: 15, color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            Text(
                '5: Limitation of Liability\nOur company shall not be liable for any damages whatsoever arising out of or in connection with the use or inability to use our app, including but not limited to direct, indirect, incidental, consequential, or punitive damages.',
                style: TextStyle(fontSize: 15, color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
