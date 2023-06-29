import 'package:dinedrop_app/utils/colors.dart';
import 'package:dinedrop_app/utils/dimensions.dart';
import 'package:dinedrop_app/widgets/account_widget.dart';
import 'package:dinedrop_app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                          text: "Anshaj",
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
                          text: "894507007",
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
                          text: "anshaj@gmail.com",
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
                          text: "Calicut",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //message
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconClor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "no Messages",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    // AccountWidget(
                    //     appIcon: AppIcon(
                    //       icon: Icons.message_outlined,
                    //       backgroundColor: Colors.redAccent,
                    //       iconClor: Colors.white,
                    //       iconSize: Dimensions.iconSize24,
                    //       size: Dimensions.height10 * 5,
                    //     ),
                    //     bigText: BigText(
                    //       text: "no Messages",
                    //     )),
                    // SizedBox(
                    //   height: Dimensions.height20,
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
