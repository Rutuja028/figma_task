import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/components/text_form_field.dart';
import 'package:figma_task/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool showPass = false;
  bool confirmPass = false;
  bool isChecked = false;

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
                      const Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      Gap(8),
                      PrimaryTextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-z]'))
                          ],
                          controller: nameController,
                          hintText: "Name",
                          obscureText: false,
                          validator: (valu) {
                            if (valu!.length > 30) {
                              return "Limit Exceeded";
                            }
                            return null;
                          }),
                      Gap(16),
                      const Text(
                        "Email Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      Gap(8),
                      PrimaryTextFormField(
                        controller: emailController,
                        hintText: "Email Address",
                        obscureText: false,
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
                      Gap(16),
                      const Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      Gap(8),
                      PrimaryTextFormField(
                        controller: passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                          color: Color(0xFFC5C6CC),
                          icon: showPass
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        ),
                        hintText: "Password",
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
                      Gap(16),
                      PrimaryTextFormField(
                        controller: confirmPasswordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmPass = !confirmPass;
                            });
                          },
                          color: Color(0xFFC5C6CC),
                          icon: confirmPass
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility_rounded),
                        ),
                        hintText: "Confirm Password",
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
                      Gap(24),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Checkbox(
                                // fillColor: WidgetStatePropertyAll(Colors.white),
                                // Color.fromARGB(255, 128, 128, 128)),
                                checkColor: Colors.white,
                                value: isChecked,
                                activeColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  // side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(
                                    color: Color(0xFF808080),
                                    width: 2,
                                    strokeAlign: -1),
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                }),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "I've read and agree with the ",
                                style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: "Terms and\nConditions ",
                                style: TextStyle(
                                    color: Color(0xFF006FFD),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              TextSpan(
                                text: "and the ",
                                style: TextStyle(
                                    color: const Color(0xFF808080),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                    color: const Color(0xFF006FFD),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800),
                              ),
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                    color: Color(0xFF808080),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ])),
                          ],
                        ),
                      ),
                      Gap(28.5),
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
