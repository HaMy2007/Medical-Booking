import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String date;
  final String imagePath;
  final VoidCallback? onTap;

  const NewsCard({
    Key? key,
    required this.title,
    this.date = "02/10/2023",
    this.imagePath = "assets/news.png",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: onTap,
      ),
    );
  }
}
