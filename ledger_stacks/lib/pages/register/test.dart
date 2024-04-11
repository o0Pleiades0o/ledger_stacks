import 'package:flutter/material.dart';
import 'package:ledger_stacks/models/MyList/mylist.dart';
import 'package:ledger_stacks/models/mylist/mylist_transaction.dart'; // Import the MyListTable database class


class MyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyList Items'),
      ),
      body: FutureBuilder<List<MyList>>(
        future: MyListTable.of.getMyList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<MyList>? myListItems = snapshot.data;
            return ListView.builder(
              itemCount: myListItems!.length,
              itemBuilder: (context, index) {
                MyList myList = myListItems[index];
                return ListTile(
                  title: Text(myList.itemName),
                  subtitle: Text('Amount: ${myList.amount.toString()}'),
                  // Add more information from MyList as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
