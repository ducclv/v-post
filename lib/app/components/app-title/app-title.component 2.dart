import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v_post/themes/style.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Giaosieutoc",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 34, fontWeight: FontWeight.w700, color: AppColor.accentColor, fontStyle: FontStyle.italic),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: SvgPicture.asset("assets/images/login/truck.svg"),
        ),
      ],
    );
  }
}
