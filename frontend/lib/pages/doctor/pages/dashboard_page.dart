import 'package:flutter/material.dart';

class DoctorDashboardPage extends StatelessWidget {
  const DoctorDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final formattedDate =
        "${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2, '0')}/${today.year}";

    // 🔹 Giả lập dữ liệu
    final doctorName = "Nguyễn Văn A";
    final stats = {
      "today": 8,
      "confirmed": 5,
      "pending": 2,
      "completed": 1,
    };

    final appointments = [
      {
        "patient": "Lê Thị B",
        "service": "Trám răng",
        "time": "09:00 - 09:30",
        "status": "confirmed",
      },
      {
        "patient": "Nguyễn Văn C",
        "service": "Lấy cao răng",
        "time": "10:00 - 10:30",
        "status": "pending",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Bảng điều khiển bác sĩ"),
        backgroundColor: const Color(0xFF38B593),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            Text(
              "Xin chào, BS. $doctorName 👋",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Hôm nay: $formattedDate",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // --- Stats cards ---
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatCard("📅 Lịch hôm nay", stats["today"].toString(), Colors.blue),
                _buildStatCard("✅ Đã xác nhận", stats["confirmed"].toString(), Colors.green),
                _buildStatCard("⏳ Chờ xác nhận", stats["pending"].toString(), Colors.orange),
                _buildStatCard("🩺 Đã khám", stats["completed"].toString(), Colors.teal),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              "Lịch hẹn hôm nay",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // --- Appointment list ---
            ...appointments.map((a) => _buildAppointmentCard(context, a)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value,
              style: TextStyle(
                  color: color, fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: color, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, Map<String, dynamic> a) {
    Color statusColor;
    String statusText;

    switch (a['status']) {
      case 'confirmed':
        statusColor = Colors.green;
        statusText = "Đã xác nhận";
        break;
      case 'pending':
        statusColor = Colors.orange;
        statusText = "Chờ xác nhận";
        break;
      case 'completed':
        statusColor = Colors.teal;
        statusText = "Đã khám";
        break;
      default:
        statusColor = Colors.grey;
        statusText = "Không rõ";
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF38B593),
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(a['patient'], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dịch vụ: ${a['service']}"),
            Text("Giờ: ${a['time']}"),
            const SizedBox(height: 4),
            Text(
              statusText,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          onPressed: () {
            // TODO: chuyển sang AppointmentDetailPage
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Mở chi tiết lịch hẹn của ${a['patient']}")),
            );
          },
        ),
      ),
    );
  }
}
