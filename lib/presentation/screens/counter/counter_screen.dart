
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_providers.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


class CounterScreen extends ConsumerWidget {

  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);

    final bool isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Riverpod'),
        actions: [
          IconButton(
            icon: Icon(isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: (){
              ref.read(isDarkmodeProvider.notifier).update((state) => !state);
            },
          )
        ],
      ),

      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge,),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          ref.read(counterProvider.notifier).state++;
        }
        ),
    );
  }
}














