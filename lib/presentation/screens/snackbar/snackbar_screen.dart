import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola, soy un SnackBar'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Cerrar',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Dialogo de prueba'),
          content: const Text(
              'Tempor voluptate voluptate culpa minim consectetur Lorem cillum. Ipsum cillum dolore quis Lorem sint amet commodo veniam aute ut tempor qui. Occaecat quis laborum dolor consequat consequat elit velit id do velit sint in occaecat pariatur. Eiusmod enim in proident reprehenderit. Adipisicing magna voluptate dolor pariatur laboris deserunt aliquip aliquip veniam et minim Lorem sit.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Aceptar')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars & dialogs'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(
                context: context,
                children: [
                  const Text('Este es un dialogo de prueba'),
                ],
              );
            },
            child: const Text('Licencias usadas'),
          ),
          FilledButton.tonal(
            onPressed: () {
              openDialog(context);
            },
            child: const Text('Mostrar dialogo'),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
