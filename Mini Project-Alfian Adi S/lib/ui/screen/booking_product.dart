import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:summitrent_miniproject/components/components.dart';
import 'package:summitrent_miniproject/ui/ui.dart';
import 'package:summitrent_miniproject/service/product_service.dart';

class BookingProductScreen extends StatefulWidget {
  final String productID;

  const BookingProductScreen({Key? key, required this.productID})
      : super(key: key);

  @override
  State<BookingProductScreen> createState() => _BookingProductScreenState();
}

class _BookingProductScreenState extends State<BookingProductScreen> {
  PaymentMethodModel paymentMethod = Data.payments.first;
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(days: 3));

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  String convertDateTime(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder(
                future: ProductService().getProductWatch(widget.productID),
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
                              const Text(
                                'Booking',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 28),
                              AspectRatio(
                                aspectRatio: 2.31 / 1,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorPath.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Image.network(
                                          val?.image ?? "=",
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          val?.productName ?? "=",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          'Nama',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        TextField(
                                          controller: _nameController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 4,
                                            ),
                                            filled: true,
                                            fillColor: ColorPath.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                          'Phone',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        TextField(
                                          controller: _phoneController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 4,
                                            ),
                                            filled: true,
                                            fillColor: ColorPath.white,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // address
                              const Text(
                                'Address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              TextField(
                                controller: _addressController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  ),
                                  filled: true,
                                  fillColor: ColorPath.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const Text(
                                'Waktu Penyewaan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        DateTime? dateTime =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: startTime,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2025),
                                        );

                                        // update start time
                                        if (dateTime != null) {
                                          setState(() {
                                            startTime = dateTime;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: ColorPath.white,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetPath.icCalendar,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  const Text(
                                                    'Mulai',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    convertDateTime(startTime),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        DateTime? dateTime =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: endTime,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2025),
                                        );

                                        // update end time
                                        if (dateTime != null) {
                                          setState(() {
                                            endTime = dateTime;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: ColorPath.white,
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AssetPath.icCalendar,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  const Text(
                                                    'Selesai',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    convertDateTime(endTime),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // payment method
                              const Text(
                                'Payment Method',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              ...List.generate(
                                Data.payments.length,
                                (index) => Container(
                                  margin:
                                      EdgeInsets.only(top: index == 0 ? 0 : 16),
                                  child: CardPaymentMethod(
                                    paymentMethod: Data.payments[index],
                                    isSelected:
                                        paymentMethod == Data.payments[index],
                                    onTap: () {
                                      // change payment method
                                      setState(() {
                                        paymentMethod = Data.payments[index];
                                      });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
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
                              DateTime bookingDate = startTime;
                              DateTime endDate = endTime;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => OnlineProductScreen(
                                          productID: val?.id.toString() ?? "",
                                          name: _nameController.text,
                                          phone: _phoneController.text,
                                          address: _addressController.text,
                                          bookingDateTime: bookingDate,
                                          bookingEndDateTime: endDate,
                                        )),
                              );
                            },
                            text: 'Book Now',
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
