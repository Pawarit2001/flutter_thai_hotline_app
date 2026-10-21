import 'package:flutter/material.dart';

class AboutMeUi extends StatelessWidget {
  const AboutMeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ผู้จัดทำ THAILAND'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.blueGrey, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              
              // การ์ดแสดงข้อมูลส่วนตัว
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      _buildInfoRow(Icons.badge, 'รหัสนักศึกษา', 'S6719M10009'),
                      const Divider(height: 20),
                      _buildInfoRow(Icons.person_outline, 'ชื่อ - สกุล', 'นาย ปวฤทธิ์ บูโฮม'),
                      const Divider(height: 20),
                      _buildInfoRow(Icons.email_outlined, 'อีเมล', 'iq_pwr2001@email.com'),
                      const Divider(height: 20),
                      _buildInfoRow(Icons.school_outlined, 'สาขาวิชา', 'วิศวกรรมคอมพิวเตอร์'),
                      const Divider(height: 20),
                      _buildInfoRow(Icons.apartment, 'คณะ', 'วิศวกรรมศาสตร์'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget ช่วยจัดรูปแบบแถวข้อมูลให้เป็นระเบียบ
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueGrey),
        const SizedBox(width: 15),
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}