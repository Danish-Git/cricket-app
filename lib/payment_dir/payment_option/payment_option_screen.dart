import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:upi_india/upi_app.dart';
import '../../app_utils/app_wgts_utils.dart';
import '../../app_utils/color_constants.dart';
import '../../app_utils/custom_button.dart';
import '../../app_utils/scaffold.dart';
import 'payment_option_controller.dart';

class PaymentOptionScreen extends StatelessWidget {
  const PaymentOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentOptionController>(
      global: false,
      init: PaymentOptionController(),
      builder: (controller) {
        return CustomScaffold(
          backgroundImage: SvgPicture.asset(
            'assets/down_dot.svg',
            fit: BoxFit.fill,
          ),
          titleWidget: Text(
            'Payment options',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorConstants().blackColor,
            ),
          ),
          centerTitle: true,
          leadingWidget: BackBtnIcon(onPressed: () => Get.back()),
          body: controller.isLoading ? Center(child: Helper.showLoader())
            : controller.upiApps.isEmpty ? const TxtWgt(label: 'No Payment option found')
            : SingleChildScrollView(
              child: Column(
              children: [
                for (int i = 0; i < controller.upiApps.length; i++)
                  CustomRadioTile(
                    groupValue: i,
                    selectedValue: controller.selectedIndex,
                    upiApp: controller.upiApps[i],
                    imgName: 'UPI',
                    onTap: controller.onUPIAppSelection,
                  ),
              ],
          ),
            ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CustomButton(
            label: 'Continue',
            wth: double.infinity,
            hgt: 50,
            color: ColorConstants().greenColor,
            onTap: controller.proceedToPay,
          ),
        );
      },
    );
  }
}

class TxtWgt extends StatelessWidget {
  final String label;

  const TxtWgt({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CustomRadioTile extends StatelessWidget {
  final int groupValue;
  final int selectedValue;
  final UpiApp upiApp;
  final String imgName;
  final Function(UpiApp upiApp, int value) onTap;

  const CustomRadioTile({
    super.key,
    required this.groupValue,
    required this.selectedValue,
    required this.upiApp,
    required this.imgName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.15)),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Color.fromRGBO(0, 0, 0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.memory(upiApp.icon),
          ),
          Text('  ${upiApp.name}'),
          const Spacer(),
          Radio(
            value: groupValue,
            toggleable: true,
            groupValue: selectedValue,
            activeColor: Colors.green,
            onChanged: (value) {
              onTap(upiApp, value!);
            },
          ),
        ],
      ),
    );
  }
}

class AddNewOption extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AddNewOption({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 16),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.15)),
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.add,
              size: 36,
              color: Colors.grey,
            ),
            Text('  $label'),
          ],
        ),
      ),
    );
  }
}
