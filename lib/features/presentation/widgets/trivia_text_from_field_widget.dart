import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funny_monster/core/util/constants.dart';

class TriviaTextFromFieldWidget extends StatefulWidget {
  final GlobalKey<FormState> triviaFormKey;
  final FocusNode triviaFocusNode;
  final TextEditingController triviaInputController;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final String hintText;
  final String validatorErrorText;
  final String textDescription;
  final List<TextInputFormatter> textInputFormatter;

  const TriviaTextFromFieldWidget({
    Key? keys,
    required this.onChanged,
    required this.hintText,
    required this.onFieldSubmitted,
    required this.textDescription,
    required this.triviaFocusNode,
    required this.triviaFormKey,
    required this.triviaInputController,
    required this.validatorErrorText,
    required this.textInputFormatter,
  }) : super(key: keys);

  @override
  State<TriviaTextFromFieldWidget> createState() => _TriviaTextFromFieldWidgetState();
}

class _TriviaTextFromFieldWidgetState extends State<TriviaTextFromFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: widget.triviaFormKey,
          child: TextFormField(
            focusNode: widget.triviaFocusNode,
            keyboardType: const TextInputType.numberWithOptions(signed: true),
            inputFormatters: widget.textInputFormatter,
            style: const TextStyle(fontFamily: Fonts.averiaBold, color: Colors.white, fontSize: 22),
            controller: widget.triviaInputController,
            onChanged: widget.onChanged, //(value) => setState(() {}),
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Colors.redAccent),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: UIColors.darkGrey, width: 3.0),
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 22, fontFamily: Fonts.averiaBold, color: Colors.white.withOpacity(0.7)),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              filled: widget.triviaInputController.text.isEmpty ? true : false,
              fillColor: UIColors.darkGrey,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: UIColors.darkGrey, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: UIColors.darkGrey, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.validatorErrorText;
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 7),
        Text(
          widget.textDescription,
          style: TextStyle(fontFamily: Fonts.gilroyItalic, color: UIColors.white.withOpacity(0.7), fontSize: 13),
        )
      ],
    );
  }
}
