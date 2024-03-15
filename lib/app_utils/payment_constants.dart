import 'dart:math';

class PaymentConstants {
  static String receiverName = 'Cricket Club';
  static String receivingUPI = '7508884086@paytm';
  static String transactionRef = Random.secure().nextInt(1 << 32).toString();
  static String transactionNote = 'Player registration';
  static double playerRegistrationFee = 100;
}