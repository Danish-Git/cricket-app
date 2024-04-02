import 'package:cricket/app_utils/custom_button.dart';
import 'package:cricket/routing_dir/app_screen_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upi_india/upi_india.dart';
import '../../app_utils/color_constants.dart';
import '../../app_utils/payment_constants.dart';

class PaymentOptionController extends GetxController {
  int selectedIndex = 0;
  late UpiApp selectedUpiApp;

  UpiIndia upiIndia = UpiIndia();
  List<UpiApp> upiApps = [];

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchUPIApps();
  }

  Future<void> fetchUPIApps() async {
    try {
      toggleIsLoading();
      upiApps = await upiIndia.getAllUpiApps(allowNonVerifiedApps: true);
      upiApps.sort((a, b) => a.name.compareTo(b.name));
      selectedUpiApp = upiApps[selectedIndex];
      toggleIsLoading();
    } catch (e) {
      /// error;
    }
  }

  void onUPIAppSelection(UpiApp upiApp, int value) {
    selectedIndex = value;
    selectedUpiApp = upiApp;
    update();
  }

  Future<void> proceedToPay() async {
    try {
      UpiResponse? response = await upiIndia.startTransaction(
        app: selectedUpiApp,
        receiverUpiId: PaymentConstants.receivingUPI,
        receiverName: PaymentConstants.receiverName,
        transactionRefId: PaymentConstants.transactionRef,
        transactionNote: PaymentConstants.transactionNote,
        amount: PaymentConstants.playerRegistrationFee,
      );
      switch (response.status) {
        case 'UpiPaymentStatus.SUBMITTED':
          break;
        case 'UpiPaymentStatus.FAILURE':
          Get.back();
          break;
        case 'UpiPaymentStatus.SUCCESS':
        /// #Important
        ///  registerPlayer(response);
          onContinueTap();
          break;
        default:
          break;
      }
    } catch (e) {
      rethrow;
    }
  }

  void onContinueTap() {
    Get.toNamed(AppScreenConst.paymentDone);
  }

  //////////

  var holderNameController = TextEditingController();
  var cardNumberController = TextEditingController();
  var expController = TextEditingController();
  var cvvController = TextEditingController();

  RxBool isCheckBoxSelected = false.obs;

  void onCheckBoxTap() {
    isCheckBoxSelected.value = !isCheckBoxSelected.value;
  }

  void onAddCardTap() {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        side: BorderSide(width: 1, color: Colors.transparent),
      ),
      Container(
        height: Get.height * 0.8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        padding: const EdgeInsets.only(left: 24, right: 24, top: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add New Card',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 42,
                      height: 42,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                      child: const Text(
                        'X',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CardTxtController(
                label: 'Full Name',
                textEditingController: holderNameController,
              ),
              const SizedBox(height: 14),
              CardTxtController(
                label: 'Card number',
                textEditingController: cardNumberController,
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardTxtController(
                    label: 'Exp date',
                    textEditingController: expController,
                    width: Get.width * 0.35,
                  ),
                  CardTxtController(
                    label: 'Cvv',
                    textEditingController: cvvController,
                    width: Get.width * 0.35,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Your card information is encrypted',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() {
                    return Checkbox(
                      checkColor: Colors.white,
                      activeColor: ColorConstants().greenColor,
                      value: isCheckBoxSelected.value,
                      fillColor:
                          MaterialStateProperty.resolveWith((Set states) {
                        return ColorConstants().greenColor;
                      }),
                      onChanged: (value) {
                        onCheckBoxTap();
                      },
                    );
                  }),
                  const Text(
                    'Save your above information',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  )
                ],
              ),
              CustomButton(
                label: 'Add Card',
                wth: double.maxFinite,
                hgt: 50,
                color: ColorConstants().greenColor,
                onTap: () {
                  Get.toNamed(AppScreenConst.paymentDone);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void toggleIsLoading() {
    isLoading = !isLoading;
    update();
  }
}

class CardTxtController extends StatelessWidget {
  final String label;
  final bool isReadOnly;
  final double width;
  final TextEditingController textEditingController;

  const CardTxtController({
    super.key,
    required this.label,
    this.isReadOnly = false,
    this.width = double.maxFinite,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      child: TextField(
        controller: textEditingController,
        readOnly: isReadOnly,
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 4),
          label: Text(label),
          labelStyle: const TextStyle(
            color: Color.fromRGBO(150, 150, 150, 1),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
        ),
      ),
    );
  }
}
