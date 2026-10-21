import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/about_me_ui.dart';
import 'package:flutter_thai_hotline_app/views/travel_ui.dart';
import '../models/hotline_model.dart';
// ignore: duplicate_import
import 'travel_ui.dart';
import 'emg_ui.dart';
import 'bank_ui.dart';

class PubUi extends StatefulWidget {
  const PubUi({super.key});

  @override
  State<PubUi> createState() => _PubUiState();
}

class _PubUiState extends State<PubUi> {
  final int _currentIndex = 3; 
  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    Widget destination;
    if (index == 0) {
      destination = const TravelUi(); // ไปหน้าการเดินทาง
    } else if (index == 1) {
      destination = const EmgUi();    // ไปหน้าอุบัติเหตุ
    } else if (index == 2) {
      destination = const BankUi();   // ไปหน้าธนาคาร
    } else {
      destination = const PubUi();    // ไปหน้าสาธารณูปโภค
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  final List<HotlineModel> pubData = [
    HotlineModel(
      title: 'ไฟฟ้านครหลวง',
      phone: '1130',
      imagePath: 'assets/images/pubutil/pub_1.png',
    ),
    HotlineModel(
      title: 'ไฟฟ้าส่วนภูมิภาค',
      phone: '1129',
      imagePath: 'assets/images/pubutil/pub_2.png',
    ),
    HotlineModel(
      title: 'ไฟฟ้าฝ่ายผลิต',
      phone: '1416',
      imagePath: 'assets/images/pubutil/pub_3.png',
    ),
    HotlineModel(
      title: 'การประปานครหลวง',
      phone: '1125',
      imagePath: 'assets/images/pubutil/pub_4.png',
    ),
    HotlineModel(
      title: 'การประปาส่วนภูมิภาค',
      phone: '1662',
      imagePath: 'assets/images/pubutil/pub_5.png',
    ),
    HotlineModel(
      title: 'True',
      phone: '1242',
      imagePath: 'assets/images/pubutil/pub_6.png',
    ),
    HotlineModel(
      title: 'Dtac',
      phone: '1678',
      imagePath: 'assets/images/pubutil/pub_7.png',
    ),
    HotlineModel(
      title: 'AIS',
      phone: '1175',
      imagePath: 'assets/images/pubutil/pub_8.png',
    ),
    HotlineModel(
      title: 'TOT / NT',
      phone: '1100',
      imagePath: 'assets/images/pubutil/pub_9.png',
    ),
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายด่วน สาธารณูปโภค'),
        centerTitle: true,
        backgroundColor: Colors.orange,
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
                  'assets/images/pubutil/pub_0.png',
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
                itemCount: pubData.length,
                itemBuilder: (context, index) {
                  final item = pubData[index];
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