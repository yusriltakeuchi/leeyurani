import 'package:flutter/material.dart';

import 'package:leeyurani/core/models/resume/resume_model.dart';
import 'package:leeyurani/ui/constants/constant.dart';

class ResumeItem extends StatelessWidget {
  final ResumeModel resume;
  final bool isEnd;
  final bool isLeft;
  final bool showLine;
  const ResumeItem({
    Key? key,
    required this.resume,
    required this.isEnd,
    this.isLeft = false,
    this.showLine = true
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (isLeft && showLine)
            _lineLeftWidget(),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: isEnd == false ? 30 : 0),
              decoration: BoxDecoration(
                color: grayColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 8,
                    offset: const Offset(0, 4)
                  )
                ]
              ),
              child: Row(
                children: [
                  if (isLeft)
                    Container(
                      width: 3,
                      color: primaryColor,
                    ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _titleWidget(),
                          const SizedBox(height: 10),
                          Text(
                            resume.experienceTime!,
                            style: styleTitle.copyWith(
                              fontSize: 20,
                              color: primaryColor,
                            )
                          ),
                          const SizedBox(height: 10),
                          Text(
                            resume.description!,
                            textAlign: TextAlign.justify,
                            style: styleSubtitle.copyWith(
                              fontSize: 18,
                              height: 1.6
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  if (isLeft == false)
                    Container(
                      width: 3,
                      color: primaryColor,
                    )
                ],
              ),
            ),
          ),
          
          if (isLeft == false && showLine)
            _lineWidget()
        ],
      ),
    );
  }

  Widget _lineLeftWidget() {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor
              ),
            ),
            Container(
              width: 1,
              color: Colors.white.withOpacity(0.2),
            ),
          ],
        ),
        Container(
          width: 30,
          height: 3,
          color: primaryColor,
        ),
      ],
    );
  }

  Widget _lineWidget() {
    return Row(
      children: [
        Container(
          width: 30,
          height: 3,
          color: primaryColor,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 1,
              color: Colors.white.withOpacity(0.2),
            ),
            Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _titleWidget() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: [
          TextSpan(
            text: "${resume.role}${resume.company!.isNotEmpty ? ' di ' : ''}",
            style: styleTitle.copyWith(
              fontSize: 20,
              color: Colors.white,
              height: 1.4
            )
          ),
          TextSpan(
            text: resume.company,
            style: styleTitle.copyWith(
              fontSize: 25,
              color: primaryColor,
              fontStyle: FontStyle.italic,
              height: 1.4
            )
          )
        ]
      ),
    );
  }
}
