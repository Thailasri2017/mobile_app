import 'package:flutter/material.dart';

class UserModel {
  String email;
  String password;
  String otp;
  String mobileNumber;

  UserModel({
    required this.email,
    required this.password,
    required this.otp,
    required this.mobileNumber,
  });

  factory UserModel.fromForm({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController otpController,
    required TextEditingController mobileNumberController,
  }) {
    return UserModel(
      email: emailController.text,
      password: passwordController.text,
      otp: otpController.text,
      mobileNumber: mobileNumberController.text,
    );
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  String? validateOtp(String value) {
    if (value.isEmpty) {
      return 'Please enter the OTP';
    }
    return null;
  }

  String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    return null;
  }
}
