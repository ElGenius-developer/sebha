import 'package:flutter/material.dart';

class ZekrText extends StatelessWidget {
  const ZekrText({Key? key, required this.text, required this.lenghtOfText})
      : super(key: key);
  final String text;
  final int lenghtOfText;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: ((lenghtOfText * 2 <= 50 ? 90 : lenghtOfText * 2).toDouble()),
        width: lenghtOfText * 7 <= MediaQuery.of(context).size.width
            ? lenghtOfText == 0
                ? 50
                : ((lenghtOfText) * 7 + 50).toDouble()
            : MediaQuery.of(context).size.width - 10,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.yellow.shade700,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.amber,
                shadows: [Shadow(color: Colors.yellow.shade100, blurRadius: 5)],
                fontSize: 22),
          ),
        ),
      ),
    );
  }
}
