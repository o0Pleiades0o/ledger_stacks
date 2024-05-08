import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/pages/home/home_page.dart';
import 'package:ledger_stacks/pages/myledger/ledger_controller.dart';
import 'package:ledger_stacks/widgets/floating_action_button.dart';

import '../../constants/color.dart';
import '../../widgets/alert_dialog.dart';
import '../../widgets/button.dart';
import '../../widgets/ledger_display.dart';
import 'add_transaction.dart/transaction_page.dart';

class MyLedger extends StatelessWidget {
  MyLedger({super.key});

  final LedgerController ledgerController = Get.put(LedgerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75.h,
        backgroundColor: kViolet,
        leading: KBackButton(
          onPressed: () {
            Get.off(() => const HomePage());
          },
        ),
        actions: [
          Obx(() {
            if (ledgerController.isMultiSelect.isTrue) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showMyDialogDeleteTransaction(context);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ledgerController.isMultiSelect.toggle();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            } else {
              return IconButton(
                onPressed: () {
                  ledgerController.isMultiSelect.toggle();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              );
            }
          })
        ],
      ),
      body: Stack(
        children: [
          Container(
              height: 170.h,
              width: Get.width,
              decoration: BoxDecoration(
                  color: kViolet,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ledger",
                    style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ],
              )),
          //Content
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.12, left: 20.w, right: 20.w),
            child: ClipRRect(borderRadius: BorderRadius.circular(36.r), child: LedgerDisplay()),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CreateFAB(
            onPressed: () {
              Get.off(() => AddTransaction());
            },
          ),
        ],
      ),
    );
  }
}
