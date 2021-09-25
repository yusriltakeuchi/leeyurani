import 'package:flutter/material.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SocialButton extends StatelessWidget {
  final String? iconPath;
  final VoidCallback? onClick;
  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          shape: BoxShape.circle
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: WebsafeSvg.asset(
              iconPath!, 
              color: Colors.white,
              width: 20,
              height: 20
            ),
          ),
        ),
      ),
    );
  }
}
