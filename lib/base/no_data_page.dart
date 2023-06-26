import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  // final String text;
  final String imgPath;
  const NoDataPage({Key? key, this.imgPath = "images/empty.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          imgPath,
          height: MediaQuery.of(context).size.height * 0.48,
          width: MediaQuery.of(context).size.width * 0.48,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}
