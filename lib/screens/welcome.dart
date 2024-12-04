import 'package:flutter/material.dart';
import 'login.dart'; // Import the Login class

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
            Image.asset('assets/logo.png'),
            
            // Text Description
            Padding(
              padding: const EdgeInsets.all(8.0), // Adjust padding as needed
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Vitae est cursus viverra id leo a massa tellus neque. Eu urna pharetra dolor sed eleifend. Pellentesque morbi aliquam nulla mauris. Iaculis felis senectus sollicitudin tempor vestibulum auctor.',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Get Started Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Use named route for Login
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
