import 'package:flutter/material.dart';

import '../data/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 1 * MediaQuery.of(context).size.width,
                height: .46 * MediaQuery.of(context).size.height,
                decoration:  BoxDecoration(image: DecorationImage(image: NetworkImage(productModel?.image??''),),),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: .048 * MediaQuery.of(context).size.width,
                  top: .022 * MediaQuery.of(context).size.height,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left:.048*MediaQuery.of(context).size.width,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: .022 * MediaQuery.of(context).size.height,
                      bottom: .013 * MediaQuery.of(context).size.height),
                  child:  Text(
                    productModel?.title??'',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                 Text(
                  'Rs.  ${productModel?.price.toString()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffDB3022),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: .022*MediaQuery.of(context).size.height,bottom: .0045*MediaQuery.of(context).size.height,),
                  child: const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                 Text(
                  productModel?.description??'',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff505050),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
