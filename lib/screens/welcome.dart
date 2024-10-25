import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
    WelcomeScreen({super.key});
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 229),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            Image(image: AssetImage('assets/logo.png'),),
            // Text
            Padding(
              padding: EdgeInsets.all(8.0), // Adjust padding as needed
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Vitae est cursus viverra id leo a massa tellus neque. Eu urna pharetra dolor sed eleifend. Pellentesque morbi aliquam nulla mauris. Iaculis felis senectus sollicitudin tempor vestibulum auctor.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}