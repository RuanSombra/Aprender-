import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_module_c_project/controllers/app.dart';
import 'package:sp_module_c_project/styles/styles.dart';
import 'package:video_player/video_player.dart';

class Detalhes extends StatefulWidget {
  const Detalhes({super.key});

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (route) => false,
          ),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [IconButton(onPressed: () => (), icon: Icon(Icons.share))],
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            App.artigo['titulo'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            App.artigo['descricao'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            App.artigo['data'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Container(height: 16),
                      SizedBox(
                        width: 400,
                        height: 200,
                        child: _controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : Container(),
                      ),
                      Container(height: 16),
                      Text(
                        App.artigo['conteudo'],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: width,
              height: 130,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Cores.preto, blurRadius: 5)],

                color: Cores.branco,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Cores.azulClaro,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Tamanho da fonte'),
                                        IconButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          icon: Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                    content: SingleChildScrollView(
                                      child: Text(
                                        'Selecione um tamanho de fonte para o aplicativo.',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text('Pequeno'),
                                        onPressed: () => (),
                                      ),
                                      TextButton(
                                        child: Text('Médio'),
                                        onPressed: () => (),
                                      ),
                                      TextButton(
                                        child: Text('Grande'),
                                        onPressed: () => (),
                                      ),
                                    ],
                                  ),
                                ),
                                icon: Icon(
                                  Icons.text_fields_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Cores.azulClaro,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                onPressed: () => (),
                                icon: Icon(Icons.settings, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * .4, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                            backgroundColor: Cores.azulClaro,
                          ),
                          onPressed: () => setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          }),
                          label: Text(
                            'Ouvir artigo',
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: Icon(Icons.headphones, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.dark_mode, color: Cores.preto),
                        SizedBox(
                          width: width * .8,
                          child: Slider(value: 0, onChanged: (value) => ()),
                        ),
                        Icon(Icons.light_mode, color: Cores.preto),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
