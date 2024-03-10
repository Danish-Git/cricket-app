import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../app_utils/app_wgts_utils.dart';
import 'payment_option_controller.dart';

class PaymentOptionScreen extends StatelessWidget {
  const PaymentOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<PaymentOptionController>(
      assignId: true,
      init: PaymentOptionController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 315,
                    child: SvgPicture.asset(
                      'assets/down_dot.svg',
                      height: 300,
                      fit: BoxFit.cover,
                      semanticsLabel: 'Logo',
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.13,
                    left: 0,
                    right: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TxtWgt(label: 'UPI'),
                        CustomRadioTile(
                          groupValue: 1,
                          selectedValue: controller.selectedIndex,
                          label: 'Google Pay',
                          imgName: 'UPI',
                          onTap: (val) {
                            controller.onTap(val);
                          },
                        ),
                        CustomRadioTile(
                          groupValue: 2,
                          selectedValue: controller.selectedIndex,
                          label: 'Phone Pay',
                          imgName: 'UPI',
                          onTap: (val) {
                            controller.onTap(val);
                          },
                        ),
                        CustomRadioTile(
                          groupValue: 3,
                          selectedValue: controller.selectedIndex,
                          label: 'Amazon Pay',
                          imgName: 'UPI',
                          onTap: (val) {
                            controller.onTap(val);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12, top: 6),
                    child:
                        CustomAppBar(label: 'Payment options', isGreen: false),
                  ),
                ],
              ),
              CustomRadioTile(
                groupValue: 4,
                selectedValue: controller.selectedIndex,
                label: 'paytm',
                imgName: 'UPI',
                onTap: (val) {
                  controller.onTap(val);
                },
              ),
              AddNewOption(label: 'Add new UPI ID', onTap: () {}),
              /*     const SizedBox(height: 16),
              const TxtWgt(label: 'Credit and Debit Cards'),
              CustomRadioTile(
                groupValue: 5,
                selectedValue: controller.selectedIndex,
                label: 'xxxx xxxx xxxx xx89',
                imgName: 'VISA',
                onTap: (val) {
                  controller.onTap(val);
                },
              ),
              CustomRadioTile(
                groupValue: 6,
                selectedValue: controller.selectedIndex,
                label: 'xxxx xxxx xxxx xx77',
                imgName: 'Mas',
                onTap: (val) {
                  controller.onTap(val);
                },
              ),
              AddNewOption(
                  label: 'Add new card',
                  onTap: () {
                    controller.onAddCardTap();
                  }),
              const SizedBox(height: 16),
              const TxtWgt(label: 'More Payment Options'),
              CustomRadioTile(
                groupValue: 7,
                selectedValue: controller.selectedIndex,
                label: 'Scan and pay',
                imgName: 'Scan',
                onTap: (val) {
                  controller.onTap(val);
                },
              ),*/
            ],
          ),
        );
      },
    ));
  }
}

class TxtWgt extends StatelessWidget {
  final String label;

  const TxtWgt({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
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
  final String label;
  final String imgName;
  final Function(int value) onTap;

  const CustomRadioTile({
    super.key,
    required this.groupValue,
    required this.selectedValue,
    required this.label,
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
          Container(
            height: 24,
            width: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: const Color.fromRGBO(128, 128, 128, 1),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              imgName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          Text('  $label'),
          const Spacer(),
          Radio(
            value: groupValue,
            toggleable: true,
            groupValue: selectedValue,
            activeColor: Colors.green,
            onChanged: (value) {
              onTap(value!);
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
