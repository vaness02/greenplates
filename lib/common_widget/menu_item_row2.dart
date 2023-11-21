import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class MenuItemRow extends StatefulWidget {
  final Map mObj;
  final VoidCallback onTap;

  const MenuItemRow({
    Key? key,
    required this.mObj,
    required this.onTap,
  }) : super(key: key);

  @override
  _MenuItemRowState createState() => _MenuItemRowState();
}

class _MenuItemRowState extends State<MenuItemRow> {
  bool showSubscriptionOptions = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            showSubscriptionOptions = !showSubscriptionOptions;
          });
          widget.onTap();
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              widget.mObj["image"].toString(),
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mObj["name"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/img/rate.png",
                            width: 10,
                            height: 10,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.mObj["rate"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.blue, // Adjust color as needed
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.mObj["type"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                          const Text(
                            " . ",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.blue, // Adjust color as needed
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            widget.mObj["food_type"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
