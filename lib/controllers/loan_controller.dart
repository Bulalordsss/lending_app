import 'package:flutter/material.dart';
import '/screens/home.dart';

class LoanController {
  // Method to calculate loan balance with interest
  static double calculateLoanAmount(double amount) {
    double interestRate = 0;
    double totalInterest = 0;

    // Determine the interest rate based on the loan amount
    if (amount >= 1000 && amount <= 20000) {
      interestRate = 0.10;  // 10% interest
    } else if (amount > 20000 && amount <= 50000) {
      interestRate = 0.15;  // 15% interest
    } else if (amount > 50000 && amount <= 100000) {
      interestRate = 0.20;  // 20% interest
    }

    totalInterest = (amount * interestRate);

    // Calculate the total amount with interest
    return amount + totalInterest;
  }
}
