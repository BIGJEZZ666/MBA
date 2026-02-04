import 'package:app1/home.dart';
import 'package:app1/transactionsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main ()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) {
        return TransactionProvider();
      },)
    ],
    child:
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
      ) ,
    );
  }
}