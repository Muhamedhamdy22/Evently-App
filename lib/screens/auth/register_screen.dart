import 'package:evently_app/core/firebase_function.dart';
import 'package:evently_app/screens/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "registerScreen";

  RegisterScreen({super.key});

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();


  var formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F7FF),
        centerTitle: true,
        title: Image.asset("assets/images/logo.png"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Create your account",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Please Enter Your name";
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                      prefixIcon: Image.asset("assets/images/user.png"),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Please Enter Your Email";
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if(!emailValid){
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                      prefixIcon: Image.asset("assets/images/sms.png"),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                      controller: passwordController,
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Please Enter Your Email";
                      }
                      if(value.length < 6){
                        return "Password must be at least 6 character";

                      }
                      return null;
                    },
                      style: TextStyle(fontSize: 14),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                        prefixIcon: Image.asset("assets/images/lock.png"),
                        suffixIcon: Image.asset("assets/images/eye.png"),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                  )

                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(fontSize: 14),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return "Please Enter Your Email";
                      }
                     if(value != passwordController.text){
                       return "Passwords not match";
                     }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Confirm your password",
                      hintStyle: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                      prefixIcon: Image.asset("assets/images/lock.png"),
                      suffixIcon: Image.asset("assets/images/eye.png"),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          FirebaseFunction.createUser(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                                  () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoginScreen.routeName,
                                      (route) => false,
                                );
                              },
                                  (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message),)
                                );
                              }
                          );
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0E3A99),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        "Sing up",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Text(
                        "Login",
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayMedium,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Or", style: Theme
                        .of(context)
                        .textTheme
                        .displayMedium),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/google.png",
                        width: 24,
                        height: 24,
                      ),
                      label: Text(
                        "Sign Up with Google",
                        style: Theme
                            .of(context)
                            .textTheme
                            .displayMedium,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
