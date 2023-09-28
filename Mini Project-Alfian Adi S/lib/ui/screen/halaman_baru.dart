import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';
import 'package:summitrent_miniproject/ui/ui.dart';
import 'package:intl/intl.dart';

class HalamanBaru extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final DateTime bookingDateTime;

  const HalamanBaru(
      {Key? key,
      required this.name,
      required this.phone,
      required this.address,
      required this.bookingDateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM yyyy').format(bookingDateTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Baru'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name, $phone, $address',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Text(
            'Tanggal dan waktu booking: $formattedDate',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
