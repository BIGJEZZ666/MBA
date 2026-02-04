import 'package:app1/page2.dart';
import 'package:app1/transactionsModel.dart';
import 'package:app1/transactionsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App1", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPage2()),
              );
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, child) {
          final count = provider.transaction.length;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) {
                Transaction data = provider.transaction[index];
                return Card(
                  child: ListTile(
                    title: Text(data.title),
                    subtitle: Text(data.date.toString()),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red,
                      child: FittedBox(
                        child: Text(
                          data.money.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.favorite),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
