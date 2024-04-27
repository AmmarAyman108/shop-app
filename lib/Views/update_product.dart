import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/services/update_product.dart';
import 'package:shop_app/widgets/custom_bottom.dart';
import 'package:shop_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductView extends StatefulWidget {
  UpdateProductView({super.key, required this.product});
  ProductModel product;
  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  var price, title, description, image;

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
              'Update Product',
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
                    image = p0;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomBottom(
                  text: 'Update',
                  onTap: () async {
                    isolating = true;
                    setState(() {});

                    try {
                      await updateProduct();
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

  Future updateProduct() async {
    await UpdateProduct().updateProduct(
      id: widget.product.id,
      title: (title == null) ? widget.product.title : title!,
      price: (price == null) ? widget.product.price : price!,
      description:
          (description == null) ? widget.product.description : description!,
      image: (image == null) ? widget.product.image : image!,
      category: widget.product.category,
    );
  }
}

snackbar(BuildContext context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
