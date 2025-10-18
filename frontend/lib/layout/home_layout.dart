import 'package:flutter/material.dart';
import 'package:thuctap/pages/home_page.dart';
import 'package:thuctap/pages/patient/profile_page.dart';
import 'package:thuctap/widgets/bottom_nav_bar.dart';
import 'package:thuctap/pages/auth/auth_page.dart';
import 'package:thuctap/pages/patient/booking_page.dart';
import 'package:thuctap/pages/patient/appointment_list_page.dart';
import 'package:thuctap/pages/profile_wrapper.dart';
import 'package:thuctap/pages/patient/notification_page.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;
  bool isLoggedIn = true;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      HomePage(onRequireLogin: _redirectToLogin, onBookingTap: _handleBookingTap,),
      AppointmentListPage(),
      NotificationPage(),
      const ProfileWrapper(),
    ]);
  }

  void _redirectToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  void _handleBookingTap() {
    if (!isLoggedIn) {
      _redirectToLogin();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BookingPage()),
      );
    }
  }

  void _onItemTapped(int index) {
    // Nếu chọn Lịch hẹn mà chưa login → chuyển sang AuthPage
    if (index == 1 && !isLoggedIn) {
      _redirectToLogin();
      return;
    }

    // Nếu chọn Cá nhân mà chưa login → hiển thị mời đăng nhập
    if (index == 3 && !isLoggedIn) {
      setState(() => _selectedIndex = 3);
      return;
    }

    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
