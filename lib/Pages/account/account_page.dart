import 'package:dinedrop_app/base/custom_loaded.dart';
import 'package:dinedrop_app/controllers/auth_controller.dart';
import 'package:dinedrop_app/controllers/cart_controller.dart';
import 'package:dinedrop_app/controllers/user_controller.dart';
import 'package:dinedrop_app/routes/route_helper.dart';
import 'package:dinedrop_app/utils/colors.dart';
import 'package:dinedrop_app/utils/dimensions.dart';
import 'package:dinedrop_app/widgets/account_widget.dart';
import 'package:dinedrop_app/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/big_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("User has logged in");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(
          child: BigText(
            text: "Profile",
            size: Dimensions.iconSize24,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return _userLoggedIn
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(
                      children: [
                        //Profile Icon
                        AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconClor: Colors.white,
                          iconSize: Dimensions.height15 * 5,
                          size: Dimensions.height15 * 10,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //name
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconClor: Colors.white,
                                      iconSize: Dimensions.iconSize24,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel.name
                                          .toString(),
                                    )),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //phone
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconClor: Colors.white,
                                      iconSize: Dimensions.iconSize24,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel.phone
                                          .toString(),
                                    )),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //email
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconClor: Colors.white,
                                      iconSize: Dimensions.iconSize24,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: userController.userModel.email
                                          .toString(),
                                    )),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //address
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconClor: Colors.white,
                                      iconSize: Dimensions.iconSize24,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                      text: "Fill in your address",
                                    )),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //message
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>()
                                          .clearCartHistory();
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    } else {
                                      print("You logged out");
                                    }
                                  },
                                  child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: Colors.redAccent,
                                        iconClor: Colors.white,
                                        iconSize: Dimensions.iconSize24,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(
                                        text: "Log Out",
                                      )),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : CustomLoader())
            : Container(
                child: Center(
                    child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.height20 * 18,
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/login-1.png"))),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getSignInPage());
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: Dimensions.height20 * 5,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: Center(
                        child: BigText(
                          text: " Sign in ",
                          color: Colors.white,
                          size: Dimensions.font26,
                        ),
                      ),
                    ),
                  ),
                ],
              )));
      }),
    );
  }
}
