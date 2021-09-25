import 'package:flutter/material.dart';
import 'package:leeyurani/ui/constants/responsive.dart';
import 'package:leeyurani/ui/screens/home/sections/home_about_sections.dart';
import 'package:leeyurani/ui/screens/home/sections/home_header_sections.dart';
import 'package:leeyurani/ui/screens/home/sections/home_skills_sections.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({ Key? key }) : super(key: key);
  static const List<Widget> sections = [
    HomeHeaderSections(),
    HomeAboutSections(),
    HomeSkillsSections()
  ];

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _homeContentsWidget(), 
      tablet: _homeContentsWidget(), 
      desktop: _homeContentsWidget()
    );
  }

  Widget _homeContentsWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: sections.length,
      itemBuilder: (context, index) {

        return sections[index];
      },
    );
  }
}