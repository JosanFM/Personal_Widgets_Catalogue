import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(

      selectedIndex: navDrawerIndex,          //para ver seleccionada la opcion del side
      onDestinationSelected: (value) {       // para que cambie la selección y navegar a ella
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];

        
        context.push(menuItem.link);

        widget.scaffoldKey.currentState?.closeDrawer();
        
      },

      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            28,
            hasNotch ? 5 : 20,
            16,
            10,
          ), //Hacer eso para cuando tenga Notch o no
          child: Text('Básicos'),
        ),

        ...appMenuItems.sublist(0,3).map(       // Las primeras tres opciones
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 0, 10),
          child: Text('Avanzados'),
        ),

        ...appMenuItems.sublist(3,appMenuItems.length).map(       // Las demás opciones
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          ),
        ),

      ],
    );
  }
}
