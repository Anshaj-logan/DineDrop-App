import 'package:dinedrop_app/base/custom_loaded.dart';
import 'package:dinedrop_app/base/show_custom_snakbar.dart';
import 'package:dinedrop_app/controllers/auth_controller.dart';
import 'package:dinedrop_app/model/signup_body.dart';
import 'package:dinedrop_app/routes/route_helper.dart';
import 'package:dinedrop_app/utils/colors.dart';
import 'package:dinedrop_app/utils/dimensions.dart';
import 'package:dinedrop_app/widgets/app_text_field.dart';
import 'package:dinedrop_app/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signupImages = ["fb-logo.png", "google-logo.png", "twitter-logo.png"];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackbar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackbar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
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
        SignUpBody signUpBody = SignUpBody(
            name: name, password: password, email: email, phone: phone);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Registered Successfully");
            Get.offNamed(RouteHelper.getinitial());
          } else {
            showCustomSnackbar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authcontroller) {
          return !_authcontroller.isLoading
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
                      //name
                      AppTextField(
                          textController: nameController,
                          hintText: "UserName",
                          icon: Icons.person),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //phone
                      AppTextField(
                          textController: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _registration(_authcontroller);
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
                              text: "Sign Up",
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
                      RichText(
                          text: TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.back(),
                              text: "Have an account already?",
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20))),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign up option
                      RichText(
                          text: TextSpan(
                        text: "Sign up using one of the following methods",
                        style: GoogleFonts.montserrat(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16),
                      )),
                      Wrap(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: Dimensions.radius30,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          "images/" + signupImages[index]),
                                    ),
                                  )))
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
