import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});



  void showCustomSnackbar (BuildContext context) {

      ScaffoldMessenger.of(context).clearSnackBars();
      final snakbar = SnackBar(
              content: const Column(
                children: [
                  Text('Se ha registrado correctamente'),
                  SizedBox(height: 5),
                  Text(
                    'Los snackbar sirven para mostrar un mensaje temporal debajo de la pantalla cuando realizas alguna acción y quieres que te informe de ello',
                  ),
                ],
              ),
              action:SnackBarAction(label: 'Okey', onPressed: (){}) ,
              duration: Duration(seconds: 2),
            );
      ScaffoldMessenger.of(context).showSnackBar(snakbar);
   }


   void openDialog (BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,   //Para que dandole fuera no se cierre la ventana de dialogo y este obligado a presionar cancelar o aceptar
      builder: (context) => AlertDialog(
      title: const Text('¿Estas seguro ?'),
      content: const Text('Veniam aliqua esse pariatur nisi qui esse mollit. Dolor laboris eu dolor sint proident nostrud dolore magna et. Nulla ut occaecat eu cupidatat fugiat Lorem aliqua magna.'),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
        FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
      ],
    ),);
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars y Diálogos')
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Este Widgets esta predefinido en FLutter y recoge las licencias automaticamente de nuestro proyecto')
                  ]
                  );
              }, 
              child: Text('Licencias usadas')
              ),
              FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: Text('Mostrar diálogo'),
              
              )
            ],
          ),
        ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
