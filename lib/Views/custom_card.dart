import 'package:flutter/material.dart';
import 'package:shop_app/Views/update_product.dart';
import 'package:shop_app/models/product_model.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({super.key, required this.product});
  ProductModel product;
  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UpdateProductView(product: widget.product),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Colors.grey.withOpacity(.1),
              offset: const Offset(2, 2))
        ]),
        child: Stack(clipBehavior: Clip.none, children: [
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title.substring(0, 6),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${widget.product.price.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          checked = !checked;
                          setState(() {});
                        },
                        icon: (checked)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite,
                              ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 70,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 80,
            ),
          )
        ]),
      ),
    );
  }
}
