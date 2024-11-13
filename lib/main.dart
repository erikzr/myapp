import 'package:flutter/material.dart';
import 'screens/banking_home_screen.dart';
import 'screens/halaman_transfer.dart';
import 'screens/riwayat.dart';  // Jika RiwayatPage ada di file riwayat.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const BankingHomeScreen(),
        '/transfer': (context) => const HalamanTransfer(),
        '/riwayat': (context) => const RiwayatPage(), // Tambahkan rute untuk halaman riwayat
      },
    );
  }
}