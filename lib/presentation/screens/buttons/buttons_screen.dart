import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const name = 'buttons_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
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
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            // * ELEVADED BUTTONS
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Elevated Disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_home_work),
              label: const Text('Elevated Icon'),
            ),

            // * FILLED BUTTONS
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.facebook),
              label: const Text('Filled Icon'),
            ),

            // * OUTLINED BUTTONS
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.terminal),
              label: const Text('Outlined Icon'),
            ),

            // * TEXT BUTTONS
            TextButton(
              onPressed: () {},
              child: const Text('Text'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.text_snippet),
              label: const Text('Text Icon'),
            ),
            // * ICON BUTTONS
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(theme.primary),
                iconColor: MaterialStatePropertyAll(theme.onPrimary),
              ),
            ),

            // TODO: CUSTOM BUTTONS
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Material(
        color: theme.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Text(
              'Hola MUNDO XD',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
