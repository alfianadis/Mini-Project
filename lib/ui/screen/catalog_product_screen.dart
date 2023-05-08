import 'package:flutter/material.dart';
import 'package:mini_project/ui/ui.dart';
import 'package:mini_project/components/components.dart';
import 'package:mini_project/service/product_service.dart';

class CatalogProductScreen extends StatelessWidget {
  const CatalogProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text(
                'SummitRent Catalog',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              FutureBuilder(
                  future: ProductService().getListBestProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3 / 4,
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: data?.products.length,
                          itemBuilder: (context, index) {
                            var val = data?.products[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Detail_Screen(
                                      productID: val?.id.toString() ?? "",
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        val?.image ?? "-",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Text(
                                      val?.productName ?? "-",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                      text: TextSpan(
                                          text: val?.harga ?? "-",
                                          style: const TextStyle(
                                            fontSize: 16,
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
                                                ))
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return const CircularProgressIndicator();
                  })
            ],
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
      )),
    );
  }
}
