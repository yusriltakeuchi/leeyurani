import 'package:flutter/material.dart';
import 'package:leeyurani/core/models/resume/resume_model.dart';
import 'package:leeyurani/ui/constants/constant.dart';
import 'package:leeyurani/ui/constants/responsive.dart';
import 'package:leeyurani/ui/widgets/components/headers/head_item.dart';
import 'package:leeyurani/ui/widgets/components/resume/resume_item.dart';

class HomeResumeSections extends StatefulWidget {
  const HomeResumeSections({ Key? key }) : super(key: key);

  @override
  State<HomeResumeSections> createState() => _HomeResumeSectionsState();
}

class _HomeResumeSectionsState extends State<HomeResumeSections> {
  final List<ResumeModel> _educationals = [
    ResumeModel(
      role: "Sekola Dasar",
      company: "Mangga Besar 05",
      experienceTime: "2005 - 2011",
      description: "Perjalanan pendidikan sekolah dasar saya diawali di Mangga Besar 05 selama 6 tahun"
    ),
    ResumeModel(
      role: "Sekola Menengan Pertama",
      company: "Islam Fatahillah",
      experienceTime: "2011 - 2014",
      description: "Kemudian jenjang pendidikan SMP saya dimulai di yayasan SMP Islam Fatahillah di daerah Krukut"
    ),
    ResumeModel(
      role: "Teknik Komputer & Jaringan",
      company: "SMK YP IPPI Petojo",
      experienceTime: "2015 - 2018",
      description: "Pada jenjang pendidikan SMK saya mengambil program studi Teknik Komputer Jaringan dan networking"
    )
  ];

  final List<ResumeModel> _experiences = [
    ResumeModel(
      role: "Teknisi Magang",
      company: "PT Telkom Indihome",
      experienceTime: "Juli - September 2017",
      description: "- Input & Check data EQN\n- Manajemen Kabel Jumper Saluran Telepon"
    ),
    ResumeModel(
      role: "Security Engineer Magang",
      company: "Microsec Neptus Technology",
      experienceTime: "2018 - 2019",
      description: "- Mengamankan Website & Database dari Malicious Attack dengan WAF Imperva\n- Deploying & Implementasi Cloud WAF Incapsula di Bank Mandiri & WAF Imperva di Bank BNI"
    ),
    ResumeModel(
      role: "Fullstack Developer",
      company: "Diginova Kreasi Indonesia",
      experienceTime: "2019 - 2020",
      description: "- Membangun Aplikasi Web dengan Laravel\n- Membuat RestfullAPI dengan Laravel & Lumen\n- Membuat Mobile Applications dengan Flutter & Dart"
    ),
    ResumeModel(
      role: "Remote Mobile Developer",
      company: "PT Mumtaz Teknologi Indonesia",
      experienceTime: "2020 - Sekarang",
      description: "- Membuat aplikasi Android & iOS dibidang pendidikan untuk sekolah-sekolah di Indonesia\n- Membuat aplikasi kantin untuk sekolah yang terintegrasi dengan NFC dan QRCode\n- Maintenance, fix bug maupun mengembangkan fitur baru"
    ),
    ResumeModel(
      role: "Remote Mobile Developer",
      company: "PT Ide Jualan Creative",
      experienceTime: "2020 - Sekarang",
      description: "- Membuat aplikasi E-Commerce B2B untuk Reseller dan Supplier untuk platform Android & iOS\n- Maintenance, fix bug maupun mengembangkan fitur baru"
    ),
    ResumeModel(
      role: "Mobile Programmer",
      company: "GenPI.co",
      experienceTime: "2020 - Sekarang",
      description: "- Mengimplementasikan desain UI/UX ke bentuk aplikasi mobile\n- Membuat Mobile Applications dengan Flutter & Dart dengan platform Android & iOS untuk produk dari perusahaan\n- Maintenance, fix bug maupun mengembangkan fitur baru"
    ),
    ResumeModel(
      role: "Mobile Freelance Developer",
      company: "",
      experienceTime: "2019 - Sekarang",
      description: "- Mengimplementasikan desain UI/UX ke bentuk aplikasi mobile\n- Membuat Mobile Applications dengan Flutter & Dart dengan platform Android & iOS sesuai permintaan client"
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
            iconPath: "$iconAsset/icon_work.svg",
            title: "My Resume",
          ),
          const SizedBox(height: 20),
          _resumeWidget()
        ],
      ),
    );
  }

  Widget _resumeWidget() {
    if (Responsive.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _educationalWidget(),
          const SizedBox(height: 30),
          _experienceWidget(),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _educationalWidget()),
        const SizedBox(width: 30),
        Expanded(child: _experienceWidget())
      ],
    );
  }

  Widget _educationalWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Education",
          style: styleTitle.copyWith(
            fontSize: 30,
            fontFamily: secondaryFontName
          ),
        ),
        const SizedBox(height: 30),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _educationals.length,
          itemBuilder: (context, index) {
            
            final _resume = _educationals[index];
            return ResumeItem(
              resume: _resume,
              isEnd: index == _educationals.length-1,
              showLine: !Responsive.isMobile(context),
            );
          },
        )
      ],
    );
  }

  Widget _experienceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Experience",
          style: styleTitle.copyWith(
            fontSize: 30,
            fontFamily: secondaryFontName
          ),
        ),
        const SizedBox(height: 30),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _experiences.length,
          itemBuilder: (context, index) {
            
            final _resume = _experiences[index];
            return ResumeItem(
              resume: _resume,
              isEnd: index == _experiences.length-1,
              isLeft: true,
              showLine: !Responsive.isMobile(context),
            );
          },
        )
      ],
    );
  }
}