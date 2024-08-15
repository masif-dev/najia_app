import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class CheckUserSubscriptionPage extends StatefulWidget {
  @override
  _CheckUserSubscriptionPageState createState() => _CheckUserSubscriptionPageState();
}

class _CheckUserSubscriptionPageState extends State<CheckUserSubscriptionPage> {
  bool _hasActiveSubscription = false;

  @override
  void initState() {
    super.initState();
    _checkSubscriptionStatus();
  }

  Future<void> _checkSubscriptionStatus() async {
    try {
      CustomerInfo purchaserInfo = await Purchases.getCustomerInfo();
      setState(() {
        _hasActiveSubscription = purchaserInfo.entitlements.active.isNotEmpty;
      });
    } catch (e) {
      print("Error fetching purchaser info: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Status'),
      ),
      body: Center(
        child: _hasActiveSubscription
            ? Text('User has an active subscription.')
            : Text('User does not have an active subscription.'),
      ),
    );
  }
}
