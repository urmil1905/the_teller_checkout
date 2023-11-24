library the_teller_checkout;

import 'package:flutter/material.dart';
import 'package:the_teller_checkout/src/browser/inapp_browser.dart';
import 'services/remote_services.dart';

/// A Calculator.
class CheckoutRequest {
  final service = RemoverServices();
  Future<dynamic> initRequest(BuildContext context,
      {String? email,
      required String platform,
      required String amount,
      required String description,
      required String apiKeys,
      required String merchsntID,
      required String apiUser,
      required String transactionID,
      required String paymentMethod,
      Color? themeColor}) async {
    dynamic data;
    Map<String, dynamic> body = {
      "merchant_id": merchsntID,
      "transaction_id": transactionID,
      "desc": description,
      "amount": amount,
      "redirect_url":
          "https://test.theteller.net/checkout/checkout/eU1xSFN5Ky92MUt5dmpnT",
      "email": email,
      "API_Key": apiKeys,
      "payment_method": paymentMethod,
      "apiuser": apiUser
    };
    await service
        .initiate(
            platform: platform, apiKey: apiKeys, userApi: apiUser, body: body)
        .then((response) async {
      if (response.status == 'success') {
        debugPrint(response.checkoutUrl!);

        data = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WebViewExample(
                        themeColor: themeColor ??
                            const Color.fromARGB(255, 26, 3, 144),
                        url: response.checkoutUrl!)));

        debugPrint("=====================$data");
      } else {
        return response;
      }
    });

    return data;
  }
}
