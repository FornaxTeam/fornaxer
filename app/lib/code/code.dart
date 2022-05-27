import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CodeView extends StatefulWidget {
  const CodeView({Key? key}) : super(key: key);

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  int _lines = 0;

  void _updateLines(String value) {
    setState(() {
      _lines = value.split('\n').length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _LineNumberColumn(
                lines: _lines,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _CodeField(
                  controller: _controller,
                  scrollController: _scrollController,
                  onChanged: (value) => _updateLines(value),
                ),
              ),
            ]),
      ),
    );
  }
}

class _LineNumberColumn extends StatelessWidget {
  final int lines;
  const _LineNumberColumn({Key? key, this.lines = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: List.generate(lines, (i) {
            final display = i + 1;
            return TextSpan(
              text: i == lines - 1 ? '$display' : '$display\n',
            );
          }),
        ),
        style: const TextStyle(color: Colors.grey, height: 1.5, fontSize: 24),
      ),
    );
  }
}

class _CodeField extends StatelessWidget {
  final TextEditingController? controller;
  final ScrollController? scrollController;
  final ValueChanged<String>? onChanged;
  const _CodeField(
      {Key? key, this.controller, this.scrollController, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 500),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Code',
          fillColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
        ),

        onChanged: onChanged,
        maxLines: null,
        // Disable scrolling
        scrollPadding: EdgeInsets.zero,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        enableSuggestions: false,
        keyboardType: TextInputType.multiline,
        style: const TextStyle(fontSize: 24, height: 1.5),
        onSubmitted: (value) {
          if (kDebugMode) {
            print(value);
          }
        },
      ),
    );
  }
}
