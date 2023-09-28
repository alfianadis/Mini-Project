import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';
import 'package:summitrent_miniproject/ui/ui.dart';
import 'package:intl/intl.dart';

class NewHalaman extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final DateTime bookingDateTime;
  final DateTime bookingEndDateTime;

  // final DateTime selectedDate;

  const NewHalaman(
      {Key? key,
      required this.name,
      required this.phone,
      required this.address,
      required this.bookingDateTime,
      required this.bookingEndDateTime

      // required this.selectedDate
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM yyyy').format(bookingDateTime);
    final formattedEndDate =
        DateFormat('dd MMMM yyyy').format(bookingEndDateTime);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  // title
                  const Text(
                    'Order Success',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 28),

                  // card product
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: ColorPath.grey,
                      ),
                      color: ColorPath.white,
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/product_1.png',
                            height: 80,
                            width: 80,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // title
                                const Text(
                                  'Merek',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // price
                                RichText(
                                  text: const TextSpan(
                                    text: 'Harga',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: ColorPath.primary,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '/Hari',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: ColorPath.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // details
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: ColorPath.grey,
                      ),
                      color: ColorPath.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorPath.primary,
                          ),
                        ),
                        const Divider(height: 16),
                        const SizedBox(height: 8),
                        const Text(
                          'Name',
                          style: TextStyle(
                            color: ColorPath.grey,
                          ),
                        ),
                        Text('$name'),
                        const SizedBox(height: 8),
                        const Text(
                          'Alamat',
                          style: TextStyle(
                            color: ColorPath.grey,
                          ),
                        ),
                        Text('$address'),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Phone',
                                    style: TextStyle(
                                      color: ColorPath.grey,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Text('$phone'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: const [
                                  Text(
                                    'Metode Pembayaran',
                                    style: TextStyle(
                                      color: ColorPath.grey,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Text('E-Wallet'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tanggal Penyewaan',
                          style: TextStyle(
                            color: ColorPath.grey,
                          ),
                        ),
                        Text('$formattedDate - $formattedEndDate '),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // payment details
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: ColorPath.grey,
                      ),
                      color: ColorPath.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Payment Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ColorPath.primary,
                          ),
                        ),
                        const Divider(height: 16),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                              child: Text('Harga Product'),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'IDR. 135.000',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorPath.primary,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Expanded(
                              child: Text('Ongkir'),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'IDR. 10.000',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorPath.primary,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'TOTAL',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'IDR. 145.000',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorPath.primary,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 12,
              ),
              child: Button(
                onTap: () {
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   RouteName.home,
                  //   (route) => false,
                  // );
                },
                text: 'Back to home',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
