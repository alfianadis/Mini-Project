import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';
import 'package:summitrent_miniproject/service/product_service.dart';
import 'package:summitrent_miniproject/ui/ui.dart';

class CatalogTab extends StatelessWidget {
  const CatalogTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'SummitRent Catalog',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
    );
  }
}
