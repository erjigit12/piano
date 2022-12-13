// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_string_interpolations

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PianoWhitePage extends StatelessWidget {
  final String number;
  final String text;

  const PianoWhitePage({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 80,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => Colors.white,
            ),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.pressed)
                    ? const Color.fromARGB(255, 189, 186, 186)
                    : null;
              },
            ),
          ),
          onPressed: () {
            AudioPlayer().play(
              AssetSource('note/$number.mp3'),
            );
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
