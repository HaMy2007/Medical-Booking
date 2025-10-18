import 'package:flutter/material.dart';

class RatingBanner extends StatelessWidget {
  final VoidCallback onPressed;

  const RatingBanner({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_border, color: Colors.green),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              "Giúp chúng tôi đánh giá ứng dụng để cải thiện dịch vụ",
              style: TextStyle(color: Colors.black87),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
