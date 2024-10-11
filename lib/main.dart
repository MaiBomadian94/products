import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_task/features/product/data/data_source/local.dart';
import 'package:products_task/features/product/data/repository/product_repository.dart';
import 'package:products_task/features/product/presentation/bloc/product_bloc.dart';
import 'core/routing/app_router.dart';
import 'core/routing/route_generator.dart';
import 'features/product/data/data_source/remote.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(
        ProductRepository(ProductServiceRemote(), LocalDataSource()),
        LocalDataSource(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: AppRouteName.home,
        onGenerateRoute: RoutesGenerator.generateRoute,
      ),
    );
  }
}
