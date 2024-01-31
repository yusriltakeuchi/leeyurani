import 'package:flutter/material.dart';

import 'package:leeyurani/core/models/skill/skill_model.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:leeyurani/ui/constants/responsive.dart';

class SkillItem extends StatelessWidget {
  final SkillModel skill;
  const SkillItem({
    super.key,
    required this.skill,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (skill.iconPath != null)
                Image.asset(
                  skill.iconPath!,
                  width: 30,
                  height: 30,
                ),

              if (skill.iconPath != null)
                const SizedBox(height: 10),
              _contentItem()
            ],
          )
        : Row(
          children: [
            if (skill.iconPath != null)
              Image.asset(
                skill.iconPath!,
                width: 30,
                height: 30,
              ),

            if (skill.iconPath != null)
              const SizedBox(width: 10),
            Expanded(child: _contentItem())
          ],
        ),
    );
  }

  Widget _contentItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill.title!,
          style: styleTitle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500
          )
        ),
        const SizedBox(height: 5),
        Text(
          skill.value!,
          style: styleSubtitle.copyWith(
            fontSize: 16,
            color: primaryColor
          )
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 2,
          color: primaryColor,
        )
      ],
    );
  }
}
