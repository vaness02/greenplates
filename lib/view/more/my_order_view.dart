import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'checkout_view.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  final int deliveryCost = 50000; // Define delivery cost
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    int totalPrice = cart.getTotalPrice() + deliveryCost;
    String formattedDeliveryCost =
        NumberFormat("#,##0", "id_ID").format(deliveryCost);
    String formattedTotalPrice =
        NumberFormat("#,##0", "id_ID").format(totalPrice);
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset("assets/img/btn_back.png",
                          width: 20, height: 20),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "My Order",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/img/app_logo.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit
                            .fill, // Use BoxFit.fill to ensure the image fits the container
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Diet Package",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/img/rate.png",
                                width: 10,
                                height: 10,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "4.9",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.primary, fontSize: 12),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "(124 Ratings)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.secondaryText, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Burger",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.secondaryText, fontSize: 12),
                              ),
                              Text(
                                " . ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.primary, fontSize: 12),
                              ),
                              Text(
                                "Western Food",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.secondaryText, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/img/location-pin.png",
                                width: 13,
                                height: 13,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  "No 03, 4th Lane, Newyork",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: TColor.secondaryText,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: TColor.textfield),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cart.items.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey),
                  itemBuilder: (context, index) {
                    var cObj = cart.items[index];
                    print('Displaying item: $cObj');
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ), // Add horizontal padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Align items to the end
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${cObj['name']}',
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: cObj.containsKey('size') &&
                                        cObj['size'] != null
                                    ? Text(
                                        'Size: ${cObj['size']}',
                                        style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    : Container(),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Quantity: ${cObj['quantity']}',
                                  style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: cObj.containsKey('subscriptionDay') &&
                                        cObj['subscriptionDay'] != null
                                    ? Text(
                                        'Subscription Day: ${cObj['subscriptionDay']}',
                                        style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    : Container(), // Add this line
                              ),
                              SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: cObj.containsKey('mealOption') &&
                                        cObj['mealOption'] != null
                                    ? Text(
                                        'Meal Option: ${cObj['mealOption']}',
                                        style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    : Container(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Rp ${NumberFormat("#,##0", "id_ID").format((cObj['totalPrice'] ?? cObj['price'] * cObj['quantity']))}',
                                  style: TextStyle(
                                    color: TColor.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: TColor.primary),
                            onPressed: () {
                              // Panggil fungsi removeItem dengan item yang ingin dihapus
                              cart.removeItem(cObj);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Instructions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Show a dialog for user input
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Add Delivery Instructions'),
                                  content: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Enter instructions here'),
                                    onChanged: (text) {
                                      // Handle the user input
                                    },
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: Colors
                                                .green), // Change the color to green light
                                      ),
                                      onPressed: () {
                                        // Save the user input
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.add, color: TColor.primary),
                          label: Text(
                            "Add Notes",
                            style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Rp ${NumberFormat("#,##0", "id_ID").format(cart.getTotalPrice())}", // Replace this line
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Cost",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Rp $formattedDeliveryCost",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: TColor.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Spacer(), // Add Spacer widget to push the total price to the right
                        Text(
                          "Rp $formattedTotalPrice",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RoundButton(
                        title: "Checkout",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutView(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
