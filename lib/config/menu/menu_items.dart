import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card_outlined,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars & dialogs',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subtitle: 'Stateful widget con animaciones',
    link: '/animated',
    icon: Icons.check_box_outline_blank,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subtitle: 'Una serie de controles en Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'App Tutorial INTRO',
    subtitle: 'Pequeño tutorial de la app',
    link: '/tutorial',
    icon: Icons.accessibility_new_rounded,
  ),
  MenuItem(
    title: 'Infinite Scroll y Pull to Refresh',
    subtitle: 'Listas infinitas y pull to refresh',
    link: '/infinite-scroll',
    icon: Icons.replay_outlined,
  ),
];
