import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/about_me_ui.dart';
import '../models/hotline_model.dart';
import 'travel_ui.dart';
import 'bank_ui.dart';
import 'pub_ui.dart';

class EmgUi extends StatefulWidget {
  const EmgUi({super.key});

  @override
  State<EmgUi> createState() => _EmgUiState();
}

class _EmgUiState extends State<EmgUi> {
  final int _currentIndex = 1; 
  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    Widget destination;
    if (index == 0) {
      destination = const TravelUi();
    } else if (index == 1) {
      destination = const EmgUi();
    } else if (index == 2) {
      destination = const BankUi();
    } else {
      destination = const PubUi();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  final List<HotlineModel> emgData = [
    HotlineModel(
      title: 'เหตุด่วน-เหตุร้าย',
      phone: '191',
      imagePath: 'assets/images/emergency/emg_1.png',
    ),
    HotlineModel(
      title: 'แจ้งไฟไหม้-สัตว์เข้าบ้าน',
      phone: '199',
      imagePath: 'assets/images/emergency/emg_2.png',
    ),
    HotlineModel(
      title: 'สายด่วนกองปราบปราม',
      phone: '1192',
      imagePath: 'assets/images/emergency/emg_3.png',
    ),
    HotlineModel(
      title: 'อุบัติเหตุทางน้ำ',
      phone: '1196',
      imagePath: 'assets/images/emergency/emg_4.png',
    ),
    HotlineModel(
      title: 'แจ้งคนหาย',
      phone: '1300',
      imagePath: 'assets/images/emergency/emg_5.png',
    ),
    HotlineModel(
      title: 'ศูนย์ปลอดภัยคมนาคม',
      phone: '1356',
      imagePath: 'assets/images/emergency/emg_6.png',
    ),
    HotlineModel(
      title: 'หน่วยแพทย์กู้ชีพ',
      phone: '1554',
      imagePath: 'assets/images/emergency/emg_7.png',
    ),
    HotlineModel(
      title: 'ศูนย์ฉุกเฉินรามาธิบดี',
      phone: '1646',
      imagePath: 'assets/images/emergency/emg_8.png',
    ),
    HotlineModel(
      title: 'เจ็บป่วยฉุกเฉิน',
      phone: '1669',
      imagePath: 'assets/images/emergency/emg_9.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายด่วน อุบัติเหตุ-เหตุฉุกเฉิน'),
        centerTitle: true,
        backgroundColor: Colors.red,
        // ปุ่ม About มุมบนขวา
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutMeUi()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 140, // ปรับความสูงได้ตามต้องการ
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/emergency/emg_0.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: emgData.length,
                itemBuilder: (context, index) {
                  final item = emgData[index];
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item.imagePath,
                        width: 45,
                        height: 45,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.directions_car, color: Colors.blue);
                        },
                      ),
                ),
                      title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(item.phone),
                      trailing: const Icon(Icons.phone, color: Colors.green),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'อุบัติเหตุ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}