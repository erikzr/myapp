import 'package:flutter/material.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final List<Map<String, dynamic>> _transactions = [];

  @override
  void initState() {
    super.initState();
    _generateSampleTransactions();
  }

  void _generateSampleTransactions() {
    for (int i = 0; i < 50; i++) {
      _transactions.add({
        'waktu': '${16 + i}/10/2024 ${21 + i % 3}:${38 + i % 20}',
        'deskripsi': 'Dari: System',
        'nominal': i % 2 == 0 ? '+Rp ${(i * 100000.0).toStringAsFixed(2)}' : '-Rp ${(i * 50000.0).toStringAsFixed(2)}',
        'aksi': i % 2 == 0 ? 'Masuk' : 'Keluar',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Aksi ketika tombol settings ditekan
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final transaction = _transactions[index];
                return TransaksiItem(
                  waktu: transaction['waktu'],
                  deskripsi: transaction['deskripsi'],
                  nominal: transaction['nominal'],
                  aksi: transaction['aksi'],
                );
              },
            ),
          ),
          const Pagination(),
        ],
      ),
    );
  }
}

class TransaksiItem extends StatelessWidget {
  final String waktu;
  final String deskripsi;
  final String nominal;
  final String aksi;

  const TransaksiItem({super.key, 
    required this.waktu,
    required this.deskripsi,
    required this.nominal,
    required this.aksi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(waktu),
              const SizedBox(height: 4.0),
              Text(deskripsi),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                nominal,
                style: TextStyle(
                  color: nominal.startsWith('-') ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                aksi,
                style: TextStyle(
                  color: nominal.startsWith('-') ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pagination extends StatelessWidget {
  const Pagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // Aksi ketika tombol 1 ditekan
            },
            child: const Text('1'),
          ),
          const SizedBox(width: 8.0),
          TextButton(
            onPressed: () {
              // Aksi ketika tombol 2 ditekan
            },
            child: const Text('2'),
          ),
          const SizedBox(width: 8.0),
          TextButton(
            onPressed: () {
              // Aksi ketika tombol 3 ditekan
            },
            child: const Text('3'),
          ),
          const SizedBox(width: 8.0),
          TextButton(
            onPressed: () {
              // Aksi ketika tombol 4 ditekan
            },
            child: const Text('4'),
          ),
        ],
      ),
    );
  }
}