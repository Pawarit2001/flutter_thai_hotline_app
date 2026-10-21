import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/about_me_ui.dart';
import '../models/hotline_model.dart';
import 'emg_ui.dart';
import 'bank_ui.dart';
import 'pub_ui.dart';

class TravelUi extends StatefulWidget {
  const TravelUi({super.key});

  @override
  State<TravelUi> createState() => _TravelUiState();
}

class _TravelUiState extends State<TravelUi> {
  final int _currentIndex = 0;
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

  final List<HotlineModel> travelData = [
    HotlineModel(
      title: 'กรมทางหลวงชนบท',
      phone: '1146',
      imagePath: 'assets/images/travel/travel_1.png',
    ),
    HotlineModel(
      title: 'ตำรวจท่องเที่ยว',
      phone: '1155',
      imagePath: 'assets/images/travel/travel_2.png',
    ),
    HotlineModel(
      title: 'ตำรวจทางหลวง',
      phone: '1193',
      imagePath: 'assets/images/travel/travel_3.png',
    ),
    HotlineModel(
      title: 'ข้อมูลจราจร',
      phone: '1197',
      imagePath: 'assets/images/travel/travel_4.png',
    ),
    HotlineModel(
      title: 'ขสมก.',
      phone: '1348',
      imagePath: 'assets/images/travel/travel_5.png',
    ),
    HotlineModel(
      title: 'บขส.',
      phone: '1490',
      imagePath: 'assets/images/travel/travel_6.png',
    ),
    HotlineModel(
      title: 'เส้นทางบนทางด่วน',
      phone: '1543',
      imagePath: 'assets/images/travel/travel_7.png',
    ),
    HotlineModel(
      title: 'กรมทางหลวง',
      phone: '1586',
      imagePath: 'assets/images/travel/travel_8.png',
    ),
    HotlineModel(
      title: 'การรถไฟแห่งประเทศไทย',
      phone: '1690',
      imagePath: 'assets/images/travel/travel_9.png',
    ),
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายด่วน การเดินทาง'),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
              height: 120,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                        'assets/images/travel/travel_0.png',
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
                itemCount: travelData.length,
                itemBuilder: (context, index) {
                  final item = travelData[index];
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