import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,

          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            ElevatedButton(
              onPressed: null,
              child: const Text('Elevated Disabled'),
            ), // como el anterior pero desabilitado ( no se puede presionar)

            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Elevated Icon'),
              icon: Icon(Icons.access_alarm_rounded),
            ),

            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.accessibility_new), label: const Text('Filled Icon'),),

            OutlinedButton(onPressed: (){}, child: const Text('Outline')),
            OutlinedButton.icon(onPressed: (){},label: const Text('Outline Icon'), icon: Icon(Icons.terminal), ),

            TextButton(onPressed: (){}, child: const Text('TextButton')),
            TextButton.icon(onPressed: (){}, label: Text('TextButton Icon'), icon: Icon(Icons.account_balance),),

            IconButton(onPressed: (){}, icon: Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: const WidgetStatePropertyAll(Colors.white),
                ) ,
                
              ),

              //Button personalizado:
            CustomButton(),

            

          ],
        ),
      ),
    );
  }
}


// Crear un button personalizado

class CustomButton extends StatelessWidget {

  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20) ,
      child: Material(
        color: colors.primary,
        child: InkWell(
          splashColor: Colors.red,
          onTap: (){},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('CustomButton', style: TextStyle(color: Colors.white) ,)
            ),
        ),
      ),
    );
  }
}