import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  String audioPath = '';

  @override
  void initState() {
    audioRecord = Record();
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    audioRecord.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Record Audio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isRecording)
              const Text(
                "Recoding in Progress",
                style: TextStyle(fontSize: 20),
              ),
            ElevatedButton(
                onPressed: isRecording ? stopRecording : startRecording,
                child: isRecording
                    ? const Text('Stop Recording')
                    : const Text('Start Recording')),
            const SizedBox(
              height: 25,
            ),
            if (!isRecording && audioPath != null)
              ElevatedButton(
                onPressed: playRecording,
                child: const Text('Play Recording'),
              )
          ],
        ),
      ),
    );
  }

  Future<void> startRecording() async {
    try {
      print('Start Recording...');
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print('Error when starting recording: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      print(path);
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
    } catch (e) {
      print('Error when stop recording: $e');
    }
  }

  Future<void> playRecording() async {
    try {
      print('Play Recording...');
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Error while play recording: $e');
    }
  }
}
