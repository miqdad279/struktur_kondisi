import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  String jenis = "";
  double hasilKonversi = 0;
  String textCelcius = "";
  int radioValue = 0;

  void hitungKonversi() {
    if (textCelcius == "") {
      Fluttertoast.showToast(
          msg: 'Masukan nilai suhu yang akan di konversikan',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red[600],
          textColor: Colors.white);
      return;
    }
    double celcius = double.parse(textCelcius);
    if (radioValue == 1) {
      setState(() {
        jenis = 'Reamur';
        hasilKonversi = (4 / 5) * celcius;
      });
    } else if (radioValue == 2) {
      setState(() {
        jenis = 'Kelvin';
        hasilKonversi = 273 + celcius;
      });
    } else {
      setState(() {
        jenis = 'Fahrenheit';
        hasilKonversi = (9 / 5 * celcius) + 32;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Konversi Suhu'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.purple[100]),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          '\u00b0c',
                          style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              jenis == ""
                                  ? "Hasil Konversi"
                                  : "Hasil Konversi ke " +
                                      " adalah " +
                                      hasilKonversi.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(color: Colors.blue[100]),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Masukan Nilai Celcius",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            onChanged: (e) => textCelcius = e,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black54),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                "Pilih Konversi",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: radioValue,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  radioValue = 1;
                                });
                              },
                            ),
                            const Text(
                              'Reamur',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: radioValue,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  radioValue = 2;
                                });
                              },
                            ),
                            const Text(
                              'Kelvin',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 3,
                              groupValue: radioValue,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  radioValue = 3;
                                });
                              },
                            ),
                            const Text(
                              'Fahrenheit',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              hitungKonversi();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Hitung',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
