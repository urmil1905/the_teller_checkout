import 'package:flutter/material.dart';
// import 'package:the_teller_checkout' show CheckoutRequest;

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              // InitCheckoutRequest
              // CheckoutRequest
            },
          )
        ],
      ),
    );
  }
}
