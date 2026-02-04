import 'package:app1/page2.dart';
import 'package:flutter/material.dart';

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
        title: Text('App1', style: TextStyle(color: Colors.white)),
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
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(index.toString()),
                subtitle: Text('sub'),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: FittedBox(
                    child: Text('500', style: TextStyle(color: Colors.white)),
                  ),
                ),
                trailing: Icon(Icons.favorite),
              ),
            );
          },
        ),
      ),
    );
  }
}
