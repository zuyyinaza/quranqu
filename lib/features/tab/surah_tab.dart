import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranqu/core/constant/color_constant.dart';
import 'package:quranqu/data/model/surah_model.dart';
import '../../data/dummy/surah_dummy.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: surahList.length,
      itemBuilder: (context, index) {
        return _surahItem(surah: surahList[index], context: context);
      },
    );
  }

  Widget _surahItem(
          {required SurahModel surah, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Get.toNamed('/surah_detail', arguments: surah.id);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              // Bagian nomor surah dengan icon
              Stack(
                children: [
                  SvgPicture.asset('asset/svg/nomor-surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                        child: Text(
                      "${surah.id}",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )),
                  )
                ],
              ),
              const SizedBox(width: 16),

              // Expanded untuk teks Latin dan informasi ayat
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama surah Latin
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            surah.nama,
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        // Nama surah Arab di sebelah kanan
                        Text(
                          surah.name,
                          style: GoogleFonts.amiri(
                              color: primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Informasi tempat turunnya surah dan jumlah ayat
                    Row(
                      children: [
                        Text(
                          surah.place,
                          style: GoogleFonts.poppins(
                              color: second,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: text),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${surah.ayahCount} Ayat",
                          style: GoogleFonts.poppins(
                              color: second,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
