import 'package:flutter/material.dart';

Widget customTextFormField({
  required String text,
  bool isPassword = false,
  required TextEditingController controller,
  String? Function(String?)? validator,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(80)),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isPassword,
        decoration:
        InputDecoration(label: Text(text), border: InputBorder.none),
      ),
    ),
  );
}