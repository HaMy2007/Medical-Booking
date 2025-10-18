import 'package:flutter/material.dart';
import 'widgets/appointment_list.dart';

class AppointmentListPage extends StatefulWidget {
  const AppointmentListPage({Key? key}) : super(key: key);

  @override
  State<AppointmentListPage> createState() => _AppointmentListPageState();
}

class _AppointmentListPageState extends State<AppointmentListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> appointments = [
    {
      "service": "Trám răng",
      "doctor": "Nguyễn Văn A",
      "date": "20/10/2025",
      "time": "09:00 - 09:30",
      "status": "confirmed",
    },
    {
      "service": "Lấy cao răng",
      "doctor": "Lê Thị B",
      "date": "21/10/2025",
      "time": "14:00 - 14:30",
      "status": "pending",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch hẹn của tôi"),
        centerTitle: true,
        backgroundColor: const Color(0xFF38B593),
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(text: "Sắp tới"),
            Tab(text: "Đã khám"),
            Tab(text: "Đã hủy"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AppointmentList(appointments: appointments),
          const Center(child: Text("Chưa có lịch đã khám")),
          const Center(child: Text("Chưa có lịch đã hủy")),
        ],
      ),
    );
  }
}
