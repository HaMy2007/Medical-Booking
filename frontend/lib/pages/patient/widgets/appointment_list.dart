import 'package:flutter/material.dart';
import '../appointment_detail_page.dart';

class AppointmentList extends StatelessWidget {
  final List<Map<String, dynamic>> appointments;

  const AppointmentList({Key? key, required this.appointments}) : super(key: key);

  Color _getStatusColor(String status) {
    switch (status) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'confirmed':
        return 'Đã xác nhận';
      case 'pending':
        return 'Chờ xác nhận';
      case 'cancelled':
        return 'Đã hủy';
      default:
        return 'Không rõ';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return const Center(child: Text("Chưa có lịch hẹn nào"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final item = appointments[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: const Icon(Icons.medical_services_outlined, color: Colors.green),
            title: Text(
              item['service'],
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bác sĩ: ${item['doctor']}"),
                Text("Ngày: ${item['date']} | ${item['time']}"),
                Text(
                  _getStatusText(item['status']),
                  style: TextStyle(
                    color: _getStatusColor(item['status']),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              // TODO: chuyển sang trang chi tiết lịch hẹn
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDetailPage(appointment: item),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
