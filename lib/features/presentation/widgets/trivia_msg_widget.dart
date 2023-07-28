import 'package:flutter/material.dart';
import 'package:funny_monster/core/util/constants.dart';

class TriviaMsgWidget extends StatelessWidget {
  final String msg;
  const TriviaMsgWidget({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: UIColors.darkGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: UIColors.white.withOpacity(0.1)),
      ),
      child: Center(
        child: Text(
          msg,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30, fontFamily: Fonts.averiaRegular),
        ),
      ),
    );
  }
}
