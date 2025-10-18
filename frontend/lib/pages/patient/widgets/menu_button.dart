import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTap;

  const MenuButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: (MediaQuery.of(context).size.width - 56) / 2,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.6)),
          color: color.withOpacity(0.05),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
