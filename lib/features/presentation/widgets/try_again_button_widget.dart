import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_monster/core/util/constants.dart';
import 'package:funny_monster/features/presentation/bloc/trivia_bloc/trivia_bloc.dart';

class TryAgainButtonWidget extends StatelessWidget {
  const TryAgainButtonWidget({
    super.key,
    required this.textEditingController,
    required this.focusNode,
  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TriviaBloc, TriviaState>(
      builder: (context, state) {
        if (state is TriviaInitial) {
          return const SizedBox();
        } else {
          return SizedBox(
            height: 60,
            child: Center(
              child: InkWell(
                onTap: () {
                  BlocProvider.of<TriviaBloc>(context).add(ResetEvent());
                  textEditingController.clear();
                  focusNode.requestFocus();
                },
                child: DottedBorder(
                  strokeWidth: 2,
                  color: UIColors.white.withOpacity(0.5),
                  borderType: BorderType.RRect,
                  dashPattern: const [4, 6],
                  strokeCap: StrokeCap.round,
                  radius: const Radius.circular(10),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Try again', style: TextStyle(fontFamily: Fonts.averiaBold, fontSize: 21)),
                        SizedBox(width: 20),
                        FaIcon(
                          FontAwesomeIcons.arrowRotateRight,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
