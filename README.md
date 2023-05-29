# :credit_card: TheTella Checkout Plugin for Flutter

A Flutter plugin for making payments via Paystack Payment Gateway. Fully
supports Android and iOS.

## :rocket: Installation
To use this plugin, add `the_teller_checkout` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).


``` -->

No other configuration required&mdash;the plugin works out of the box.

## :heavy_dollar_sign: Making Payments
There are two ways of making payment with the plugin.
1.  **Checkout**: This is the easy way; as the plugin handles all the
    processes involved in making a payment (except transaction
    initialization and verification which should be done from your
    backend).
2.  **Charge Card**: This is a longer approach; you handle all callbacks
    and UI states.

### 1. :star2: Checkout (Recommended)
 You initialize a charge object with an amount, email & accessCode or
 reference. Pass an `accessCode` only when you have
 [initialized the transaction](https://developers.paystack.co/reference#initialize-a-transaction)
 from your backend. Otherwise, pass a `reference`.
 

 ```dart
 Charge charge = Charge()
       ..amount = 10000
       ..reference = _getReference()
        // or ..accessCode = _getAccessCodeFrmInitialization()
       ..email = 'customer@email.com';
     CheckoutResponse response = await plugin.checkout(
       context context,
       method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
       charge: charge,
     );
 ```

Please, note that an `accessCode` is required if the method is
`CheckoutMethod.bank` or `CheckoutMethod.selectable`.

 `plugin.checkout()` returns the state and details of the
 payment in an instance of `CheckoutResponse` .
 
 
 It is recommended that when `plugin.checkout()` returns, the
 payment should be
 [verified](https://developers.paystack.co/v2.0/reference#verify-transaction)
 on your backend.

### 2. :star: Charge Card
You can choose to initialize the payment locally or via your backend.

#### A. Initialize Via Your Backend (Recommended)

1.a. This starts by making a HTTP POST request to
[paystack](https://developers.paystack.co/reference#initialize-a-transaction)
on your backend.

1.b If everything goes well, the initialization request returns a response with an `access_code`.
You can then create a `Charge` object with the access code and card details. The `charge` is in turn passed to the `plugin.chargeCard()` function for payment:

```dart
  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: cardNumber,
      cvc: cvv,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
    );
  }

  _chargeCard(String accessCode) async {
    var charge = Charge()
      ..accessCode = accessCode
      ..card = _getCardFromUI();

    final response = await plugin.chargeCard(context, charge: charge);
    // Use the response
  }
```


The transaction is successful if `response.status` is true. Please, see the documentation 
of [CheckoutResponse](https://pub.dev/documentation/flutter_paystack/latest/flutter_paystack/CheckoutResponse-class.html)
for more information. 




## :helicopter: Testing your implementation
Paystack provides tons of [payment cards](https://developers.paystack.co/docs/test-cards) for testing.

## :arrow_forward: Running Example project
For help getting started with Flutter, view the online [documentation](https://flutter.io/).

An [example project](https://github.com/mccamo51/the_teller_checkout/tree/master/example) has been provided in this plugin.
Clone this repo and navigate to the **example** folder. Open it with a supported IDE or execute `flutter run` from that folder in terminal.

## :pencil: Contributing, :disappointed: Issues and :bug: Bug Reports
The project is open to public contribution. Please feel very free to contribute.
Experienced an issue or want to report a bug? Please, [report it here](https://github.com/mccamo51/the_teller_checkout/issues). Remember to be as descriptive as possible.

## :trophy: Credits
Thanks to the authors of Thetella. I leveraged on their work to bring this plugin to fruition.

