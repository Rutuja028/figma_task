import 'package:flutter/material.dart';

import 'package:figma_task/components/text_form_field.dart';
import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/views/onboarding_page1.dart';
import 'package:figma_task/views/sign_up.dart';
import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showPass = false;

  // void _signIn() {
  //   if (_formKey.currentState!.validate()) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const SignUp()),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("Please enter valid email and password"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/SignInImage.png",

                  //height: 300,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text("Welcome!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                )),
                          ),
                          const SizedBox(height: 20),
                          PrimaryTextFormField(
                            keyboardType: TextInputType.phone,
                            controller: emailController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            prefixText: "+91",
                            labelText: "Phone Number",
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Please enter your phone number";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          PrimaryTextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                              icon: showPass
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility_outlined),
                            ),
                            obscureText: showPass ? false : true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                              if (value.length < 6) {
                                return "Password must be atleast 6 characters";
                              }
                              return null;
                            },
                            inputFormatters: [],
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {},
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color(0xFF006FFD),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          PrimaryButton(
                            buttonHeight: 50,
                            buttonWidth: 380,
                            buttonText: "Sign In",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OnBoarding(),
                                  ));
                            },
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: Row(children: [
                              Text(
                                "Not a member? ",
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUp(),
                                      ));
                                },
                                child: const Text(
                                  "Register Now",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
