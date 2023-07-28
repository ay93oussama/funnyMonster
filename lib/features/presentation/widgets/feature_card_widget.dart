import 'package:flutter/material.dart';
import 'package:funny_monster/core/widgets/premium_feature_bottom_sheet_widget.dart';
import 'package:funny_monster/features/presentation/pages/trivia/trivia_page.dart';

class FeatureCard extends StatelessWidget {
  final String featureImage;
  final String featureName;
  final String featureDescription;
  final String featureType;
  final bool isExpanded;
  final bool isLocked;

  const FeatureCard(
      {Key? key,
      this.isLocked = false,
      this.isExpanded = true,
      required this.featureImage,
      required this.featureName,
      required this.featureDescription,
      required this.featureType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isExpanded ? 1 : 0,
      child: InkWell(
        onTap: () => isLocked
            ? showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const PremiumFeatureBottomSheetWidget();
                })
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TriviaPage(
                          featureName: featureName,
                          featureDescription: featureDescription,
                          triviaType: featureType,
                          featureImage: featureImage,
                        ))),
        child: Hero(tag: featureName, child: Image.asset(featureImage)),
      ),
    );
  }
}
