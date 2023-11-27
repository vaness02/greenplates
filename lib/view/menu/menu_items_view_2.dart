import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row.dart';
import '../more/my_order_view.dart';
import 'item_details_view.dart';

class MenuItemsView extends StatefulWidget {
  final Map mObj;
  const MenuItemsView({Key? key, required this.mObj}) : super(key: key);

  @override
  State<MenuItemsView> createState() => _MenuItemsViewState();
}

class _MenuItemsViewState extends State<MenuItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/img/breakfast1.png",
      "name": "Oatmeal",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Breakfast",
      "nutrition": [
        "Calories: 300",
        "Protein: 10g",
        "Fat: 8g",
        "Fiber: 6g",
        "Carbs: 45g"
      ],
      "price": 50000,
      "description": "Oatmeal dengan Buah-buahan Segar dan Kacang",
    },
    {
      "image": "assets/img/breakfast2.png",
      "name": "Sandwich Gandum",
      "rate": "4.9",
      "rating": "124",
      "type": "Cakes by Tella",
      "food_type": "Breakfast",
      "nutrition": [
        "Calories: 350",
        "Protein: 20g",
        "Fat: 12g",
        "Fiber: 5g",
        "Carbs: 30g"
      ],
      "price": 45000,
      "description": "Sandwich Gandum Utuh dengan Telur Rebus dan Sayuran",
    },
    {
      "image": "assets/img/lunch1.png",
      "name": "Salmon Panggang",
      "rate": "4.9",
      "rating": "124",
      "type": "Café Racer",
      "food_type": "Lunch",
      "nutrition": [
        "Calories: 450",
        "Protein: 30g",
        "Fat: 20g",
        "Fiber: 7g",
        "Carbs: 35g"
      ],
      "price": 135000,
      "description": "Salmon Panggang dengan Ubi Jalar dan Brokoli Kukus",
    },
    {
      "image": "assets/img/lunch2.png",
      "name": "Quinoa Bowl",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Lunch",
      "nutrition": [
        "Calories: 380",
        "Protein: 20g",
        "Fat: 15g",
        "Fiber: 12g",
        "Carbs: 40g"
      ],
      "price": 150000,
      "description": "Quinoa Bowl dengan Kacang Hitam, Alpukat, dan Salsa",
    },
    {
      "image": "assets/img/snacks2.png",
      "name": "Roti Renyah",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Snacks",
      "nutrition": [
        "Calories: 180",
        "Protein: 4g",
        "Fat: 10g",
        "Fiber: 5g",
        "Carbs: 20g"
      ],
      "price": 47000,
      "description": "Roti Renyah Multigrain dengan Irisan Alpukat dan Tomat",
    },
    {
      "image": "assets/img/snacks1.png",
      "name": "Muffin Pisang",
      "rate": "4.9",
      "rating": "124",
      "type": "Cakes by Tella",
      "food_type": "Snacks",
      "nutrition": [
        "Calories: 200",
        "Protein: 6g",
        "Fat: 10g",
        "Fiber: 4g",
        "Carbs: 25g"
      ],
      "price": 43000,
      "description": "Muffin Pisang Oatmeal Tanpa Terigu",
    },
    {
      "image": "assets/img/dinner1.png",
      "name": "Burger Kalkun",
      "rate": "4.9",
      "rating": "124",
      "type": "Café Racer",
      "food_type": "Dinner",
      "nutrition": [
        "Calories: 400",
        "Protein: 20g",
        "Fat: 15g",
        "Fibre: 6g",
        "Carbs: 35g"
      ],
      "price": 30000,
      "description": "Burger Kalkun Panggang dengan Roti Gandum Utuh dan Salad",
    },
    {
      "image": "assets/img/dinner2.png",
      "name": "Salmon Panggang",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Dinner",
      "nutrition": [
        "Calories: 450",
        "Protein: 25g",
        "Fat: 20g",
        "Fibre: 7g",
        "Carbs: 30g"
      ],
      "price": 150000,
      "description": "Salmon Panggang dengan Umbi Jalar dan Asparagus",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        widget.mObj["name"].toString(),
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        "assets/img/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Food",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = menuItemsArr[index] as Map? ?? {};

                  // Tambahkan kondisi untuk memfilter berdasarkan jenis makanan
                  if (mObj["food_type"] == widget.mObj["name"]) {
                    return MenuItemRow(
                      mObj: mObj,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemDetailsView(menuItem: mObj),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(); // Jika tidak sesuai filter, kembalikan widget kosong
                  }
                }),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = menuItemsArr[index] as Map? ?? {};

                  // Tambahkan kondisi untuk memfilter berdasarkan restoran
                  if (mObj["type"] == widget.mObj["name"]) {
                    return MenuItemRow(
                      mObj: mObj,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemDetailsView(menuItem: mObj),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(); // Jika tidak sesuai filter, kembalikan widget kosong
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
