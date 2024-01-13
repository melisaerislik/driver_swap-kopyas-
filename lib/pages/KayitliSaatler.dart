import 'package:flutter/material.dart';

class KayitliSaatler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('DRİVER SWAP'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/logo.png'),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Tarih Bar
            Container(
              color: Colors.green[200],
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gün: 13 Ocak',
                    style: TextStyle(color: Colors.black87),
                  ),
                  Text(
                    'Ay: Ocak',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            // Kayıtlı Saatler
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Kayıtlı Saatler',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),

                  Text('09:00 - 10:00'),
                  Text('11:00 - 12:00'),
                  // ...
                ],
              ),
            ),
            // Müsait Saatler
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Müsait Saatler',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  // Burada müsait saatler listelenebilir
                  // Örnek olarak:
                  Text('14:00 - 15:00'),
                  Text('16:00 - 17:00'),
                  // ...
                ],
              ),
            ),
            // Rotalar
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Örnek olarak 10 rota ekledim
                itemBuilder: (context, index) {
                  return const Card(
                    child: ListTile(
                      title: Text('Bursa İlçe '),
                      subtitle: Text('Saat: 10:00 - 20:00'),

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
