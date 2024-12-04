import 'package:flutter/material.dart';
import 'home.dart';
import 'pay.dart';
import 'loan.dart';
import 'profile.dart';
import 'settings.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int currentPageIndex = 0;

  // Initial current balance
  double currentBalance = 0;

  // Update balance logic (add new loan to current balance or subtract payment)
  void updateBalance(double amount, {bool isPayment = false}) {
    setState(() {
      if (isPayment) {
        currentBalance -= amount;  // Subtract the payment from the current balance
      } else {
        currentBalance += amount;  // Add loan to the current balance
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(currentBalance: currentBalance),  // Pass the current balance to HomePage
      PayPage(updateBalance: updateBalance),    // Pass updateBalance to PayPage
      LoanPage(updateBalance: updateBalance),   // Pass updateBalance to LoanPage
      ProfilePage(),
      SettingsPage(),
    ];

    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home_rounded),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.attach_money_rounded),
            label: 'Pay',
          ),
          NavigationDestination(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Loan',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
