import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sebha/edit_dialog.dart';
import 'package:sebha/zekr_text.dart';

class SebhaApp extends StatefulWidget {
  const SebhaApp({Key? key}) : super(key: key);

  @override
  State<SebhaApp> createState() => _SebhaAppState();
}

class _SebhaAppState extends State<SebhaApp> {
  int _counter = 0;
  int textLength = 15;
  String zikr = ' سُبْحَانَ اللّهِ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xff483123),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xff483123),
        ),
        foregroundColor: Colors.amber,
        title: const Text(
          "تَسبِيح",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.amber),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * .9,
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
            InkWell(
                onTap: () {
                  _increaseCounter();
                  HapticFeedback.mediumImpact();
                  setState(() {});
                },
                child: ZekrText(
                  lenghtOfText: textLength,
                  text: zikr,
                )),
            Column(
              children: [
                _whiteSpace(),
                Text(
                  _counter.toString(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.amber,
                      fontSize: 25,
                      shadows: const [
                        Shadow(color: Colors.amber, blurRadius: 2)
                      ]),
                ),
                _whiteSpace(height: 50),
                // *** edit
                floatingButton(tooltip: 'تعديل الذكر', () async {
                  zikr = (await _showDialog(context)) ?? zikr;
                }, Icons.edit),

                _whiteSpace(height: 10),

                // *** reset
                floatingButton(tooltip: 'اعادة الى الصفر', () {
                  _resetCounter();
                  setState(() {});
                }, Icons.restore),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox floatingButton(void Function() onPressed, IconData icon,
      {String tooltip = ''}) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
          tooltip: tooltip,
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

  Future<String?> _showDialog(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      builder: (context) {
        return const EditDialog();
      },
    );
  }
}
