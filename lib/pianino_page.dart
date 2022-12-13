// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pianino/buttons/black_button.dart';
import 'package:pianino/server/button_data.dart';
import 'package:pianino/buttons/white_button.dart';

class PianinoPage extends StatefulWidget {
  const PianinoPage({Key? key}) : super(key: key);

  @override
  State<PianinoPage> createState() => _PianinoPageState();
}

double _widthRatio = 0.0;
bool _showLabels = true;

class _PianinoPageState extends State<PianinoPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SizedBox(
          height: 20,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                const Text('Change Width'),
                Slider(
                  activeColor: Colors.redAccent,
                  inactiveColor: Colors.white,
                  min: 0.0,
                  max: 5.0,
                  value: _widthRatio,
                  onChanged: (double value) =>
                      setState(() => _widthRatio = value),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Show Labels"),
                  trailing: Switch(
                    value: _showLabels,
                    onChanged: (bool value) => setState(() {
                      _showLabels = value;
                    }),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Flutter Piano'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Center(
              child: Text('do re mi fa ...'),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, i) {
                final button = buttons[i];
                return Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        PianoWhitePage(number: 'do', text: 'A1'),
                        PianoWhitePage(number: 're', text: 'B1'),
                        PianoWhitePage(number: 'mi', text: 'C1'),
                        PianoWhitePage(number: 'fa', text: 'D1'),
                        PianoWhitePage(number: 'sol', text: 'E1'),
                        PianoWhitePage(number: 'lya', text: 'F1'),
                        PianoWhitePage(number: 'si', text: 'G1'),
                        PianoWhitePage(number: 'do2', text: 'A2'),
                        PianoWhitePage(number: 'do', text: 'B2'),
                        PianoWhitePage(number: 're', text: 'C2'),
                        PianoWhitePage(number: 'mi', text: 'D2'),
                        PianoWhitePage(number: 'fa', text: 'E2'),
                        PianoWhitePage(number: 'sol', text: 'F2'),
                        PianoWhitePage(number: 'lya', text: 'G2'),
                        PianoWhitePage(number: 'si', text: 'G2'),
                        PianoWhitePage(number: 'do2', text: 'G2'),
                      ],
                    ),
                    Positioned(
                        left: 40,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            BlackPianoPage(number: 1, text: 'A#1'),
                            BlackPianoPage(number: 2, text: 'B#1'),
                            SizedBox(width: 80),
                            BlackPianoPage(number: 3, text: 'C#1'),
                            BlackPianoPage(number: 4, text: 'D#1'),
                            BlackPianoPage(number: 5, text: 'E#1'),
                            SizedBox(width: 80),
                            BlackPianoPage(number: 6, text: 'F#1'),
                            BlackPianoPage(number: 7, text: 'G#1'),
                            SizedBox(width: 85),
                            BlackPianoPage(number: 1, text: 'A#2'),
                            BlackPianoPage(number: 2, text: 'B#2'),
                            BlackPianoPage(number: 3, text: 'C#2'),
                            SizedBox(width: 80),
                            BlackPianoPage(number: 4, text: 'D#2'),
                            // BlackPianoPage(button: button),
                            // BlackPianoPage(button: button),
                          ],
                        ))
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
