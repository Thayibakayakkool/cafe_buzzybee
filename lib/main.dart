import 'package:cafe_buzzybee/src/core/services/injection/injection_container.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/bloc/cart_bloc.dart';
import 'package:cafe_buzzybee/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionContainer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartBloc>()..add(GetCartItemsEvent()),
      child: const MaterialApp(
        title: 'Cafe BuzzyBee',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
