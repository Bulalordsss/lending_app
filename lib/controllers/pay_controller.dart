import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider to hold the balance
final balanceProvider = StateProvider<double>((ref) => 0.0);

class PaymentController {
  static void processPayment(WidgetRef ref, double paymentAmount) {
    // Get the current balance from the state
    final currentBalance = ref.read(balanceProvider);

    // Check if the payment amount is valid
    if (paymentAmount <= 0) {
      throw Exception("Payment amount must be greater than zero");
    }

    // Check if the payment amount exceeds the current balance
    if (paymentAmount > currentBalance) {
      throw Exception("Payment amount exceeds current balance");
    }

    // Update the balance by subtracting the payment
    ref.read(balanceProvider.notifier).state = currentBalance - paymentAmount;
  }
}
