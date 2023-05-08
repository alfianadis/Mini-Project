import 'package:flutter/material.dart';
import 'package:mini_project/components/components.dart';
import 'package:mini_project/service/product_service.dart';
import 'package:mini_project/ui/ui.dart';
import 'package:intl/intl.dart';

class OnlineProductScreen extends StatelessWidget {
  final String productID;
  final String name;
  final String phone;
  final String address;
  final DateTime bookingDateTime;
  final DateTime bookingEndDateTime;

  const OnlineProductScreen(
      {Key? key,
      required this.productID,
      required this.name,
      required this.phone,
      required this.address,
      required this.bookingDateTime,
      required this.bookingEndDateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM yyyy').format(bookingDateTime);
    final formattedEndDate =
        DateFormat('dd MMMM yyyy').format(bookingEndDateTime);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ProductService().getProductWatch(productID),
          builder: (BuildContext context, snapshot) {
            print(snapshot.data?.id);
            if (snapshot.hasData) {
              final val = snapshot.data;
              return Column(
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
                                  Image.network(
                                    val?.image ?? "=",
                                    height: 80,
                                    width: 80,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        // title
                                        Text(
                                          val?.productName ?? "=",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // price
                                        RichText(
                                          text: TextSpan(
                                            text: val?.harga ?? "=",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: ColorPath.primary,
                                            ),
                                            children: const [
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
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
                                Text('$formattedDate - $formattedEndDate'),
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
                                const SizedBox(height: 16),
                                Row(
                                  children: [
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
                                      val?.harga ?? "=",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(),
                            ),
                          );
                        },
                        text: 'Back to home',
                      ),
                    ),
                  ]);
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
