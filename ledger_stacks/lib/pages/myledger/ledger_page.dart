import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';
import '../home/home_page.dart';

class MyLedger extends StatelessWidget {
  const MyLedger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: KBackButton(
        onPressed: () {
          Get.off(() => const HomePage());
        },
      )),
      body: const Text("MyLedger"),
    );
  }
}
