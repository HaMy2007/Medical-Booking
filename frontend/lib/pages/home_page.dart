import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thuctap/pages/patient/profile_page.dart';

import 'package:thuctap/pages/patient/widgets/menu_button.dart';
import 'package:thuctap/pages/patient/widgets/news_card.dart';
import 'package:thuctap/pages/patient/widgets/rating_banner.dart';
import 'package:thuctap/widgets/bottom_nav_bar.dart';
import 'package:thuctap/pages/auth/auth_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isLoggedIn = false;

  final List<String> news = [
    "Bệnh viện Phụ Sản Hà Nội - Cơ sở 3 tổ chức thăm khám cho 160 nữ cán bộ thu...",
    "Miễn phí lên tới 10 triệu đồng khi thực hiện IVF tại Bệnh viện Phụ Sản Hà Nội",
    "Bệnh viện Phụ Sản Hà Nội là bệnh viện tuyến đầu trong ngành sản phụ khoa..."
  ];

  void _onItemTapped(int index) {
    if (index == 1 && !isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AuthPage()),
      );
      return;
    } else if (index == 3 && !isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // --- AppBar ---
  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }

  // --- Body ---
  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderImage(),
          const SizedBox(height: 20),

          // --- Menu buttons ---
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              MenuButton(
                icon: FontAwesomeIcons.userDoctor,
                text: "Đặt lịch khám",
                color: Colors.green,
                onTap: () {},
              ),
              MenuButton(
                icon: FontAwesomeIcons.fileMedical,
                text: "Hồ sơ sức khỏe",
                color: Colors.teal,
                onTap: () {},
              ),
              MenuButton(
                icon: FontAwesomeIcons.ticket,
                text: "Tra cứu số khám",
                color: Colors.blue,
                onTap: () {},
              ),
              MenuButton(
                icon: FontAwesomeIcons.comments,
                text: "Giải đáp cùng chuyên gia",
                color: Colors.orange,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),

          // --- Rating banner ---
          RatingBanner(onPressed: () {}),
          const SizedBox(height: 20),

          // --- News section ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Tin tức",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Tất cả",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...news.map((title) => NewsCard(title: title)).toList(),
        ],
      ),
    );
  }

  // --- Header image section ---
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
              onPressed: () {},
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
