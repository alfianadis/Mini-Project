import 'package:flutter/material.dart';
import 'package:summitrent_miniproject/components/components.dart';
import 'package:summitrent_miniproject/service/product_service.dart';

class DetailProduct extends StatefulWidget {
  final String productID;
  const DetailProduct({Key? key, required this.productID}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
// Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Watch'),
//       ),
//       body: FutureBuilder(
//         future: ProductService().getDetailWatch(widget.productId),
//         builder: (context, snapshot) {
//           print(snapshot.data?.id);
//           if (snapshot.hasData) {
//             var val = snapshot.data;
//             return SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Image.network(
//                     val?.image ?? "",
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(val?.productName ?? ""),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(val?.harga ?? ""),
//                   ),
//                 ],
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 snapshot.error.toString(),
//               ),
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator.adaptive(),
//           );
//         },
//       ),
//     );
//   }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: ProductService().getListBestProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView.builder(
                          // itemCount: data?.products.length,
                          itemBuilder: (context, index) {
                        var val = data?.products[index];
                        Text(
                          val?.productName ?? "-",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        );

                        const SizedBox(height: 28);
                        // image
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            val?.image ?? "-",
                            fit: BoxFit.fitHeight,
                          ),
                        );
                        const SizedBox(height: 16);
                      }),
                    )
                  ],
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
