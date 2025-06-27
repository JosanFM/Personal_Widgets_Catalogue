import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progresss Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const  [
          SizedBox(height: 30),
          Text('Circular progress indicator'),
          SizedBox(height: 15),
          CircularProgressIndicator(strokeWidth: 4, backgroundColor: Colors.black45,),
          SizedBox(height: 20),
          Text('Circula and Linear indicator controlado'),
          SizedBox(height: 10,),
          _ControlerProgressIndicator(),   //widget creado abajo

        ],
      ),
    );
  }
}

class _ControlerProgressIndicator extends StatelessWidget {
  const _ControlerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 50), (value){
        return (value)/100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot){

        final progressValue = snapshot.data ?? 0;

        return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: progressValue, strokeWidth: 4, backgroundColor: Colors.black12, ),
            const SizedBox(width: 20),
            Expanded(
              child: LinearProgressIndicator(value: progressValue)
              ),  // Expanded le da el espacio que el padre le permite para hacer el LinearProgressIndicator()
              // Si el expanded lo hacemos en vertical y tiene expan infinito la aplicación se bloquea
          ],
        ),
      );
      },
    );
  }
}
