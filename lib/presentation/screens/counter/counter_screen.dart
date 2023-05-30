import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_providers.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isInDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref
                  .read(isInDarkModeProvider.notifier)
                  .update((isDarkMode) => !isDarkMode);
            },
          )
        ],
      ),
      body: _CounterView(clickCounter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // LEER Y AUMENTAR EL VALOR DEL CONTADOR MEDIANTE EL PROVIDER de Riverpod
          ref.read(counterProvider.notifier).state++;
          // ALTERNATIVA: ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CounterView extends StatelessWidget {
  final int clickCounter;
  const _CounterView(this.clickCounter);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Valor: $clickCounter',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
