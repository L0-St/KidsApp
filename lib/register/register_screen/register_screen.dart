import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti/login/extension/email_valid.dart';

import '../../home/home1.dart';
import '../../widgets/custom_text_form.dart';
import '../cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Get.offAll(Home());
          }
          if (state is RegisterError) {
            Get.snackbar("error", state.message,
                backgroundColor: Colors.red, colorText: Colors.white);
          }
        },
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 212, 193, 220),
          body: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 150.0, right: 16, left: 16),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/chase.png",
                        height:  MediaQuery.sizeOf(context).height*0.225,
                        width: MediaQuery.sizeOf(context).width*0.5,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.068,
                      ),
                      customTextFormField(
                          text: "Name",
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter a valid password";
                          }
                      ),
                      customTextFormField(
                          text: "Email",
                          controller: _emailController,
                          validator: (value) {
                            if (!value!.emailValid) {
                              return "Please enter valid email ";
                            }
                          }),
                      customTextFormField(
                          text: "Phone",
                          controller: _phoneController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return "Please enter a valid name";
                          }
                      ),
                      customTextFormField(
                          text: "Password",
                          isPassword: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a valid password";
                            }
                          }),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.034,
                      ),
                      InkWell(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            context.read<RegisterCubit>().register(
                                name:_nameController.text ,
                                phone: _phoneController.text,
                                email: _emailController.text,
                                password: _passwordController.text);
                            print("=============>${_emailController.text}");
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height*0.068,
                          decoration: BoxDecoration(
                            color: Color(0xFFEB9F4A),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Center(
                            child: BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, state) {
                                if (state is RegisterLoading) {
                                  return CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                }
                                return Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
