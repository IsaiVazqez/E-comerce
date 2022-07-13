import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCartButton extends StatelessWidget {
  final String? monto;

  const AddCartButton({Key? key, this.monto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        child: Expanded(
          child: Row(children: [
            const SizedBox(
              width: 20,
            ),
            Text('$monto',
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Spacer(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(155, 50),
                textStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                shape: const StadiumBorder(),
                backgroundColor: Colors.white,
              ),
              onPressed: () {},
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: 'Place Order  ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(CupertinoIcons.arrow_right_circle,
                        size: 24, color: Colors.black),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
