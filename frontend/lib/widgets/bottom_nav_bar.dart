import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,

      // --- Màu sắc ---
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,

      // --- Hiệu ứng phóng to chữ ---
      selectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),

      // --- Hiệu ứng phóng to icon ---
      selectedIconTheme: const IconThemeData(size: 28),
      unselectedIconTheme: const IconThemeData(size: 22),

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Trang chủ",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: "Lịch hẹn",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: "Thông báo",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Cá nhân",
        ),
      ],
    );
  }
}
