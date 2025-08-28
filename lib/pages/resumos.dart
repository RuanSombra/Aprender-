import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:sp_module_c_project/controllers/app.dart';
import 'package:sp_module_c_project/styles/styles.dart';

class Resumos extends StatefulWidget {
  const Resumos({super.key});

  @override
  State<Resumos> createState() => _ResumosState();
}

class _ResumosState extends State<Resumos> {
  Color cor = Cores.branco;
  FlutterSoundRecorder recorder = FlutterSoundRecorder();
  FlutterSoundPlayer player = FlutterSoundPlayer();

  gravar() async {
    if (recorder.isRecording) {
      cor = Cores.branco;
      setState(() {});

      await recorder.stopRecorder();
      App.resumos.insert(0, {
        'titulo': '${DateTime.now().millisecondsSinceEpoch}.aac',
        'desc': 'Descrição ${App.resumos.length + 1}',
      });

      setState(() {});
    } else {
      cor = Colors.red;
      setState(() {});
      await recorder.startRecorder(
        codec: Codec.aacMP4,
        toFile: '${DateTime.now().millisecondsSinceEpoch}.aac',
      );
    }

    setState(() {});
  }

  play() async {
    if (player.isPlaying) {}
  }

  @override
  void initState() {
    recorder.openRecorder();
    player.openPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Meus resumos')),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: App.resumos.isEmpty
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: .2,
                minHeight: 10,
                borderRadius: BorderRadius.circular(999),
              ),
              Container(height: 16),
              App.resumos.isEmpty
                  ? Text(
                      'Grave seus resumos e salve aqui',
                      style: TextStyle(
                        color: Cores.preto,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  : Column(
                      children: [
                        for (var resumo in App.resumos)
                          ListTile(
                            leading: Icon(Icons.play_arrow),
                            trailing: Icon(Icons.delete),
                            title: Text(resumo['titulo']),
                            subtitle: Text(resumo['desc']),
                          ),
                      ],
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Cores.azulClaro,
        onPressed: () => gravar(),
        child: Icon(Icons.mic, color: cor),
      ),
    );
  }
}
