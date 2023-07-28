import 'package:flutter/material.dart';
import 'package:funny_monster/core/util/constants.dart';
import 'package:funny_monster/core/widgets/trivia_app_bar_widget.dart';
import 'package:funny_monster/features/presentation/widgets/feature_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buildBottomText(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildTriviaAppBarWidget(context),
              const SizedBox(height: 20),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  TriviaAppBarWidget _buildTriviaAppBarWidget(BuildContext context) {
    return TriviaAppBarWidget(
      context: context,
      withLeading: false,
      withAction: true,
      title: 'Choose your monster',
    );
  }

  Widget _buildBody(context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FeatureCard(
                  isLocked: true,
                  featureImage: Resources.future_feature,
                  featureName: "Future",
                  featureDescription: 'What about the future',
                  featureType: 'Future'),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    FeatureCard(
                      isExpanded: false,
                      featureImage: Resources.number_feature,
                      featureName: "Number",
                      featureDescription: 'Give me number and see the magic',
                      featureType: 'trivia',
                    ),
                    SizedBox(height: 10),
                    FeatureCard(
                      isExpanded: false,
                      featureImage: Resources.maths_feature,
                      featureName: "Maths",
                      featureDescription: 'Play with mathematics',
                      featureType: 'math',
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          FeatureCard(
            isExpanded: false,
            featureImage: Resources.date_feature,
            featureName: "Year",
            featureDescription: 'Give me the year, I\'ll give you the information',
            featureType: 'year',
          ),
        ],
      ),
    );
  }

  SizedBox _buildBottomText() {
    return SizedBox(
      height: 60,
      child: Center(
        child: Text(
          'Made with ❤️ to be reviewed by ALTOW team',
          style: TextStyle(fontFamily: Fonts.gilroyItalic, fontSize: 10, color: Colors.white.withOpacity(0.7)),
        ),
      ),
    );
  }
}
