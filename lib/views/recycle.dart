import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrap_it/pathsAndConsts.dart';
import 'package:scrap_it/views/Verification.dart';
import "dart:math";
import 'package:scrap_it/views/stationlistScreen.dart';

T getRandomElement<T>(List<T> list) {
  final random = new Random();
  int i = random.nextInt(list.length);
  return list[i];
}

String x = '';

String ewastetype(x) {
  if (x == 'Mobile' ||
      x == 'Power Bank' ||
      x == 'Printer' ||
      x == 'Computer' ||
      x == 'Laptops')
    return 'ICT';
  else if (x == 'Ink' || x == 'Toner' || x == 'Printer Cartridges')
    return 'ink and toner cartridges';
  else if (x == 'Lamps' || x == 'Bulbs' || x == 'Batteries')
    return 'batteries and lamps';
  else
    return 'ICT equipments';
}

class RecyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> strArr = [
      'One ton of recycled cardboard saves 46 gallons of oil',
      '2.5 million plastic bottles are thrown away every hour in America',
      'Glass is 100% recyclable and can be recycled endlessly without loss in quality or purity',
      'Recycling a stack of newspaper just 3 feet high saves one tree',
      'Recycling a single aluminum can saves enough energy to power a TV for 3 hours',
      'A glass container can go from a recycling bin to a store shelf in as few as 30 days!',
      ' It is estimated that the annual amount of E-waste will exceed 74 million tonnes in 2030!',
      'Recycling e-waste can save enough energy to power thousands of homes per year!'
    ];
    String element = getRandomElement(strArr);

    return MaterialApp(
        debugShowCheckedModeBanner: false, home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> strArr = [
      'One ton of recycled cardboard saves 46 gallons of oil.',
      '2.5 million plastic bottles are thrown away every hour in America.',
      'Glass is 100% recyclable and can be recycled endlessly without loss in quality or purity.',
      'Recycling a stack of newspaper just 3 feet high saves one tree.',
      'Recycling a single aluminum can saves enough energy to power a TV for 3 hours.',
      'A glass container can go from a recycling bin to a store shelf in as few as 30 days!',
      'It is estimated that the annual amount of E-waste will exceed 74 million tonnes in 2030!',
      'Recycling e-waste can save enough energy to power thousands of homes per year!'
    ];
    String element = getRandomElement(strArr);

    return Scaffold(
      appBar: appbardefault,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
              child: const Center(
                //child:
                //alignment: Alignment.topCenter,
                child: Text(
                  "What do you wish to recycle today? ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            MyStatefulWidget(),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 50),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'Did you know? \n\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.green),
                      ),
                      TextSpan(
                          text: element, style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              //margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(800)),
                      // padding: EdgeInsets.all(5),
                      minimumSize: const Size(150, 55),
                      textStyle: const TextStyle(fontSize: 24),
                      primary: Colors.green),
                  child: const Text('Next'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var items = [
    'Power Bank',
    'Printer',
    'Computer',
    'Laptops',
    'Mobile',
    'Lamps',
    'Ink',
    'Toner',
    'Printer Cartridges',
    'Bulbs',
    'Batteries'
  ];
  String dropdownvalue = 'Power Bank';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items,textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              dropdownvalue = newValue;
              x = dropdownvalue;
            });
          },
        ),
      ],
    ));
  }
}

class SecondRoute extends StatelessWidget {
  //SecondRoute({Key? key}) : super(key: key);

  String y = ewastetype(x);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbardefault,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 0),
              child: Center(
                child: Text(
                  "So, you have decided to recycle $y today!",
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              child: Image.network(
                ("https://i.pinimg.com/originals/6b/63/0a/6b630a90cd0ccbbccda9e66db19fbfff.gif"),
                height: 270,
                width: 270,
              ),
            ),
            Container(
              height: 50,
              width: 350,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    // padding: EdgeInsets.all(5),
                    primary: button_green,
                    onPrimary: text_heading, // foreground
                  ),
                  child: const Text(
                    'View list of e-waste recycling stations',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    navigator.push(MaterialPageRoute(
                        builder: (context) => ListAllStnScreen()));
                  }),
            ),
            Container(
              height: 50,
              width: 350,
              margin: const EdgeInsets.only(top: 25),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    // padding: EdgeInsets.all(5),
                    primary: button_green,
                    onPrimary: text_heading, // foreground
                  ),
                  child: const Text(
                    'Already Recycled? Verify here!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    navigator.push(MaterialPageRoute(
                        builder: (context) => VerificationPage()));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
