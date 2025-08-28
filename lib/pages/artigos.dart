import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sp_module_c_project/controllers/app.dart';
import 'package:sp_module_c_project/styles/styles.dart';

class Artigos extends StatefulWidget {
  const Artigos({super.key});

  @override
  State<Artigos> createState() => _ArtigosState();
}

class _ArtigosState extends State<Artigos> {
  int slide = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, Estudante!'),
        actions: [
          IconButton(onPressed: () => (), icon: Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(height: 20),
            CarouselSlider(
              items: [
                for (var artigo in App.artigos.take(3).toList())
                  Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Cores.azulMedio,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            artigo['titulo'],
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(width, 20),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            onPressed: () => (),
                            child: Text(
                              'Começar agora',
                              style: TextStyle(
                                fontSize: 16,
                                color: Cores.azulMedio,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
              options: CarouselOptions(
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  slide = index;
                  setState(() {});
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(height: 10),
            DotsIndicator(
              dotsCount: App.artigos.take(3).toList().length,
              position: slide.toDouble(),
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: Cores.azulClaro,
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [Text('Artigos', style: TextStyle(fontSize: 20))],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var artigo in App.artigos)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Cores.azulMedio,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: ListTile(
                            title: Text(
                              artigo['titulo'],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            trailing: Text(
                              artigo['data'],
                              style: TextStyle(color: Colors.white),
                            ),

                            subtitle: Text(
                              artigo['descricao'],
                              style: TextStyle(color: Colors.white),
                            ),

                            onTap: () {
                              if (artigo['id'] == 2) {
                                Navigator.pushNamed(context, '/detalhes');
                              }
                            },
                          ),
                        ),
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
