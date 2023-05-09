import 'package:flutter/material.dart';

class MessageFielBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFielBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineImputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineImputBorder,
      focusedBorder: outlineImputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      onTapOutside: ((event) => focusNode.unfocus()),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
