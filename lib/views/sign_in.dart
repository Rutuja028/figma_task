import 'package:figma_task/views/onboarding_page1.dart';
import 'package:flutter/material.dart';

import 'package:figma_task/components/text_form_field.dart';
import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/views/sign_up.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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

  void _signIn() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
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
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              Image.asset(
                "assets/SignInImage.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 40, bottom: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const Gap(24),
                      // PrimaryTextFormField(
                      //   keyboardType: TextInputType.phone,
                      //   obscureText: false,
                      //   controller: emailController,
                      //   inputFormatters: [
                      //     FilteringTextInputFormatter.digitsOnly,
                      //     LengthLimitingTextInputFormatter(10),
                      //   ],
                      //   prefixText: "+91",
                      //   hintText: "Phone Number",
                      //   validator: (value) {
                      //     if (value?.isEmpty ?? true) {
                      //       return "Please enter your phone number";
                      //     } else if (value!.length < 10) {
                      //       return "10 digits required";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      PrimaryTextFormField(
                        controller: emailController,
                        hintText: "Email Address",
                        keyboardType: TextInputType.emailAddress,
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

                      const Gap(16),
                      PrimaryTextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        hintText: "Password",
                        suffixIcon: IconButton(
                          color: const Color(0xFF8F9098),
                          icon: showPass
                              ? SvgPicture.asset("assets/visibility_off.svg",
                                  height: 16, width: 16)
                              : const Icon(Icons.visibility_rounded, size: 16),
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
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
                      const Gap(16),
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
                      const Gap(24),
                      SizedBox(
                        height: 50,
                        width: 380,
                        child: PrimaryButton(
                          buttonText: "Login",
                          onTap: _signIn,
                        ),
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
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
                                color: Color(0xFF006FFD),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
