import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class BlackPianoPage extends StatelessWidget {
  final text;
  final number;
  const BlackPianoPage({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.5),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.black,
            ),
          ),
          onPressed: () {
            AudioPlayer().play(
              AssetSource('notes/note$number.wav'),
            );
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
