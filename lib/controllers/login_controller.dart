import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the state class
class LoginState {
  final String username;
  final String password;
  final String? errorMessage;

  LoginState({
    this.username = '',
    this.password = '',
    this.errorMessage,
  });

  LoginState copyWith({
    String? username,
    String? password,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      errorMessage: errorMessage,
    );
  }
}

// Define the StateNotifier
class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState());

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void login(BuildContext context) {
    final username = state.username.trim();
    final password = state.password.trim();

    if (username.isEmpty || password.isEmpty) {
      state = state.copyWith(errorMessage: "Both fields are required.");
      return;
    }

    if (username == "user" && password == "password") {
      state = state.copyWith(errorMessage: null);
      Navigator.pushReplacementNamed(context, '/mainpage');
    } else {
      state = state.copyWith(errorMessage: "Invalid credentials. Please try again.");
    }
  }
}