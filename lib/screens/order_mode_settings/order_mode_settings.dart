import 'package:digital_dukan_minor_project/bloc/cart_bloc/cart_bloc.dart';
import 'package:digital_dukan_minor_project/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderModeSettings extends StatefulWidget {
  const OrderModeSettings({Key? key}) : super(key: key);

  @override
  State<OrderModeSettings> createState() => _OrderModeSettingsState();
}

class _OrderModeSettingsState extends State<OrderModeSettings> {
  static String cash = "Cash";
  static String payNow = "PayNow";
  static String pickup = "Pickup";
  static String delivery = "Delivery";

  String _selectedDelivery = pickup;
  String _selectedPayment = cash;

  List<String> _choices = [cash, payNow];
  List<String> _choicesDelivery = [pickup, delivery];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Settings"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Mode of Payment"),
                ),
                DropdownButton<String>(
                  value: _selectedPayment,
                  hint: Text('Please choose a mode of payment'),
                  items: _choices.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? val) {
                    setState(() {
                      _selectedPayment = val!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Mode of Delivery"),
                ),
                DropdownButton<String>(
                  hint: Text('Please choose a mode of delivery'),
                  value: _selectedDelivery,
                  items: _choicesDelivery.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? val) {
                    setState(() {
                      _selectedDelivery = val!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Payment? paymentType;
                        Delivery? deliveryType;
                        if (_selectedDelivery == pickup)
                          deliveryType = Delivery.pickup;
                        else
                          deliveryType = Delivery.delivery;
                        if (_selectedPayment == cash)
                          paymentType = Payment.cash;
                        else
                          paymentType = Payment.paid;
                        BlocProvider.of<CartBloc>(context)
                            .add(CartEventCreateOrder(paymentType, deliveryType));
                        Navigator.pop(context);
                      },
                      child: Text("Proceed")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
