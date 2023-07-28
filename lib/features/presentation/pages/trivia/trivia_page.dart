import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_monster/core/widgets/error_message_widget.dart';
import 'package:funny_monster/core/widgets/loading_widget.dart';
import 'package:funny_monster/core/widgets/trivia_app_bar_widget.dart';
import 'package:funny_monster/features/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:funny_monster/features/presentation/widgets/trivia_msg_widget.dart';
import 'package:funny_monster/features/presentation/widgets/trivia_text_from_field_widget.dart';
import 'package:funny_monster/features/presentation/widgets/try_again_button_widget.dart';

class TriviaPage extends StatefulWidget {
  final String featureName;
  final String featureDescription;
  final String triviaType;
  final String featureImage;
  const TriviaPage({
    Key? key,
    required this.featureImage,
    required this.featureName,
    required this.featureDescription,
    required this.triviaType,
  }) : super(key: key);

  @override
  State<TriviaPage> createState() => _TriviaPageState();
}

class _TriviaPageState extends State<TriviaPage> {
  TextEditingController triviaInputController = TextEditingController();
  FocusNode triviaFocusNode = FocusNode();
  final triviaFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    triviaInputController.dispose();
    triviaFocusNode.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TriviaBloc>(context).add(ResetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TriviaAppBarWidget(
                  context: context,
                  title: widget.featureName,
                  description: widget.featureDescription,
                ),
                const SizedBox(height: 20),
                Hero(tag: widget.featureName, child: Image.asset(widget.featureImage)),
                const SizedBox(height: 20),
                BlocBuilder<TriviaBloc, TriviaState>(
                  builder: (context, state) {
                    if (state is TriviaInitial) {
                      return _buildTriviaTextFromFieldWidget(context: context, featureName: widget.featureName);
                    }
                    if (state is TriviaLoadingState) {
                      return const LoadingWidget();
                    } else if (state is TriviaErrorState) {
                      return ErrorMessageWidget(message: state.msg);
                    } else if (state is TriviaLoadedState) {
                      return TriviaMsgWidget(msg: state.trivia.msg);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: TryAgainButtonWidget(textEditingController: triviaInputController, focusNode: triviaFocusNode),
      ),
    );
  }

  TriviaTextFromFieldWidget _buildTriviaTextFromFieldWidget({required BuildContext context, required String featureName}) {
    return TriviaTextFromFieldWidget(
      hintText: getTheHintByFeatureName(featureName),
      textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
      textDescription: getTheTextFieldDescriptionByFeatureName(featureName),
      triviaFocusNode: triviaFocusNode,
      triviaFormKey: triviaFormKey,
      triviaInputController: triviaInputController,
      validatorErrorText: 'The field must not be empty',
      onChanged: (value) => setState(() {}),
      onFieldSubmitted: (value) {
        if (triviaFormKey.currentState!.validate()) {
          BlocProvider.of<TriviaBloc>(context).add(GetTriviaEvent(number: triviaInputController.text, type: widget.triviaType));
        }
      },
    );
  }

  getTheHintByFeatureName(featureName) {
    switch (featureName) {
      case 'Future':
        return 'ex : year';
      case 'Number':
        return 'ex: 123';
      case 'Maths':
        return 'ex: 123';
      case 'Year':
        return 'ex : year';
    }
  }

  getTheTextFieldDescriptionByFeatureName(featureName) {
    switch (featureName) {
      case 'Future':
        return 'Write your birthday to Mr. Mystery Monster.';
      case 'Number':
        return 'Enter a number in the field below and Weaslly will tell you something interesting about it.';
      case 'Maths':
        return 'Give a positive or negative number';
      case 'Year':
        return 'Enter the date you have in mind now';
    }
  }
}
