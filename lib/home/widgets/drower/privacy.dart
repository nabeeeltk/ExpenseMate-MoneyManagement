import 'package:flutter/material.dart';

class privacy_policy extends StatelessWidget {
  const privacy_policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('PRIVACY AND POLICY',style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:const  [
            
            Text('Thank you for using our Flutter money management app. We are committed to protecting your privacy and ensuring that your personal information is secure. This privacy policy outlines the type of information we collect, how we use it, and how we protect it.'),
            SizedBox(height: 10,),
            Text('Information We Collect\nWe may collect personal information such as your name, email address, and financial information when you use our app. We may also collect usage information such as your device information, IP address, and the pages you access.'),
            SizedBox(height: 10,),
            Text('How We Use Your Information\nWe use your personal information to provide you with the services you have requested, such as managing your finances and providing you with financial advice. We may also use your information to communicate with you about our products and services.'),
            SizedBox(height: 10,),
            Text('We may use your usage information to improve our app and to provide you with a better user experience. We may also use your information to troubleshoot problems and to prevent fraud.\n How We Protect Your Information\nWe take the security of your personal information seriously and have implemented appropriate technical and organizational measures to protect it. We use encryption to protect your financial information and limit access to your personal information to authorized personnel only.'),
            SizedBox(height: 10,),
            Text('Sharing Your Information\nWe may share your personal information with third-party service providers who help us provide our services. We may also share your information with government agencies or other third parties if we are required to do so by law.'),
            SizedBox(height: 10,),
            Text('Changes to This Policy\nWe may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on our website or within the app.')
          ],
        ),
      )
      
        
    );
  }
}
