import 'package:flutter/cupertino.dart';
import 'package:sano/domain/entity/product.dart';
import 'package:sano/presentation/widget/custom_text_field.dart';

import 'application_popup_box.dart';

class AddFieldPopup extends PopupRoute<CreateProductResult> {
  late final TextEditingController _nameController;
  late final TextEditingController _priceController;

  AddFieldPopup() {
    _nameController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  Color get barrierColor => const Color(0xff000000).withOpacity(0.32);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return ApplicationPopupBox(
      layout: _AddEventRouteLayout(MediaQuery.of(context).viewInsets.bottom),
      animation: animation,
      title: Text(
        "Create Product",
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.03,
              color: const Color(0xff000000),
            ),
      ),
      content: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.85,
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Flex(
              direction: Axis.vertical,
              children: [
                CustomTextField(controller: _nameController, hintTex: "Name",keyboardType: TextInputType.text,),
                CustomTextField(controller: _priceController, hintTex: "Price",keyboardType: TextInputType.phone,),
                const SizedBox(
                  height: 16,
                ),
              ],
            );
          },
        ),
      ),
      actions: [
        Expanded(
          child: CupertinoButton(
            onPressed: () {
              Navigator.pop(
                context,
                CreateProductResult(
                  product: Product(
                      name: _nameController.text, date: DateTime.now(), price: int.parse(_priceController.text)),
                ),
              );
            },
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            color: const Color(0xff125CEC),
            child: Text(
              "Create",
              textAlign: TextAlign.center,
              style:
                  CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 18, color: const Color(0xffffffff)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class _AddEventRouteLayout extends SingleChildLayoutDelegate {
  final double _blockSize;

  _AddEventRouteLayout(this._blockSize);

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      minWidth: 0,
      maxWidth: constraints.maxWidth,
      minHeight: 0,
      maxHeight: constraints.maxHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(size.width / 2 - childSize.width / 2,
        (size.height / 2 - childSize.height / 2 - _blockSize / 2).clamp(0.0, size.height - childSize.height));
  }

  @override
  bool shouldRelayout(_AddEventRouteLayout oldDelegate) {
    return false;
  }
}

class CreateProductResult {
  final Product product;

  CreateProductResult({
    required this.product,
  });
}
