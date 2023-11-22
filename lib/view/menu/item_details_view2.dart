import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery/common_widget/round_icon_button.dart';
import 'package:intl/intl.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../../common/color_extension.dart';
import '../more/my_order_view2.dart';

class ItemDetailsView extends StatefulWidget {
  final Map menuItem;

  const ItemDetailsView({Key? key, required this.menuItem}) : super(key: key);

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  String? _selectedSubscription;
  String? _selectedMealOption; // Opsi makan baru
  int originalPrice = 0;
  int unitPrice = 0; // Harga satuan
  int totalPrice = 0; // Total harga
  int qty = 1;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    // Setel harga satuan dari widget.menuItem
    unitPrice = widget.menuItem['price'] ?? 0;
    totalPrice = unitPrice;
    originalPrice = widget.menuItem['price'] ?? 0;
    // Inside any method
  }

  void addToCart() {
    if (_selectedSubscription == null || _selectedMealOption == null) {
      // Show a message to the user to select the subscription and meal options
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select subscription and meal options')),
      );
    } else {
      final cart = Provider.of<CartModel>(context, listen: false);
      if (qty != null && qty > 0) {
        // Validate the qty value
        cart.addItem({
          'name': widget.menuItem['name'],
          'price': widget.menuItem['price'],
          'quantity': qty,
          'subscriptionDay': _selectedSubscription,
          'mealOption': _selectedMealOption,
        });
      } else {
        // Handle the case where qty is null or not a valid numeric value
        // You can show an error message to the user or handle it based on your application's logic
      }
    }
  }

  Widget _buildDescription() {
    final cart = Provider.of<CartModel>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.menuItem["description"],
            style: TextStyle(
              color: TColor.secondaryText,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          _buildDescription(),
          Image.asset(
            widget.menuItem["image"],
            width: media.width,
            height: media.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: media.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: media.width - 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  widget.menuItem["name"].toString(),
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IgnorePointer(
                                          ignoring: true,
                                          child: RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 20,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: TColor.primary,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          " 4 Star Ratings",
                                          style: TextStyle(
                                              color: TColor.primary,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Rp ${NumberFormat("#,##0", "id_ID").format(originalPrice)}", // Menggunakan totalPrice
                                          style: TextStyle(
                                            color: TColor.primaryText,
                                            fontSize: 31,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "/per Portion",
                                          style: TextStyle(
                                              color: TColor.primaryText,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  widget.menuItem["description"],
                                  style: TextStyle(
                                    color: TColor.secondaryText,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nutrition Information",
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Menampilkan informasi nutrisi dari widget.menuItem
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: widget.menuItem["nutrition"]
                                          .map<Widget>((info) {
                                        return Text(
                                          info,
                                          style: TextStyle(
                                            color: TColor.secondaryText,
                                            fontSize: 12,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Divider(
                                    color:
                                        TColor.secondaryText.withOpacity(0.4),
                                    height: 1,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  "Customize your Order",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: TColor.textfield,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _selectedSubscription,
                                      items: <String>[
                                        '7 Days',
                                        '15 Days',
                                        '30 Days'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: TColor.primaryText,
                                                fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedSubscription = newValue;
                                          updateTotalPrice();
                                        });
                                      },
                                      hint: Text(
                                        "- Select Subscription -",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: TColor.secondaryText,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: TColor.textfield,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      isExpanded: true,
                                      value: _selectedMealOption,
                                      items: <String>[
                                        'Lunch',
                                        'Dinner',
                                        'Lunch & Dinner'
                                      ].map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: TColor.primaryText,
                                                fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedMealOption = newValue;
                                          updateTotalPrice();
                                        });
                                      },
                                      hint: Text(
                                        "- Select Meal Option -",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: TColor.secondaryText,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  children: [
                                    Text(
                                      "Number of Portions",
                                      style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        qty = qty - 1;

                                        if (qty < 1) {
                                          qty = 1;
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: TColor.primary,
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                              color: TColor.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      height: 25,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: TColor.primary,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.5)),
                                      child: Text(
                                        qty.toString(),
                                        style: TextStyle(
                                            color: TColor.primary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        qty = qty + 1;

                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: TColor.primary,
                                            borderRadius:
                                                BorderRadius.circular(12.5)),
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              color: TColor.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 220,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Container(
                                      width: media.width * 0.25,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        color: TColor.primary,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(35),
                                            bottomRight: Radius.circular(35)),
                                      ),
                                    ),
                                    Center(
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 8,
                                                  bottom: 8,
                                                  left: 10,
                                                  right: 20),
                                              width: media.width - 80,
                                              height: 120,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  35),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  35),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 12,
                                                        offset: Offset(0, 4))
                                                  ]),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Total Price",
                                                    style: TextStyle(
                                                        color:
                                                            TColor.primaryText,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    "Rp ${NumberFormat("#,##0", "id_ID").format(totalPrice * qty)}", // Menggunakan totalPrice
                                                    style: TextStyle(
                                                      color: TColor.primaryText,
                                                      fontSize: 21,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 130,
                                                    height: 25,
                                                    child: RoundIconButton(
                                                      title: "Add to Cart",
                                                      icon:
                                                          "assets/img/shopping_add.png",
                                                      color: TColor.primary,
                                                      onPressed:
                                                          addToCart, // Panggil fungsi addToCart di sini
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MyOrderView()));
                                            },
                                            child: Container(
                                              width: 45,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22.5),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 4,
                                                        offset: Offset(0, 2))
                                                  ]),
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                  "assets/img/shopping_cart.png",
                                                  width: 20,
                                                  height: 20,
                                                  color: TColor.primary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Container(
                    height: media.width - 20,
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(right: 4),
                    child: InkWell(
                        onTap: () {
                          isFav = !isFav;
                          setState(() {});
                        },
                        child: Image.asset(
                            isFav
                                ? "assets/img/favorites_btn.png"
                                : "assets/img/favorites_btn_2.png",
                            width: 70,
                            height: 70)),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          "assets/img/btn_back.png",
                          width: 20,
                          height: 20,
                          color: TColor.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyOrderView()));
                        },
                        icon: Image.asset(
                          "assets/img/shopping_cart.png",
                          width: 25,
                          height: 25,
                          color: TColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo({required String title, required Widget content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: TColor.primaryText,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }

  Widget _buildSubscriptionOption(String title, String? price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 14,
          ),
        ),
        Text(
          "Rp ${NumberFormat("#,##0", "id_ID").format(int.parse(price ?? '0'))}",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  void updateTotalPrice() {
    int days = 0;
    if (_selectedSubscription == '7 Days') {
      days = 7;
    } else if (_selectedSubscription == '15 Days') {
      days = 15;
    } else if (_selectedSubscription == '30 Days') {
      days = 30;
    }

    int meals = 1;
    if (_selectedMealOption == 'Lunch & Dinner') {
      meals = 2;
    }

    totalPrice = unitPrice * days * meals;
  }
}
