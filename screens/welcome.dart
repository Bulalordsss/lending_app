import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
    const WelcomeScreen({super.key});
    
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
              padding: EdgeInsets.all(48.0), // Adjust padding as needed
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Vitae est cursus viverra id leo a massa tellus neque. Eu urna pharetra dolor sed eleifend. Pellentesque morbi aliquam nulla mauris. Iaculis felis senectus sollicitudin tempor vestibulum auctor.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            // Button
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: Text('Get Started'),
              backgroundColor: Color.fromRGBO(227, 225, 217, 1),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WelcomeScreen(),
  ));
}
