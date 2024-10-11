import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_task/core/routing/app_router.dart';
import 'package:products_task/features/product/data/models/product_model.dart';
import 'package:products_task/features/product/presentation/bloc/product_bloc.dart';
import 'package:products_task/features/product/presentation/bloc/product_states.dart';
import 'package:products_task/features/product/presentation/widgets/custom_card.dart';

import 'bloc/product_event.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProductBloc>(context).add(FetchProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Latest Products',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraint.maxWidth * .019,
              ),
              child: BlocBuilder<ProductBloc, ProductStates>(
                builder: (context, state) {
                  if (state is ProductLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProductLoadedState) {
                    List<ProductModel> products = state.products;

                    return products.isNotEmpty
                        ? GridView.builder(
                            itemCount: products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5 / 2,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, AppRouteName.productDetails,arguments: products[index]);
                                },
                                child: CustomProductCard(
                                  width: constraint.maxWidth * .4275,
                                  height: constraint.maxHeight * .2257,
                                  productModel: products[index],
                                ),
                              );
                            },
                          )
                        : const Center(child: Text('No data available'));
                  }
                  if (state is ProductErrorState) {
                    print('Error: ${state.errorMessage}');
                    return Center(
                      child: Text('Failed to load data: ${state.errorMessage}'),
                    );
                  }
                  return const Center(child: Text('Something went wrong.'));
                },
              ),
            );
          },
        ));
  }
}
