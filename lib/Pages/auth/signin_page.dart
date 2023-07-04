import 'package:dinedrop_app/Pages/auth/signup_page.dart';
import 'package:dinedrop_app/base/custom_loaded.dart';
import 'package:dinedrop_app/routes/route_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../base/show_custom_snakbar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackbar("Type in your email", title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar("Type in your valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackbar("Type in your password", title: "password");
      } else if (password.length < 6) {
        showCustomSnackbar("password can not be less than six characters",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getinitial());
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //app logo
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage('images/splashlogo-1.png'),
                          ),
                        ),
                      ),
                      //welcome
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello",
                              style: GoogleFonts.roboto(
                                  fontSize: Dimensions.font20 * 3 +
                                      Dimensions.font20 / 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("Sign into Your account",
                                style: GoogleFonts.roboto(
                                    fontSize: Dimensions.font20,
                                    color: Colors.grey[500]))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //email
                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      //password
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),

                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                              text: TextSpan(
                                  text: "Sign into your account",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey[500],
                                      fontSize: Dimensions.font20))),
                          SizedBox(
                            width: Dimensions.width20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),

                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor,
                          ),
                          //sign up button
                          child: Center(
                            child: BigText(
                              text: "Sign In",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      //tag line

                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign up option
                      RichText(
                        text: TextSpan(
                            text: "Don\'t an account?",
                            style: GoogleFonts.montserrat(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => SignUpPage(),
                                      transition: Transition.fade),
                                text: " Create",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainBlackColor,
                                    fontSize: Dimensions.font20),
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
