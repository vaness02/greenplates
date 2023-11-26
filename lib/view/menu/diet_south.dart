import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row2.dart';
import '../more/my_order_view.dart';
import 'item_details_view2.dart';

class DietSouthView extends StatefulWidget {
  const DietSouthView({Key? key}) : super(key: key);

  @override
  _DietSouthViewState createState() => _DietSouthViewState();
}

class _DietSouthViewState extends State<DietSouthView> {
  TextEditingController txtSearch = TextEditingController();

  List dietSouthItemsArr = [
    {
      "image": "assets/img/south_food1.png",
      "name": "Shrimp and Broccoli Stir-fry",
      "description":
          "Diet South adalah diet resmi yang dikembangkan oleh South Clinic berbasis di Amerika, berdasarkan penelitian dan pengalaman klinis. Diet ini berfokus pada makan makanan sehat yang rasanya enak dan meningkatkan aktivitas fisik. Ini menekankan bahwa cara terbaik untuk menjaga berat badan adalah dengan mengubah gaya hidup Anda dan mengadopsi kebiasaan kesehatan yang baru.",
      "rate": "4.8",
      "rating": "120",
      "type": "South Kitchen",
      "food_type": "",
      "nutrition": [
        "Calories: 300",
        "Protein: 10g",
        "Fat: 25g",
        "Fiber: 8g",
        "Carbs: 5g"
      ],
      "price": 150000,
      "subscription_options": {
        "7_days": 100000,
        "15_days": 180000,
        "30_days": 320000,
      },
    },
    {
      "image": "assets/img/south_food2.png",
      "name": "Turkey and Veggie Skewers",
      "description":
          "Diet South adalah diet resmi yang dikembangkan oleh South Clinic berbasis di Amerika, berdasarkan penelitian dan pengalaman klinis. Diet ini berfokus pada makan makanan sehat yang rasanya enak dan meningkatkan aktivitas fisik. Ini menekankan bahwa cara terbaik untuk menjaga berat badan adalah dengan mengubah gaya hidup Anda dan mengadopsi kebiasaan kesehatan yang baru.",
      "rate": "4.9",
      "rating": "130",
      "type": "South Kitchen",
      "food_type": "",
      "nutrition": [
        "Calories: 400",
        "Protein: 30g",
        "Fat: 20g",
        "Fiber: 10g",
        "Carbs: 5g"
      ],
      "price": 180000,
      "subscription_options": {
        "7_days": 150000,
        "15_days": 280000,
        "30_days": 500000,
      },
    },
    {
      "image": "assets/img/south_food3.png",
      "name": "Eggplant Lasagna",
      "description":
          "Diet South adalah diet resmi yang dikembangkan oleh South Clinic berbasis di Amerika, berdasarkan penelitian dan pengalaman klinis. Diet ini berfokus pada makan makanan sehat yang rasanya enak dan meningkatkan aktivitas fisik. Ini menekankan bahwa cara terbaik untuk menjaga berat badan adalah dengan mengubah gaya hidup Anda dan mengadopsi kebiasaan kesehatan yang baru.",
      "rate": "4.7",
      "rating": "110",
      "type": "South Kitchen",
      "food_type": "",
      "nutrition": [
        "Calories: 250",
        "Protein: 8g",
        "Fat: 18g",
        "Fiber: 6g",
        "Carbs: 8g"
      ],
      "price": 120000,
      "subscription_options": {
        "7_days": 90000,
        "15_days": 160000,
        "30_days": 280000,
      },
    },
    // Add more South diet items as needed
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
                      icon: Image.asset(
                        "assets/img/btn_back.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "South Diet Menu", // Change the title accordingly
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyOrderView(),
                          ),
                        );
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
                itemCount: dietSouthItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = dietSouthItemsArr[index] as Map? ?? {};
                  return MenuItemRow(
                    mObj: mObj,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailsView(
                              menuItem: mObj as Map<String, dynamic>),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
