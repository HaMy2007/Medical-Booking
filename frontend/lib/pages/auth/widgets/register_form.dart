import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  void _register() {
    if (_phoneController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Đăng ký thành công")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        TextField(
          controller: _phoneController,
          decoration: InputDecoration(
            labelText: 'Số điện thoại',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Mật khẩu',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: _register,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF49C68E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Đăng ký",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text.rich(
          TextSpan(
            text: "Bằng việc tiếp tục, bạn đã chấp nhận ",
            children: [
              TextSpan(
                text: "điều khoản sử dụng",
                style: TextStyle(
                  color: Colors.blueAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }
}
