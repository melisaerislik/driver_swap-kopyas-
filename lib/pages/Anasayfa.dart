import 'package:driver_swap/Model/randevu_model.dart';
import 'package:driver_swap/Service/randevu_service.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> days = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma'];

  DateTime _selectedDate = DateTime.now();

  RandevuService randevuService = RandevuService();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.green[300], // Sarı renk

        title: const Center(child: Text('DRİWERSWAP')),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('lib/images/logo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Üst Banner
              Container(
                height: 50,
                color: Colors.green[200],
                child: const Center(
                  child: Text(
                    'Anasayfa',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              //takvim ve saat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Müsait Gün: \n${_selectedDate.toLocal()}'),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow[300]
                    ),
                    onPressed: () => _selectDate(context),
                    child: const Text('Tarih Seç'),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[200],
                ),
                onPressed: () async{
                  // Randevu ekleme
                  RandevuModel yeniRandevu = RandevuModel(
                    hatNo: "1/a",
                    zaman: _selectedDate, guzergah: '',
                  );
                  await randevuService.randevuEkle(yeniRandevu);
                },
                child: const Text('Randevu Oluştur'),
              ),
              // Kategoriler
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Günler',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.all(8),
                      color: Colors.green[300],
                      child: Center(
                        child: Text(
                          days[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Öne Çıkan Ürünler
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Hat ve Araçlar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              Column(
                children: [
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        List<String> saatBilgileri= [
                          'Sanayi 7.00\n'
                          'Hastane 8.30\n'
                          'Okul 9.15\n'
                          'Hastane 10.00\n'
                          'Sanayi 10.30\n'

                        ];
                        return Container(
                          width: 150,
                          height: 200,
                          margin: const EdgeInsets.all(8),
                          color: Colors.yellow[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Araç $index',
                                style: const TextStyle(color: Colors.black87),
                              ),
                              const SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: saatBilgileri.map((saat) {
                                  return Text(
                                    saat,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
