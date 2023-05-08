import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/components/components.dart';
import 'package:mini_project/ui/ui.dart';
import 'package:mini_project/service/product_service.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'SummitRent',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 16),

        //Search Product
        TextField(
          decoration: InputDecoration(
            hintText: 'Search Product',
            prefixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: ColorPath.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),

        const SizedBox(height: 20),

        //iklan slider

        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            aspectRatio: 2.39 / 1,
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: List.generate(
            Data.ads.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: CardAds(
                ads: Data.ads[index],
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        //kategori
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              children: List.generate(
                Data.categories.length,
                (index) => Container(
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 20),
                  child: CardCategory(
                    category: Data.categories[index],
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
        //product
        Row(
          children: [
            const Expanded(
              child: Text(
                'Best Rent Product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CatalogProductScreen(),
                  ),
                );
              },
              child: const Text(
                'See More',
                style: TextStyle(
                  color: ColorPath.primary,
                ),
              ),
            ),
          ],
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 4,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 4,
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
                  },
                );
              }
              return const CircularProgressIndicator();
            })
      ],
    );
  }
}
