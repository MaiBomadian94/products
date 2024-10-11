import 'package:flutter/material.dart';
import 'package:products_task/features/product/data/models/product_model.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.productModel,
    this.width,
    this.height,
  });

  final ProductModel productModel;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productModel.image ?? ""),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: .048 * MediaQuery.of(context).size.width,
              top: .005 * MediaQuery.of(context).size.height,
              bottom: .025 * MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      productModel.title??'',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                   'Rs. ${ productModel.price.toString()}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffDB3022),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
