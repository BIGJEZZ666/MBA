import 'package:flutter/material.dart';

class MyPage2 extends StatefulWidget {
  const MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final moneyController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รายการ',
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: moneyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'จำนวนเงิน',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final title = titleController.text;
          final money = moneyController.text;
          print('$title : $money');
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
