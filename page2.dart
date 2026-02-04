import 'package:app1/transactionsModel.dart';
import 'package:app1/transactionsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPage2 extends StatefulWidget {
  const MyPage2({super.key});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  final formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final moneyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formkey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://images.thedirect.com/media/photos/alastor1.png",
              ),
              SizedBox(height: 10),
              Image.asset('assets/images/maxresdefault.jpg'),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "รายการ",
                ),
                controller: titleController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "ไอ้ควายลืมกรอกข้อมูล";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "จำนวนเงิน",
                ),
                controller: moneyController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "มึงลืมกรอกจำนวนเงินไอ้โง่!!";
                  }
                  if (double.parse(value) < 1) {
                    return "เก่งมาก";
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: () {}, child: Text("save")),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final title = titleController.text;
          final money = moneyController.text;
          if (formkey.currentState!.validate()) {
            Transaction transactions = Transaction(title, double.parse(money), DateTime.now());

            TransactionProvider provider = Provider.of<TransactionProvider>(context,listen: false);

            provider.addTransaction(transactions);
            
            Navigator.pop(context);
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
