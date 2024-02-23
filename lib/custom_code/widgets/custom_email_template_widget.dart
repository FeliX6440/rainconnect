// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomEmailTemplateWidget extends StatefulWidget {
  const CustomEmailTemplateWidget({
    super.key,
    this.width,
    this.height,
    required this.valuePlaceHolder,
  });

  final double? width;
  final double? height;
  final List<String> valuePlaceHolder;

  @override
  State<CustomEmailTemplateWidget> createState() =>
      _CustomEmailTemplateWidgetState();
}

class _CustomEmailTemplateWidgetState extends State<CustomEmailTemplateWidget> {
  final List<String> _templateValue = [
    '{first_name}',
    '{last_name}',
    '{email}'
  ];

  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final FocusNode _subjectNode = FocusNode();
  final FocusNode _bodyNode = FocusNode();

  @override
  void initState() {
    _subjectController.addListener(() {});
    _bodyController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _bodyController.dispose();
    _subjectController.dispose();
    _subjectNode.dispose();
    _bodyNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextFormField(
              controller: _subjectController,
              focusNode: _subjectNode,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: 'Email Subject Line',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 2,
                      // color: ,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 2, color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _bodyController,
              focusNode: _bodyNode,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Email Body',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 2,
                      // color: ,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(width: 2, color: Colors.grey)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Row(
                children: List.generate(
                    widget.valuePlaceHolder.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              if (_subjectNode.hasFocus) {
                                _subjectController.text =
                                    _subjectController.text +
                                        _templateValue[index];
                                _subjectController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset:
                                            _subjectController.text.length));
                              } else if (_bodyNode.hasFocus) {
                                _bodyController.text = _bodyController.text +
                                    _templateValue[index];
                                _bodyController.selection =
                                    TextSelection.fromPosition(TextPosition(
                                        offset: _bodyController.text.length));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                              child: Text(widget.valuePlaceHolder[index]),
                            ),
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
