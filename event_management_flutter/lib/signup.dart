import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/services/http_service.dart';

import 'models/user_model.dart';

class SignupScreen extends StatefulWidget {

  SignupScreen({super.key,});

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.orangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(height: 20),

                  // Name
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 15),

                  // Email
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 15),
                  // Password
                  TextField(
                    controller: passwordController,
                    obscureText: obscureText,

                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText; // toggle
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  // SizedBox(height: 15),

                  // Confirm Password
                  // TextField(
                  //   controller: confirmPasswordController,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     prefixIcon: Icon(Icons.lock_outline),
                  //     labelText: "Confirm Password",
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(12)),
                  //   ),
                  // ),
                  SizedBox(height: 25),

                  // Sign Up Button
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: Size(double.infinity, 50),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12)),
                  //     backgroundColor: Colors.deepPurple,
                  //   ),
                  //   onPressed: () =>
                  //       Navigator.pushReplacementNamed(context, '/home'),
                  //   child: Text("Sign Up",
                  //       style: TextStyle(fontSize: 18, color: Colors.white)),
                  // ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.deepPurple

                    ),
                    onPressed: () async {

                      try {
                        UserModel newUser = UserModel(
                          fullName: nameController.text.trim(),
                          emailId: emailController.text.trim(),
                          password: passwordController.text.trim(),

                        );
                        UserModel? result = await HttpService().signup(newUser);

                        // Example: check response
                        if (result != null) {
                      //     // navigate to home
                          Navigator.pushReplacementNamed(context, '/home');

                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Failed to signup")),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: $e")),
                        );
                      }
                    },
                    child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                  ),

                  SizedBox(height: 15),

                  // Already have an account
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Text("Already have an account? Login"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
