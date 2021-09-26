import 'package:flutter/material.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:leeyurani/ui/constants/responsive.dart';
import 'package:leeyurani/ui/screens/home/sections/home_about_sections.dart';
import 'package:leeyurani/ui/screens/home/sections/home_header_sections.dart';
import 'package:leeyurani/ui/screens/home/sections/home_resume_sections.dart';
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

class HomeBody extends StatefulWidget {
  const HomeBody({ Key? key }) : super(key: key);
  static const List<Widget> sections = [
    HomeHeaderSections(),
    HomeAboutSections(),
    HomeSkillsSections(),
    HomeResumeSections()
  ];

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Responsive(
          mobile: _homeContentsWidget(), 
          tablet: _homeContentsWidget(), 
          desktop: _homeContentsWidget()
        ),
        _appbarWidget()
      ],
    );
  }

  Widget _appbarWidget() {
    return Container(
      decoration: BoxDecoration(
        color: blackColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 8,
            offset: const Offset(0, 4)
          )
        ]
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: Responsive.isMobile(context) ? 20 : deviceWidth(context) * (Responsive.isTablet(context) ? 0.1 : 0.2)),
        child: Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "Leeyurani",
                style: styleTitle.copyWith(
                  color: primaryColor,
                  fontSize: 35,
                  fontFamily: secondaryFontName
                ),
              ),
            ),
            const Spacer(),
            
            if (!Responsive.isMobile(context))
              Row(
                children: [
                  _menuItem(
                    title: "HOME",
                    onClick: () {}
                  ),
                  const SizedBox(width: 40),
                  _menuItem(
                    title: "ABOUT",
                    onClick: () {}
                  ),
                  const SizedBox(width: 40),
                  _menuItem(
                    title: "SKILLS",
                    onClick: () {}
                  ),
                  const SizedBox(width: 40),
                  _menuItem(
                    title: "RESUME",
                    onClick: () {}
                  )
                ],
              ),

            if (Responsive.isMobile(context))
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _menuItem({required String title, required VoidCallback onClick}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onClick(),
        child: Text(
          title,
          style: styleSubtitle.copyWith(
            fontSize: 20
          )
        ),
      ),
    );
  }

  Widget _homeContentsWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: HomeBody.sections.length,
      itemBuilder: (context, index) {

        return HomeBody.sections[index];
      },
    );
  }
}