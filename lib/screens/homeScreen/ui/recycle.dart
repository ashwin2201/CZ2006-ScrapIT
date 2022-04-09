import 'package:flutter/material.dart';
import "dart:math";

import 'package:scrap_it/screens/homeScreen/ui/loader.dart';
//import 'globals.dart' as globals;

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
    return 'Ink and toner cartridges';
  else if (x == 'Lamps' || x == 'Bulbs' || x == 'Batteries')
    return ' Batteries and Lamps';
  else
    return 'ICT';
}


class RecyclePage extends StatelessWidget {
  //String textString = 'Hello world';
  //const MyApp({Key? key}) : super(key: key);

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

    return MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
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

    return Scaffold(
      appBar: AppBar(
        title: Text('SCRAP IT'),
        backgroundColor: Color(0xffb9fbC0),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            //a container can only have single child
            height: 100.0,
            width: 500.0,
            // margin: EdgeInsets.symmetric(vertical: 0.0),
            //color: Colors.yellow,
            child:const Center(
              //child:
              //alignment: Alignment.topCenter,
              child:  Text(
                "What do you wish to recycle today? ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 500,
            height: 30, //350
            // color: Colors.purple,
            child: MyStatefulWidget(),
          ),
          Container(
            //a container can only have single child
            height: 100.0, //100
            width: 500.0,
            // margin: EdgeInsets.symmetric(vertical: 0.0),
            //color: Colors.white,
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Fun Fact: \n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green,
                        )),
                    TextSpan(text: '$element', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 12,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)),
                  // padding: EdgeInsets.all(5),
                  primary: Color(0xffb9fbC0),

                  onPrimary: Colors.black, // foreground
                ),
                child: Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                }),
          )
        ],
      )),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  //const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Power Bank';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      alignment: AlignmentDirectional.center,
      style: const TextStyle(color: Colors.black, fontSize: 25),
      underline: Container(
        height: 2,
        //color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          x = dropdownValue;
        });
      },
      items: <String>[
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
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            child: SizedBox(
              width: 350.0, // for example
              child: Text(value, textAlign: TextAlign.center),
            ),
            value: value,
            alignment: AlignmentDirectional.center);
      }).toList(),
    );
  }
}

class SecondRoute extends  StatelessWidget{
  //SecondRoute({Key? key}) : super(key: key);
  
  String y = ewastetype(x);

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
  // get s => mystate;
    return Scaffold(
        appBar: AppBar(
          title: Text('SCRAP IT'),
          backgroundColor: Color(0xffb9fbC0),
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
            child: Center(
              //child:
              //alignment: Alignment.topCenter,

              child: Text(
                "So, you have decided to recycle $y type of E-waste today!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            child: Image.network(
                ("https://i.pinimg.com/originals/6b/63/0a/6b630a90cd0ccbbccda9e66db19fbfff.gif")),
          ),
          Container(
            height: 50,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)),
                  // padding: EdgeInsets.all(5),
                  primary: Color(0xffb9fbC0),

                  onPrimary: Colors.black, // foreground
                ),
                child: Text('View nearby recycling stations'),
                onPressed: () {}),
          ),
          Container(
            height: 30,
            width: 300,
          ),
          Container(
            height: 50,
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 16,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1000)),
                  // padding: EdgeInsets.all(5),
                  primary: Color(0xffb9fbC0),

                  onPrimary: Colors.black, // foreground
                ),
                child: Text('Already Recycled? Verify here'),
                onPressed: () {
                  navigator.push(
                    MaterialPageRoute(
                      builder: (context) => 
                        Loader()
                    )
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}