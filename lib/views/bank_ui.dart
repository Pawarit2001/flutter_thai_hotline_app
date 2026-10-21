import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/about_me_ui.dart';
import '../models/hotline_model.dart';
import 'travel_ui.dart';
import 'emg_ui.dart';
import 'pub_ui.dart';

class BankUi extends StatefulWidget {
  const BankUi({super.key});

  @override
  State<BankUi> createState() => _BankUiState();
}

class _BankUiState extends State<BankUi> {
  final int _currentIndex = 2;
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

  final List<HotlineModel> bankData = [
    HotlineModel(
      title: 'ธนาคารกรุงเทพ',
      phone: '1333',
      imagePath: 'assets/images/bank/bank_1.png',
    ),
    HotlineModel(
      title: 'ธนาคารออมสิน',
      phone: '1115',
      imagePath: 'assets/images/bank/bank_2.png',
    ),
    HotlineModel(
      title: 'ธนาคารกสิกรไทย',
      phone: '02 888 8888',
      imagePath: 'assets/images/bank/bank_3.png',
    ),
    HotlineModel(
      title: 'ธนาคารกรุงไทย',
      phone: '02 111 1111',
      imagePath: 'assets/images/bank/bank_4.png',
    ),
    HotlineModel(
      title: 'ธนาคารกรุงศรีอยุธยา',
      phone: '1572',
      imagePath: 'assets/images/bank/bank_5.png',
    ),
    HotlineModel(
      title: 'ธนาคารทหารไทยธนชาต (ttb)',
      phone: '1428',
      imagePath: 'assets/images/bank/bank_6.png',
    ),
    HotlineModel(
      title: 'ธนาคารซิตี้แบงก์',
      phone: '1588',
      imagePath: 'assets/images/bank/bank_7.png',
    ),
    HotlineModel(
      title: 'ธนาคารเกียรตินาคินภัทร',
      phone: '02 165 5555',
      imagePath: 'assets/images/bank/bank_8.png',
    ),
    HotlineModel(
      title: 'ธนาคารไทยพาณิชย์',
      phone: '02 777 7777',
      imagePath: 'assets/images/bank/bank_9.png',
    ),
    HotlineModel(
      title: 'ธนาคารยูโอบี',
      phone: '02 285 1555',
      imagePath: 'assets/images/bank/bank_10.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายด่วน ธนาคาร'),
        centerTitle: true,
        backgroundColor: Colors.green,
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
              height: 140,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/bank/bank_0.png',
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
                itemCount: bankData.length,
                itemBuilder: (context, index) {
                  final item = bankData[index];
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
                            return const Icon(Icons.account_balance, color: Colors.green);
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