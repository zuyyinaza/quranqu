import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranqu/data/model/surah_model.dart';
import '../../data/dummy/ayat_dummy.dart';
import '../../core/constant/color_constant.dart';

class SurahDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text("Al-Fatihah",
            style: GoogleFonts.poppins(
                color: primary, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: second),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: second),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _surahHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: ayatList.length,
                itemBuilder: (context, index) {
                  final ayat = ayatList[index];
                  return _ayatCard(
                    ayatNumber: ayat["ayatNumber"]!,
                    arabicText: ayat["arabicText"]!,
                    translation: ayat["translation"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _surahHeader() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0,
                .6,
                1
              ],
              colors: [
                Color(0xFFDF98FA),
                Color(0xFFB070FD),
                Color(0xFF9055FF)
              ])),
      child: Column(
        children: [
          Text(
            "Al-Fatihah",
            style: GoogleFonts.poppins(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Text(
            "Pembukaan",
            style: GoogleFonts.poppins(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          Divider(
            color: Colors.white.withOpacity(.35),
            thickness: 1,
            height: 32,
          ),
          Text(
            "MEKAH - 7 AYAT",
            style: GoogleFonts.poppins(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 32),
          SvgPicture.asset(
            'asset/svg/bismillah.svg',
          ),
        ],
      ),
    );
  }

  Widget _ayatCard({
    required String ayatNumber,
    required String arabicText,
    required String translation,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: primary,
                  child: Text(ayatNumber,
                      style: GoogleFonts.poppins(color: Colors.white)),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.share, color: primary),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.play_arrow, color: primary),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.bookmark_border, color: primary),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              arabicText,
              style: GoogleFonts.amiri(
                  fontSize: 18, color: Colors.black, height: 3),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 8),
            Text(
              translation,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
