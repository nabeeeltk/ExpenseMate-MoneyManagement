import 'package:flutter/material.dart';
import 'package:save_money/Screens/Home_Screen.dart';

class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: screenHeight * 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/520010-PJ0495-104.jpg'),
                   
                    fit: BoxFit.fill,
                  ),
                )),
            
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05, top: screenHeight * 0.08),
              child: Text(
                'Let\'s\nManage\nMoney With Us',
                style: TextStyle(fontSize: screenHeight * 0.05, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01, left: screenWidth * 0.05),
              child: Text(
                "Counter and distribute the income\ncorrectly...",
                style: TextStyle(fontSize: screenHeight * 0.03, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home_Screen()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: screenHeight * 0.025),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(screenWidth * 0.4, screenHeight * 0.07),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
