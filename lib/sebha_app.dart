import 'package:flutter/material.dart';
import 'package:sebha/zekr_text.dart';

class SebhaApp extends StatelessWidget {
  const SebhaApp({Key? key}) : super(key: key);
  // ignore: prefer_final_fields
  static int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff483123),
        centerTitle: true,
        elevation: 5,
        foregroundColor: Colors.amber,
        title: const Text(
          "تَسبِيح",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/background.jpg',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ZekrText(),
            StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  _whiteSpace(),
                  Text(
                    _counter.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        shadows: const [
                          Shadow(color: Colors.amber, blurRadius: 2)
                        ]),
                  ),
                  _whiteSpace(),
                  floatingButton(() {
                    _increaseCounter();
                    setState(() {});
                  }, Icons.add),
                  _whiteSpace(height: 10),
                  floatingButton(() {
                    _resetCounter();
                    setState(() {});
                  }, Icons.restore)
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  SizedBox floatingButton(void Function() onPressed, IconData icon) {
    return SizedBox(
      height: 52,
      width: 50,
      child: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: onPressed,
          child: Icon(
            icon,
            color: Colors.brown.shade600,
          )),
    );
  }

  SizedBox _whiteSpace({double height = 0}) {
    return SizedBox(
      height: (height == 0) ? 50 : height,
    );
  }

  void _increaseCounter() {
    _counter++;
  }

  void _resetCounter() {
    _counter = 0;
  }
}
