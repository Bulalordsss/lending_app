import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final double currentBalance;

  const HomePage({super.key, required this.currentBalance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 229),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/logo.png')),
              Card.outlined(
                child: _SampleCard(
                  cardName: 'Notifications',
                  subtitle: 'Loan Payment of ₱${currentBalance.toStringAsFixed(2)} due in 7 days',
                ),
              ),
              Card.outlined(
                child: _SampleCard(
                  cardName: 'Interest Rates',
                  subtitle: '''
₱1,000 - 20,000 10%
₱21,000 - 50,000 15%
₱51,000 - 100,000 20%
''',
                ),
              ),
              Card.outlined(
                child: _SampleCard(
                  cardName: 'Loan Application',
                  subtitle: 'Your application is approved',
                ),
              ),
              Card.outlined(
                child: _SampleCard(
                  cardName: 'Loan Balance',
                  subtitle: 'Your current balance is ₱${currentBalance.toStringAsFixed(2)}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName, required this.subtitle});

  final String cardName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(cardName, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: subtitle.split('\n').map((line) => Text(line, style: const TextStyle(color: Colors.grey))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
