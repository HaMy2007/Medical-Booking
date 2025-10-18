import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Xác nhận lịch hẹn",
      "message":
      "Lịch khám của bạn với bác sĩ Nguyễn Văn A vào 09:00 ngày 20/10 đã được xác nhận.",
      "time": "5 phút trước",
      "type": "appointment"
    },
    {
      "title": "Thông báo hệ thống",
      "message": "Hệ thống sẽ bảo trì từ 22:00 - 23:00 hôm nay. Vui lòng đặt lịch trước thời gian này.",
      "time": "1 giờ trước",
      "type": "system"
    },
    {
      "title": "Nhắc lịch khám",
      "message": "Bạn có lịch hẹn vào ngày mai lúc 09:00. Hãy đến sớm 10 phút để hoàn tất thủ tục.",
      "time": "Hôm qua",
      "type": "appointment"
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<Map<String, dynamic>> _filterByType(String? type) {
    if (type == null) return notifications;
    return notifications.where((n) => n['type'] == type).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF38B593),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Thông báo"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: "Tất cả"),
            Tab(text: "Hệ thống"),
            Tab(text: "Lịch hẹn"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNotificationList(_filterByType(null)),
          _buildNotificationList(_filterByType("system")),
          _buildNotificationList(_filterByType("appointment")),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          "Chưa có thông báo nào",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final n = items[index];
        return Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: n['type'] == 'system'
                  ? Colors.orange.shade100
                  : Colors.green.shade100,
              child: Icon(
                n['type'] == 'system' ? Icons.notifications : Icons.medical_services,
                color: n['type'] == 'system' ? Colors.orange : Colors.green,
                size: 26,
              ),
            ),
            title: Text(
              n['title'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    n['message'],
                    style: const TextStyle(color: Colors.black87, height: 1.3),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    n['time'],
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            onTap: () {
              // TODO: mở chi tiết thông báo hoặc navigate tới lịch hẹn
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Mở: ${n['title']}")),
              );
            },
          ),
        );
      },
    );
  }
}
