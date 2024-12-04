import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the state class
class SignupState {
  final String name;
  final String username;
  final String password;
  final String confirmPassword;
  final String? errorMessage;

  SignupState({
    this.name = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.errorMessage,
  });

  SignupState copyWith({
    String? name,
    String? username,
    String? password,
    String? confirmPassword,
    String? errorMessage,
  }) {
    return SignupState(
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage,
    );
  }
}

// Define the StateNotifier
class SignupController extends StateNotifier<SignupState> {
  SignupController() : super(SignupState());

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  void signup(BuildContext context) {
    final name = state.name.trim();
    final username = state.username.trim();
    final password = state.password.trim();
    final confirmPassword = state.confirmPassword.trim();

    if (name.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      state = state.copyWith(errorMessage: "All fields are required.");
      return;
    }

    if (password != confirmPassword) {
      state = state.copyWith(errorMessage: "Passwords do not match.");
      return;
    }

    // Mock success (replace with actual signup logic)
    state = state.copyWith(errorMessage: null);
    Navigator.pushReplacementNamed(context, '/mainpage');
  }
}
