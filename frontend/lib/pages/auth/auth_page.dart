import 'package:flutter/material.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF49C68E),
      body: Stack(
        children: [
          // --- Ảnh minh họa ---
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF49C68E),
              child: Image.asset(
                'assets/login_bg.png',
                fit: BoxFit.contain,
                width: size.width,
              ),
            ),
          ),

          // --- Form bo góc trắng ---
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TabBar
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.green,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      unselectedLabelColor: Colors.black54,
                      tabs: const [
                        Tab(text: "Đăng nhập"),
                        Tab(text: "Đăng ký"),
                      ],
                    ),
                  ),

                  // TabBarView
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        LoginForm(),
                        RegisterForm(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
