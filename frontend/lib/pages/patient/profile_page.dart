import 'package:flutter/material.dart';
import 'package:thuctap/pages/auth/auth_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // --- Ảnh minh họa ---
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Image.asset(
                    'assets/login_bg.png',
                    width: size.width * 0.8,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            "Đăng nhập để đặt khám với các bác sĩ, chuyên gia",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthPage(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              color: Color(0xFF38B593),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // --- Hotline & phiên bản ---
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  const Divider(height: 40, thickness: 0.8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone, size: 18, color: Colors.black54),
                      SizedBox(width: 6),
                      Text(
                        "Hotline: ",
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                      Text(
                        "1900 638 367",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Phiên bản: 10.0.16 ",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        "Cập nhật",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 13,
                        ),
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
}
