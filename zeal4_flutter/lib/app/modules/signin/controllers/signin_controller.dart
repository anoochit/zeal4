import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
