import 'package:flutter/material.dart';
import 'package:funny_monster/core/util/constants.dart';

class PremiumFeatureBottomSheetWidget extends StatelessWidget {
  const PremiumFeatureBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      decoration: const BoxDecoration(
          gradient: RadialGradient(
        colors: [
          UIColors.darkGreen,
          Colors.black,
        ],
      )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(Resources.locked_feature_monster),
          const SizedBox(height: 20),
          const Text(
            'Unlock feature',
            style: TextStyle(fontSize: 35, fontFamily: Fonts.paytoneOne),
          ),
          Text(
            'If you like the app, you have to hire me first in order to unlock all features.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontFamily: Fonts.averiaRegular, color: Colors.white.withOpacity(0.7)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff38928D)),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'I got it',
                style: TextStyle(fontFamily: Fonts.gilroyBold, fontSize: 21, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
