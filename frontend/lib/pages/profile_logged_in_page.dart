import 'package:flutter/material.dart';

class ProfileLoggedInPage extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfileLoggedInPage({Key? key, required this.onLogout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = {
      "name": "Nguyễn Văn A",
      "phone": "0905123456",
      "email": "abc@gmail.com",
      "gender": "Nam",
      "dob": "12/12/1998",
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
        centerTitle: true,
        backgroundColor: const Color(0xFF38B593),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF38B593),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user['name']!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(user['phone']!, style: const TextStyle(color: Colors.grey)),
                      Text(user['email']!, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            _buildMenuItem(Icons.medical_information, "Hồ sơ sức khỏe", onTap: () {}),
            _buildMenuItem(Icons.history, "Lịch sử khám", onTap: () {}),
            _buildMenuItem(Icons.settings, "Cập nhật thông tin", onTap: () {}),
            _buildMenuItem(Icons.logout, "Đăng xuất",
                color: Colors.redAccent, onTap: onLogout),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title,
      {Color color = Colors.black87, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
