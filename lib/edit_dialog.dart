import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {
  const EditDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final controller = TextEditingController();
  int lenghtOfText = 15;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light()
          .copyWith(dialogBackgroundColor: Colors.brown.shade700),
      child: AlertDialog(
        title: Column(
          children: [
            Text('تعديل الذكر',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.amber, fontWeight: FontWeight.bold)),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * .1 + lenghtOfText * 1,
          width: MediaQuery.of(context).size.width,
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                //onEditingComplete: () => ,
                //onTap: ,

                maxLines: (controller.text.length ~/ 20) <= 0
                    ? 1
                    : lenghtOfText ~/ 20,
                autocorrect: true,
                cursorColor: Colors.amber,

                decoration: InputDecoration(
                  hintText: 'اكتب الذكر',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.amber),
                  ),
                ),
                controller: controller,
                textAlign: TextAlign.center,

                style: const TextStyle(
                    shadows: [Shadow(color: Colors.amber, blurRadius: 2)],
                    color: Colors.amber,
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
        ),
        actions: [
          _button('موافق', () {
            if (controller.text.isEmpty) {
              Navigator.pop(context);
            } else {
              Navigator.pop(context, controller.text);
            }
          }),
        ],
      ),
    );
  }

  _button(
    String text,
    Function function,
  ) {
    return CupertinoButton(
      color: Colors.transparent,
      onPressed: () {
        function();
      },
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.amber, fontSize: 18)),
        ),
      ),
    );
  }
}
