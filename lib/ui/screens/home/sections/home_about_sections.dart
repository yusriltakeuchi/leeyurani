import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:leeyurani/core/models/stack/stack_model.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:leeyurani/ui/constants/responsive.dart';
import 'package:leeyurani/ui/widgets/components/headers/head_item.dart';

class HomeAboutSections extends StatefulWidget {
  const HomeAboutSections({ Key? key }) : super(key: key);

  @override
  State<HomeAboutSections> createState() => _HomeAboutSectionsState();
}

class _HomeAboutSectionsState extends State<HomeAboutSections> {
  final List<StackModel> _stacks = [
    StackModel(
      title: "FLUTTER",
      iconPath: "$iconAsset/icon_flutter.png",
    ),
    StackModel(
      title: "DART",
      iconPath: "$iconAsset/icon_dart.png",
    ),
    StackModel(
      title: "LARAVEL",
      iconPath: "$iconAsset/icon_laravel.png",
    ),
    StackModel(
      title: "PYTHON",
      iconPath: "$iconAsset/icon_python.png",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: Responsive.isMobile(context) ? 20 : deviceWidth(context) * (Responsive.isTablet(context) ? 0.1 : 0.2)),
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          HeadItem(
            iconPath: "$iconAsset/icon_info.svg",
            title: "About Me",
          ),
          const SizedBox(height: 20),
          _informationWidget(),
          const SizedBox(height: 30),
          _interestWidget()
        ],
      ),
    );
  }

  Widget _interestWidget() {
    if (Responsive.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _personalWidget(),
          const SizedBox(height: 30),
          _codingStackWidget(),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _personalWidget()),
        const SizedBox(width: 30),
        Expanded(child: _codingStackWidget()),
      ],
    );
  }

  Widget _codingStackWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Coding Stack",
          style: styleTitle.copyWith(
            fontSize: 30,
            fontFamily: secondaryFontName
          ),
        ),
        const SizedBox(height: 30),
        StaggeredGridView.countBuilder(
          crossAxisCount: Responsive.isMobile(context) ? 2 : Responsive.isTablet(context) ? 2 : 4,
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _stacks.length,
          shrinkWrap: true,
          staggeredTileBuilder: (int index) =>
            const StaggeredTile.fit(1),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20, // add some space
          itemBuilder: (context, index) {

            final _item = _stacks[index];
            return _stackItem(_item);
          },
        )
      ],
    );
  }

  Widget _stackItem(StackModel _item) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: grayColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 4)
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Image.asset(
                _item.iconPath!,
                width: 30,
                height: 30,
              ),
              const SizedBox(height: 15),
              Text(
                _item.title!,
                style: styleTitle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: Responsive.isMobile(context) ? 15 : 18
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _personalWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal Details",
          style: styleTitle.copyWith(
            fontSize: 30,
            fontFamily: secondaryFontName
          ),
        ),
        const SizedBox(height: 30),
        _labelWidget(
          title: "Email",
          value: "yuranicorp@gmail.com"
        ),
        const SizedBox(height: 15),
        _labelWidget(
          title: "Lokasi",
          value: "DKI Jakarta, Indonesia"
        ),
        const SizedBox(height: 15),
        _labelWidget(
          title: "Pekerjaan",
          value: "Onsite, Remote & Freelance"
        ),
      ],
    );
  }

  Widget _labelWidget({required String title, required String value}) {
    return Row(
      children: [
        Expanded(
          flex: Responsive.isTablet(context) ? 3 : 2,
          child: Text(
            title,
            style: styleTitle.copyWith(
              fontSize: 20,
              color: primaryColor,
            )
          ),
        ),
        Expanded(
          flex: Responsive.isMobile(context) ? 4 : 6,
          child: Text(
            value,
            style: styleSubtitle.copyWith(
              fontSize: 20,
            )
          ),
        ),

      ],
    );
  }

  Widget _informationWidget() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Hallo! Saya Yusril Rapsanjani.",
            style: styleTitle.copyWith(
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.w500
            )
          ),
          TextSpan(
            text: " Saat ini saya bekerja sebagai Mobile Developer di suatu perusahaan media di Jakarta Selatan. Menyukai tantangan dan hal baru, serta menerima project aplikasi berdasarkan permintaan client.",
            style: styleSubtitle.copyWith(
              fontSize: 20,
              height: 1.6
            )
          )
        ]
      ),
    );
  }
}