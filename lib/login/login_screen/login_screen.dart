import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iti/home/home1.dart';
import 'package:iti/login/extension/email_valid.dart';

import '../../register/register_screen/register_screen.dart';
import '../../widgets/custom_text_form.dart';
import '../cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Get.offAll(Home());
          }
          if (state is LoginError) {
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
                        "assets/images/playtime.png",
                        height:  MediaQuery.sizeOf(context).height*0.225,
                        width: MediaQuery.sizeOf(context).width*0.5,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.068,
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
                          text: "Password",
                          isPassword: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a valid password";
                            }
                          }),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.034,
                      ),
                      InkWell(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                                email: _emailController.text,
                                password: _passwordController.text);
                            print("=============>${_emailController.text}");
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height*0.068,
                          decoration: BoxDecoration(
                            color: Color(0xFF8F4BF0),
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Center(
                            child: BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoading) {
                                  return CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                }
                                return Text(
                                  "GO",
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
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.034,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account yet?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),

                          // TODO : Go to register Screen
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        (RegisterScreen())),
                                        (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF2EB892),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
