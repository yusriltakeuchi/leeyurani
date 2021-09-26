import 'package:flutter/material.dart';
import 'package:leeyurani/core/models/skill/skill_model.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:leeyurani/ui/constants/responsive.dart';
import 'package:leeyurani/ui/widgets/components/headers/head_item.dart';
import 'package:leeyurani/ui/widgets/components/skill/skill_item.dart';

class HomeSkillsSections extends StatefulWidget {
  const HomeSkillsSections({ Key? key }) : super(key: key);

  @override
  State<HomeSkillsSections> createState() => _HomeSkillsSectionsState();
}

class _HomeSkillsSectionsState extends State<HomeSkillsSections> {
  final List<SkillModel> _techSkill = [
    SkillModel(
      title: "Flutter & Dart",
      value: "Since 2019 (Most Active)",
      iconPath: "$iconAsset/icon_flutter.png"
    ),
    SkillModel(
      title: "Laravel & Lumen",
      value: "Since 2018",
      iconPath: "$iconAsset/icon_laravel.png"
    ),
    SkillModel(
      title: "Python",
      value: "Since 2017",
      iconPath: "$iconAsset/icon_python.png"
    ),
    SkillModel(
      title: "Mysql & PostgreSQL",
      value: "Since 2018",
      iconPath: "$iconAsset/icon_mysql_postgre.png"
    ),
    SkillModel(
      title: "PHP",
      value: "Since 2017",
      iconPath: "$iconAsset/icon_php.png"
    )
  ];

  final List<SkillModel> _professionalSkill = [
    SkillModel(
      title: "Creativity",
      value: "Medium"
    ),
    SkillModel(
      title: "Leadership",
      value: "Low"
    ),
    SkillModel(
      title: "Organization",
      value: "Low"
    ),
    SkillModel(
      title: "Fast Learning",
      value: "Medium"
    ),
    SkillModel(
      title: "Teamwork",
      value: "Medium"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grayColor,
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: _bubbleWidget()
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: Responsive.isMobile(context) ? 20 : deviceWidth(context) * (Responsive.isTablet(context) ? 0.1 : 0.2)),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                HeadItem(
                  iconPath: "$iconAsset/icon_skill.svg",
                  title: "Skills",
                ),
                const SizedBox(height: 20),
                _skillWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bubbleWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
        ),
        Container(
          width: 250,
          height: 250,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: primaryLightColor
          ),
        )
      ],
    );
  }

  Widget _skillWidget() {
    if (Responsive.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _technicalWidget(),
          const SizedBox(height: 30),
          _professionalWidget(),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _technicalWidget()),
        const SizedBox(width: 30),
        Expanded(child: _professionalWidget())
      ],
    );
  }

  Widget _professionalWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Professional Skill",
          style: styleTitle.copyWith(
            fontSize: 30,
            fontFamily: secondaryFontName
          ),
        ),
        const SizedBox(height: 30),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _professionalSkill.length,
          itemBuilder: (context, index) {
            
            final _skill = _professionalSkill[index];
            return SkillItem(skill: _skill);
          },
        )
      ],
    );
  }

  Widget _technicalWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Technical Skill",
          style: styleTitle.copyWith(
            fontSize: 30,
            fontFamily: secondaryFontName
          ),
        ),
        const SizedBox(height: 30),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _techSkill.length,
          itemBuilder: (context, index) {
            
            final _skill = _techSkill[index];
            return SkillItem(skill: _skill);
          },
        ),
        const SizedBox(height: 20),
        Text(
          "Info: Tahun pengalaman tidak menjadi penentu kualitas, sebab ditahun tertentu hanya fokus distack tertentu saja",
          style: styleSubtitle.copyWith(
            fontSize: 14,
            color: Colors.white
          )
        )
      ],
    );
  }
}