import 'package:flutter/material.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:leeyurani/ui/constants/responsive.dart';
import 'package:leeyurani/ui/widgets/components/buttons/social_button.dart';

class HomeHeaderSections extends StatefulWidget {
  const HomeHeaderSections({ Key? key }) : super(key: key);
  @override
  State<HomeHeaderSections> createState() => _HomeHeaderSectionsState();
}

class _HomeHeaderSectionsState extends State<HomeHeaderSections> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("$imageAsset/background.jpg"),
          fit: BoxFit.cover
        ),
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            _shadowBackground(),
            _headerProfile()
          ],
        ),
      ),
    );
  }

  Widget _shadowBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [blackColor, blackColor.withOpacity(0.8)],
        )
      ),
    );
  }

  Widget _headerProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Align(
        alignment: Alignment.topCenter,
        child: IntrinsicHeight(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 550,
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Responsive.isMobile(context) ? 250 : 350,
                    height: Responsive.isMobile(context) ? 250 : 350,
                    decoration: BoxDecoration(
                      color: blackColor,
                      border: Border.all(color: primaryColor, width: 8),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "$imageAsset/profile.png"
                        ),
                        fit: BoxFit.cover
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _profileName()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "YUSRIL RAPSANJANI",
            textAlign: TextAlign.center,
            style: styleTitle.copyWith(
              fontSize: Responsive.isMobile(context) ? 40 : 45,
              fontFamily: secondaryFontName
            ),
          ),
          Text(
            "Mobile Developer",
            style: styleSubtitle.copyWith(
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                iconPath: "$iconAsset/icon_facebook.svg",
                onClick: () {},
              ),
              SocialButton(
                iconPath: "$iconAsset/icon_instagram.svg",
                onClick: () {},
              ),
              SocialButton(
                iconPath: "$iconAsset/icon_linkedin.svg",
                onClick: () {},
              ),
              SocialButton(
                iconPath: "$iconAsset/icon_github.svg",
                onClick: () {},
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}