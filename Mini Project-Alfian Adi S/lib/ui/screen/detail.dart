import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';
import 'package:summitrent_miniproject/service/product_service.dart';
import 'package:summitrent_miniproject/ui/ui.dart';

class Detail_Screen extends StatefulWidget {
  final String productID;
  const Detail_Screen({Key? key, required this.productID}) : super(key: key);

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
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
                  return ListView(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Detail Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 28),
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          val?.image ?? "-",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              val?.productName ?? "-",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: val?.harga ?? "-",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: ColorPath.red,
                                ),
                                children: const [
                                  TextSpan(
                                    text: '/Hari',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorPath.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Deskripsi',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorPath.primary,
                              ),
                            ),
                            // const SizedBox(height: 8),
                            Text(
                              val?.description ?? "-",
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Spesifikasi',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorPath.primary,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              val?.spesifikasi ?? "-",
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        color: ColorPath.primary,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Harga',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: ColorPath.white,
                                    ),
                                  ),
                                  Text(
                                    val?.harga ?? "-",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ColorPath.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BookingProductScreen(
                                      productID: val?.id.toString() ?? "",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: ColorPath.white,
                                ),
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: ColorPath.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorPath.white,
                            ),
                            child: Image.asset(
                              AssetPath.icArrow,
                              width: 12,
                              height: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error.toString(),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
