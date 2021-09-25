
import 'package:flutter/material.dart';

/// ------------------------------
/// Define any constant property
/// ------------------------------

/// Color constant
const Color primaryColor = Color(0xff1cb698);
const Color primaryLightColor = Color(0xff2ee6c2);
const Color blackColor = Color(0xff1E2326);
const Color grayColor = Color(0xff252A2E);

/// Device size
double deviceWidth(BuildContext context) =>
  MediaQuery.of(context).size.width;

double deviceHeight(BuildContext context) =>
  MediaQuery.of(context).size.height;

/// Assets location
String iconAsset = "assets/icons";
String imageAsset = "assets/images";

/// Define font name
const String primaryFontName = "WorkSans";
const String secondaryFontName = "Righteous";

/// Text styling
const TextStyle styleTitle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontFamily: primaryFontName
);

const TextStyle styleSubtitle = TextStyle(
  fontSize: 15,
  color: Colors.white,
  fontFamily: primaryFontName
);