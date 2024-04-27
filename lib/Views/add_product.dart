import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_app/services/add_product.dart';
import 'package:shop_app/widgets/custom_bottom.dart';
import 'package:shop_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class AddProductView extends StatefulWidget {
  AddProductView({
    super.key,
  });

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  var price, title, description, category, image, id;

  bool isolating = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isolating,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Add Product',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hint: 'Product Id',
                  onChanged: (p0) {
                    id = p0;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Product Name',
                  onChanged: (p0) {
                    title = p0;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Description',
                  onChanged: (p0) {
                    description = p0;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Price',
                  keyboardType: TextInputType.number,
                  onChanged: (p0) {
                    price = p0;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Image url',
                  onChanged: (p0) {
                    image =
                        'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg';
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomBottom(
                  text: 'Add',
                  onTap: () async {
                    isolating = true;
                    setState(() {});
                    await Add_Product();
                    try {
                      snackbar(context, text: 'Success');
                      isolating = false;
                      setState(() {});
                      Navigator.pop(context);
                    } catch (e) {
                      snackbar(context, text: '$e');
                    }
                    isolating = false;
                    setState(() {});
                  },
                )
              ],
            ),
          )),
    );
  }

  Future Add_Product() async {
    await AddProduct().addProduct(
      title: title,
      price: double.parse(price),
      description: description,
      image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      category: 'category',
    );
  }
}

snackbar(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
