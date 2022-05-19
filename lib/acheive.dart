import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:website/design_helper.dart';

class Achieve extends StatelessWidget {
  const Achieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final _contentHeight = _height * 0.5;
    final _contentWidth = _width * 0.95;



    return Scrollbar(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(_contentWidth, _contentHeight),
            _onlyText(_contentWidth, _contentHeight,
                'Achieve will help you organise your training'),
            _bullets(_contentWidth, _contentHeight, 'Three types of services:',
                ['Courses', 'Team training', 'Personal coach']),
            _service(
                _contentWidth,
                _contentHeight,
                'Courses',
                ['Fixed number of sessions', 'All focus on a specific skill'],
                'home.png'),
            _service(
                _contentWidth,
                _contentHeight,
                'Team Training',
                [
                  'Work out together with others',
                  'Perform sessions and compare results/development within the group,'
                ],
                'home.png'),
            _service(
                _contentWidth,
                _contentHeight,
                'Personal coach',
                [
                  'A fitted plan according to your schedule',
                  'An individual training plan',
                  'Individually fitted sessions just for you'
                ],
                'home.png'),
            _joinOn(_contentWidth, _contentHeight, 'Three types of services:',
                ['android.png', 'Apple-logo.png']),
          ],
        ),
      ),
    );
  }
}

Widget _joinOn(
    double _width, double _height, String header, List<String> assets) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Material(
      elevation: 6,
      child: SizedBox(
        width: _width,
        height: _height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(header),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var s in assets)
                  SizedBox(
                      width: _width * 0.25,
                      height: _width * 0.25,
                      child: Image.asset(s))
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget _service(double _width, double _height, String header,
    List<String> _text, String _asset) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Material(
      elevation: 6,
      child: SizedBox(
        width: _width,
        height: _height,
        child: Column(
          children: [
            GradientText(header,
                style: const TextStyle(
                  fontSize: 35,
                ),
                colors: const [
                  //Colors.purple,
                  Colors.pink,
                  Colors.deepOrangeAccent,
                  Colors.yellow
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: _width * 0.4,
                  height:_height*0.5,
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(20),
                      1: IntrinsicColumnWidth(),
                      //1: FlexColumnWidth(),
                    },
                    children: [
                      for (var x in _text)
                        TableRow(children: [
                          const TableCell(
                            child: Text('*'),
                          ),
                          TableCell(child: Text(x, style: DesignHelper.bulletText())),
                        ])
                    ],
                  ),
                ),
                SizedBox(
                    width: _width * 0.4,
                    height: _width * 0.4,
                    child: Image.asset(_asset))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _bullets(
    double _width, double _height, String header, List<String> _text) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Material(
      elevation: 6,
      child: Center(
        child: SizedBox(
          width: _width,
          height: _height,
          child: Column(
            children: [
              GradientText('Focus; PT-Portal',
                  style: const TextStyle(fontSize: 40),
                  colors: const [
                    Colors.purple,
                    Colors.pink,
                    Colors.deepOrangeAccent,
                    Colors.yellow
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(50),
                      1: IntrinsicColumnWidth(),
                      //1: FlexColumnWidth(),
                    },
                    children: [
                      for (var x in _text)
                        TableRow(children: [
                          const TableCell(
                            child: Text('*'),
                          ),
                          TableCell(child: Text(x, style: DesignHelper.bulletText())),
                        ])
                    ],
                  ),
                  SizedBox(
                      width: _width * 0.4,
                      height: _width * 0.4,
                      child: Image.asset('logo.png'))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _onlyText(double _width, double _height, String _text) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Material(
      elevation: 6,
      child: SizedBox(
        width: _width,
        height: _height,
        child: Center(
          child: GradientText(
            _text,
            style: const TextStyle(
              fontSize: 40,
            ),
            gradientDirection: GradientDirection.ltr,
            colors: const [
              Colors.pinkAccent,
              Colors.orangeAccent,
              Colors.yellowAccent,
              Colors.lightBlue
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _header(double _width, double _height) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Material(
      elevation: 6,
      child: SizedBox(
        width: _width,
        height: _height,
        child: Center(
          child: GradientText(
            'Achieve',
            style: const TextStyle(
              fontSize: 60,
            ),
            gradientDirection: GradientDirection.ltr,
            colors: const [
              Colors.pinkAccent,
              Colors.orangeAccent,
              Colors.yellowAccent,
            ],
          ),
        ),
      ),
    ),
  );
}
