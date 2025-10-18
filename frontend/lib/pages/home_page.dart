import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thuctap/pages/patient/widgets/menu_button.dart';
import 'package:thuctap/pages/patient/widgets/news_card.dart';
import 'package:thuctap/pages/patient/widgets/rating_banner.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onRequireLogin;
  final VoidCallback onBookingTap;

  const HomePage({Key? key, required this.onRequireLogin, required this.onBookingTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final news = [
      "Bệnh viện Phụ Sản Hà Nội - Cơ sở 3 tổ chức thăm khám cho 160 nữ cán bộ thu...",
      "Miễn phí lên tới 10 triệu đồng khi thực hiện IVF tại Bệnh viện Phụ Sản Hà Nội",
      "Bệnh viện Phụ Sản Hà Nội là bệnh viện tuyến đầu trong ngành sản phụ khoa..."
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Xin chào",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                MenuButton(
                  icon: FontAwesomeIcons.userDoctor,
                  text: "Đặt lịch khám",
                  color: Colors.green,
                  onTap: onBookingTap,
                ),
                MenuButton(
                  icon: FontAwesomeIcons.fileMedical,
                  text: "Hồ sơ sức khỏe",
                  color: Colors.teal,
                  onTap: onRequireLogin,
                ),
                MenuButton(
                  icon: FontAwesomeIcons.ticket,
                  text: "Tra cứu số khám",
                  color: Colors.blue,
                  onTap: onRequireLogin,
                ),
                MenuButton(
                  icon: FontAwesomeIcons.comments,
                  text: "Giải đáp cùng chuyên gia",
                  color: Colors.orange,
                  onTap: onRequireLogin,
                ),
              ],
            ),
            const SizedBox(height: 20),
            RatingBanner(onPressed: onRequireLogin),
            const SizedBox(height: 20),
            const Text(
              "Tin tức",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...news.map((title) => NewsCard(title: title)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            "assets/doctor.png",
            fit: BoxFit.cover,
            height: 160,
            width: double.infinity,
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: ElevatedButton.icon(
              onPressed: onRequireLogin, // ✅ “Chi tiết” cũng yêu cầu đăng nhập
              icon: const Icon(Icons.arrow_forward, size: 18),
              label: const Text("Chi tiết"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
