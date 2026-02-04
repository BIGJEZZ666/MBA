import 'package:app1/transactionsModel.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier{
  List<Transaction> transaction = [
    Transaction("อาหาร", 500, DateTime.now()),
    Transaction("อาหาร", 500, DateTime.now()),
    Transaction("อาหาร", 500, DateTime.now()),
    Transaction("อาหาร", 500, DateTime.now()),
    Transaction("อาหาร", 500, DateTime.now()),
  ] ;

  List<Transaction>getTransaction(){
    return transaction;
  }

  addTransaction(Transaction tran){
    transaction.insert(0,tran);
    notifyListeners();
  }
}