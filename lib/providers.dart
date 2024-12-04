import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

// Login provider
final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) => LoginController());

// Signup provider
final signupControllerProvider =
    StateNotifierProvider<SignupController, SignupState>((ref) => SignupController());
