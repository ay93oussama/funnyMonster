import 'package:flutter/material.dart';
import 'package:funny_monster/core/util/constants.dart';
import 'package:funny_monster/core/widgets/premium_feature_bottom_sheet_widget.dart';

class TriviaAppBarWidget extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String? description;
  final bool withLeading;
  final bool withAction;
  const TriviaAppBarWidget({
    Key? key,
    required this.context,
    required this.title,
    this.description,
    this.withLeading = true,
    this.withAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: withLeading,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: UIColors.darkGrey,
            child: IconButton(
              icon: Image.asset(
                Resources.arrow_left,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontFamily: Fonts.paytoneOne, fontSize: 36, height: 1),
              ),
              Visibility(
                visible: description != null,
                child: Text(
                  '$description',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: Fonts.averiaRegular, fontSize: 18, color: UIColors.white.withOpacity(0.7)),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: withAction,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: UIColors.darkGrey,
            child: IconButton(
                icon: Image.asset(
                  Resources.crown,
                  width: 22,
                ),
                onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return const PremiumFeatureBottomSheetWidget();
                    })),
          ),
        )
      ],
    );
  }
}
