import 'package:aries/aries.dart';
import 'package:flutter/material.dart';
import 'package:religion_calendar_app/src/modules/explore_page/widgets/widgets.dart';

class ReligionLocationTab extends StatelessWidget {
  const ReligionLocationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AriesColor.yellowP50,
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.sp12,
          Text(
            'Nhà thờ gần tôi',
            style: AriesTextStyles.textHeading5,
          ),
          Spacing.sp16,
          TitleWithLines(
            text: "Giáo hạt Biên Hòa",
            lineColor: AriesColor.neutral100,
            textStyle: AriesTextStyles.textBodySmall.copyWith(
              color: AriesColor.neutral100,
            ),
          ),
          Spacing.sp8,
          ReligionLocationCard(
            title: "Nhà thờ Hóa An",
            location: "Hoàng Minh Chánh, Hoà An, TP. Biên Hòa, Đồng Nai",
            prayTime: "06:00, 18:00",
            img:
                'https://giothanhle.net/wp-content/uploads/2024/08/Nha-Tho-Giao-Xu-Hoa-An-3D-1170x785.jpg',
          ),
          Spacing.sp16,
          ReligionLocationCard(
            title: "Nhà thờ Thuận Hòa",
            location:
                "KP. 5, Đường Nguyễn Ái Quốc, P. Tân Phong, TP. Biên Hòa, Đồng Nai",
            prayTime: "05:00, 06:45, 08:15, 17:00",
            img:
                "https://giothanhle.net/wp-content/uploads/2024/08/Nha-Tho-Giao-Xu-Thuan-Hoa-Bien-Hoa-Dong-Nai-1170x785.webp",
          ),
          Spacing.sp16,
          ReligionLocationCard(
            title: "Nhà Thờ Thái Hiệp",
            location: "94/16 KP. 8, P. Tân Phong, TP. Biên Hòa, Đồng Nai",
            prayTime: "04:30, 06:30, 15:00, 16:30, 18:30",
            img:
                "https://giothanhle.net/wp-content/uploads/2024/08/Nha-Tho-Giao-Xu-Thai-Hiep-1170x772.webp",
          ),
          Spacing.sp16,
          ReligionLocationCard(
            title: "Nhà Thờ Thái An",
            location:
                "Kp. 2, Bùi Trọng Nghĩa, Trảng Dài, TP. Biên Hòa, Đồng Nai",
            prayTime: "05:00, 07:00, 16:00, 17:30, 19:00",
            img:
                "https://giothanhle.net/wp-content/uploads/2024/08/Nha-Tho-Giao-Xu-Thai-An-810x785.webp",
          ),
          Spacing.sp16,
          TitleWithLines(
            text: "Giáo hạt An Bình (Trảng Bom)",
            lineColor: AriesColor.neutral100,
            textStyle: AriesTextStyles.textBodySmall.copyWith(
              color: AriesColor.neutral100,
            ),
          ),
          Spacing.sp8,
          ReligionLocationCard(
            title: "Nhà thờ Thanh Bình",
            location:
                "Đường 20, QL1A, Ấp Bàu xéo, Xã Hưng Thịnh, Trảng Bom, Đồng Nai",
            prayTime: "04:30, 07:00, 17:00",
            img:
                "https://giothanhle.net/wp-content/uploads/2023/06/01-Giao-Phan-XuanLoc-ThanhBinh-00-8.jpg",
          ),
          Spacing.sp16,
          ReligionLocationCard(
            title: "Nhà thờ Tâm Hòa",
            location: "Ấp Hòa Bình, Xã Đông Hoà, Trảng Bom, Đồng Nai",
            prayTime: "04:30, 07:00, 17:00",
            img: "https://giothanhle.net/wp-content/uploads/2023/06/tamhoa.jpg",
          ),
          Spacing.sp16,
          ReligionLocationCard(
            title: "Nhà thờ Tâm An (Trảng Bom, Ðồng Nai)",
            location: "QL1A, Ấp An Bình, Xã Trung Hòa, Trảng Bàng, Đồng Nai",
            prayTime: "04:15, 06:15, 08:00, 17:00, 19:00",
            img:
                "https://giothanhle.net/wp-content/uploads/2023/05/00-TamAn-1.jpg",
          ),
          Spacing.sp16,
        ],
      )),
    );
  }
}
