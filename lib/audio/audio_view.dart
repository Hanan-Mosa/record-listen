import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class AudioView extends StatefulWidget {
  const AudioView({super.key});

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  FlutterSoundRecorder? audioRecorder;
  FlutterSoundPlayer? audioPlayer;

  bool isRecording = false;
  bool isPlaying = false;
  bool recorded = false;

  String? audioPath;

  @override
  void initState() {
    super.initState();
    audioPlayer = FlutterSoundPlayer();
    audioRecorder = FlutterSoundRecorder();
    initAudio();
  }

  Future initAudio() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Permission denied';
    }
    setState(() {});
  }

  Future startRecording() async {
    audioRecorder!.openRecorder();
    await audioRecorder!.startRecorder(
      toFile: '${Directory.systemTemp.path}/my_record.aac',
      codec: Codec.aacADTS,
    );
    setState(() {
      isRecording = true;
    });
  }

  Future stopRecording() async {
    String? path = await audioRecorder!.stopRecorder();
    setState(() {
      isRecording = false;
      recorded = true;
      if (path != null) {
        audioPath = path;
      }
    });
  }

  Future playAudio() async {
    audioPlayer!.openPlayer();
    if (audioPath != null) {
      await audioPlayer!.startPlayer(fromURI: audioPath, codec: Codec.aacADTS);
      setState(() {
        isPlaying = true;
      });
    }
  }

  Future pauseAudio() async {
    if (isPlaying) {
      await audioPlayer!.stopPlayer();
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  void dispose() async {
    await audioRecorder!.closeRecorder();
    await audioPlayer!.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: Text('Record & Listen'),
          centerTitle: true,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton(
              onPressed: isRecording ? stopRecording : startRecording,
              child:
                  isRecording ? Text('Stop recording') : Text('Record Audio')),
          SizedBox(height: 20),
          if (audioPath != null && recorded)
                  if (audioPath != null && recorded)
            FilledButton(
                onPressed: isPlaying ? pauseAudio : playAudio,
                child: isPlaying ? Text('Pause Audio') : Text('Play Audio')),
        ])));
  }
}
