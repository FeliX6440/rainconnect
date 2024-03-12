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

import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:dio/dio.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:record/record.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class SpeechToTextWidget extends StatefulWidget {
  const SpeechToTextWidget({
    super.key,
    this.width,
    this.height,
    required this.recordButtonHeight,
    required this.recordButtonWidth,
    required this.glowColor,
    required this.buttonColor,
    required this.resetButtonColor,
    required this.dropdownListValue,
    required this.isEdit,
    required this.leadRef,
  });

  final double? width;
  final double? height;
  final double recordButtonHeight;
  final double recordButtonWidth;
  final Color glowColor;
  final Color buttonColor;
  final Color resetButtonColor;
  final List<String> dropdownListValue;
  final bool isEdit;
  final DocumentReference leadRef;

  @override
  State<SpeechToTextWidget> createState() => _SpeechToTextWidgetState();
}

class _SpeechToTextWidgetState extends State<SpeechToTextWidget> {
  final SpeechToText speechToText = SpeechToText();
  bool _isAnimate = false;
  String text = '';
  bool available = false;
  TextEditingController _textEditingController = TextEditingController();

  bool _isLoading = false;
  bool _isSummaryLoading = false;
  String? _dropDownValue;
  late Dio _dio;
  Map<String, dynamic> header = {'Content-Type': 'application/json'};
  late final AudioRecorder _recorder;
  String _audioPath = '';
  bool _transcribing = false;
  String _initialFieldValue = '';
  bool _isDocLoading = false;

  Future<void> _translateWord() async {
    setState(() {
      _isLoading = true;
    });
    await _dio
        .postUri(
            Uri.parse("https://rainconnect-cool-api.onrender.com/translate"),
            data: {
              'text': _textEditingController.text,
              'lang': _dropDownValue ?? 'English'
            },
            options: Options(
              headers: header,
            ))
        .then((value) {
      _textEditingController.text = value.data['text'];
      setState(() {
        _isLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _isLoading = false;
      });
      print(error);
    });
  }

  Future<void> _summarizeWord() async {
    setState(() {
      _isSummaryLoading = true;
    });
    await _dio
        .postUri(
            Uri.parse("https://rainconnect-cool-api.onrender.com/summarize"),
            data: {
              'text': _textEditingController.text,
            },
            options: Options(
              headers: header,
            ))
        .then((value) {
      _textEditingController.text = value.data['text'];
      setState(() {
        _isSummaryLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        _isSummaryLoading = false;
      });
      print(error);
    });
  }

  @override
  void initState() {
    OpenAI.apiKey = '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';
    _recorder = AudioRecorder();
    _dio = Dio();
    Future.microtask(() async {
      if (widget.isEdit) {
        setState(() {
          _isDocLoading = true;
        });
        try {
          await FirebaseFirestore.instance
              .collection('component_content')
              .where('lead_ref', isEqualTo: widget.leadRef)
              .where('type', isEqualTo: 'SpeechToText')
              .get()
              .then(
            (value) {
              setState(() {
                _initialFieldValue =
                    value.docs.first.data()['content'].toString();
                _textEditingController.text =
                    value.docs.first.data()['content'].toString();
              });
            },
          );
        } catch (e) {
          print(e.toString());
        }
        setState(() {
          _isDocLoading = false;
        });
      }

      // available = await speechToText.initialize();
      setState(() {});
    });
    _textEditingController.addListener(() {
      FFAppState().audioTextResult = _textEditingController.text;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: _isDocLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                AvatarGlow(
                  glowBorderRadius: BorderRadius.circular(5),
                  glowColor: widget.glowColor,
                  glowShape: BoxShape.rectangle,
                  animate: _isAnimate,
                  curve: Curves.linear,
                  glowCount: 1,
                  glowRadiusFactor: 0.2,
                  child: GestureDetector(
                    onTap: () async {
                      if (await _recorder.isRecording()) {
                        setState(() {
                          _isAnimate = false;
                        });

                        final result = await _recorder.stop();
                        if (result != null) {
                          setState(() {
                            _transcribing = true;
                          });
                          final transcription =
                              await OpenAI.instance.audio.createTranscription(
                            file: File(result),
                            model: "whisper-1",
                            responseFormat: OpenAIAudioResponseFormat.text,
                          );
                          _textEditingController.text =
                              _textEditingController.text + transcription.text;
                          setState(() {
                            _transcribing = false;
                          });
                        }
                      } else {
                        setState(() {
                          _isAnimate = true;
                        });

                        if (await _recorder.hasPermission()) {
                          try {
                            final dir =
                                await getApplicationDocumentsDirectory();
                            _audioPath =
                                '${dir.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
                            await _recorder.start(
                                RecordConfig(encoder: AudioEncoder.aacLc),
                                path: _audioPath);
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          showSnackbar(
                            context,
                            'You have not provided permission to record audio.',
                          );
                        }
                      }
                    },
                    child: SizedBox(
                      height: widget.recordButtonHeight,
                      width: widget.recordButtonWidth,
                      child: AvatarGlow(
                          glowBorderRadius: BorderRadius.circular(5),
                          glowColor: widget.glowColor,
                          glowShape: BoxShape.rectangle,
                          animate: _isAnimate,
                          curve: Curves.linear,
                          glowCount: 1,
                          glowRadiusFactor: 0.2,
                          child: Stack(
                            children: [
                              Card(
                                child: Center(
                                  child: _isAnimate
                                      ? const Icon(
                                          Icons.mic,
                                          size: 35,
                                        )
                                      : const Icon(
                                          Icons.mic_off,
                                          size: 35,
                                        ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: Visibility(
                                  visible: _isAnimate,
                                  child: AvatarGlow(
                                    glowBorderRadius: BorderRadius.circular(20),
                                    glowColor: Colors.red,
                                    glowShape: BoxShape.rectangle,
                                    animate: _isAnimate,
                                    curve: Curves.linear,
                                    glowCount: 2,
                                    glowRadiusFactor: 0.6,
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextFormField(
                    controller: _textEditingController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                          onTap: () {
                            FFAppState().audioTextResult = '';
                            _textEditingController.clear();
                          },
                          child: const Icon(Icons.clear)),
                      hintText: 'Output voice',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 2,
                            color: widget.glowColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 2, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                _transcribing ? LinearProgressIndicator() : SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        title: 'Translate',
                        onTap: _translateWord,
                        isLoading: _isLoading,
                        color: widget.buttonColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(.3)),
                        child: DropdownButton<String>(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            underline: const SizedBox(),
                            value: _dropDownValue,
                            hint: const Text('Select Lang'),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            items: widget.dropdownListValue.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _dropDownValue = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AppButton(
                  color: widget.buttonColor,
                  title: 'Summarize',
                  onTap: _summarizeWord,
                  isLoading: _isSummaryLoading,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppButton(
                  color: widget.resetButtonColor,
                  title: 'Reset',
                  onTap: () {
                    _textEditingController.text = _initialFieldValue;
                  },
                  isLoading: false,
                ),
              ],
            ),
    );
  }
}

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String title;
  final Color color;
  const AppButton({
    super.key,
    required this.onTap,
    required this.isLoading,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3.5,
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
