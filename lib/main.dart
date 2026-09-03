import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Menghilangkan kata kunci 'const' karena UjiKoneksiPage adalah StatefulWidget
    return MaterialApp(
      home: UjiKoneksiPage(),
    );
  }
}

class UjiKoneksiPage extends StatefulWidget {
  const UjiKoneksiPage({super.key});

  @override
  State<UjiKoneksiPage> createState() => _UjiKoneksiPageState();
}

class _UjiKoneksiPageState extends State<UjiKoneksiPage> {
  @override
  void initState() {
    super.initState();
    ujiKoneksiServer(); // 2. Panggil fungsinya di sini
  }

  // 3. LETAKKAN KODE FUNGSI ANDA DI SINI
  void ujiKoneksiServer() async {
    var urlEndPoint = Uri.parse('https://reqres.in/api/users/2');

    try {
      var responsSistem = await http.get(urlEndPoint);

      if (responsSistem.statusCode == 200) {
        print("MANTAP! Aplikasi sukses terhubung ke server internet.");
        print("Data Mentah JSON: " + responsSistem.body);
      } else {
        print("KONEKSI GAGAL! Status Code: ${responsSistem.statusCode}");
      }
    } catch (e) {
      print("Terjadi kesalahan jaringan/sistem: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uji Koneksi API')),
      body: const Center(
        child: Text('Cek hasilnya di Debug Console VS Code!'),
      ), // Center
    ); // Scaffold
  }
}