import 'package:flutter/material.dart';

class ZekrText extends StatefulWidget {
  const ZekrText({Key? key}) : super(key: key);
  @override
  State<ZekrText> createState() => _ZekrTextState();
}

class _ZekrTextState extends State<ZekrText> {
  TextEditingController controller =
      TextEditingController(text: 'سُبْحَانَ اللّهِ');
  int lenghtOfText = 15;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: lenghtOfText * 10 <= MediaQuery.of(context).size.width
          ? lenghtOfText == 0
              ? 25
              : (lenghtOfText) * 7
          : MediaQuery.of(context).size.width - 10,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.yellow.shade700,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Theme(
        data: Theme.of(context).copyWith(),
        child: Center(
          child: TextFormField(
            maxLines: (lenghtOfText ~/ 20) <= 0 ? 1 : lenghtOfText ~/ 20,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow.shade700),
              ),
            ),
            controller: controller,
            textAlign: TextAlign.center,
            style: const TextStyle(
                shadows: [Shadow(color: Colors.amber, blurRadius: 2)],
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
            onSaved: (newValue) {
              FocusNode().unfocus();
            },
            onChanged: (value) {
              setState(() {
                lenghtOfText = value.length;
              });
            },
          ),
        ),
      ),
    );
  }
}
