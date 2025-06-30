import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Enim tempor proident quis sit eu minim.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rápida',
    'Aute occaecat eiusmod amet do mollit.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Lorem dolore enim aliquip commodo Lorem laborum est cillum.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    
    super.initState();

    pageViewController.addListener((){

      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length -1.5)){
        setState(() {
          endReached = true;
        });
      }

    });

  }

  @override
  void dispose() {

      pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                ).toList(),     
          ),

          Positioned(
            
            right: 20,
            top: 50,
            child: TextButton(
              child: Text('Saltar tutorial', style: TextStyle(fontSize: 18),),
              onPressed: () {
                context.pop();
              },
              
            ),
          ),

          endReached ? Positioned(   // Condición para mostrar o no el Posicioned
            bottom: 100,
            right: 20,
            child: FadeInRight(
              from: 50,
              delay: const Duration(milliseconds: 500),
              child: FilledButton(
                onPressed: () => context.pop(), 
                child: Text('Comenzar'),
                ),
            )
            ) : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,   //Alineación vertical
          crossAxisAlignment: CrossAxisAlignment.start,  //Alineación horizontal
          children: [
            Image( image: AssetImage(imageUrl),),
            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 20,),
            Text(caption, style: captionStyle,)

          ],
        ),
      ),
    );
  }
}
