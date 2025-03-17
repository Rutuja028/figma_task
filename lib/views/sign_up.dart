import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/components/text_form_field.dart';
import 'package:figma_task/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool showPass = false;
  bool confirmPass = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignIn()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter valid email and password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign Up!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text(
                        "Create an account to get started",
                        style: TextStyle(
                          color: Color(0xFF808080),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PrimaryTextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-z]'))
                          ],
                          controller: nameController,
                          labelText: "Name",
                          validator: (valu) {
                            if (valu!.length > 30) {
                              return "Limit Exceeded";
                            }
                            return null;
                          }),
                      const SizedBox(height: 10),
                      PrimaryTextFormField(
                        controller: emailController,
                        labelText: "Email Address",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          } else if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      PrimaryTextFormField(
                        controller: passwordController,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            icon: showPass
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined)),
                        labelText: "Password",
                        obscureText: showPass ? false : true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Create a password";
                          } else if (value.length < 6) {
                            return "Password must be atleast 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      PrimaryTextFormField(
                        controller: confirmPasswordController,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                confirmPass = !confirmPass;
                              });
                            },
                            icon: confirmPass
                                ? const Icon(
                                    Icons.visibility_off_outlined,
                                  )
                                : const Icon(Icons.visibility_outlined)),
                        labelText: "Confirm Password",
                        obscureText: confirmPass ? false : true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (value != passwordController.text) {
                            return "Passwords does not match";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        buttonHeight: 50,
                        buttonWidth: 380,
                        buttonText: "Sign Up",
                        onTap: _signUp,
                      ),
                      const SizedBox(height: 20),
                      Row(children: [
                        const Center(
                          child: Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignIn(),
                                ));
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ])
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
