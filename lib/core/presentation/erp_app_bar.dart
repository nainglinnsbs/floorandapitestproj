import 'package:flutter/material.dart';

class ERPAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ERPAppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
    this.bottom,
    this.toolbarHeight,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    // if (F.appFlavor != Flavor.prod) {
    //   return FlavorBanner(
    //     child: AppBar(
    //       automaticallyImplyLeading: true,
    //       leading: leading,
    //       title: title,
    //       actions: actions,
    //       backgroundColor: Theme.of(context).colorScheme.surface,
    //       foregroundColor: Theme.of(context).colorScheme.onSurface,
    //       elevation: 0,
    //       centerTitle: true,
    //     ),
    //   );
    // }

    return AppBar(
      automaticallyImplyLeading: true,
      leading: leading,
      title: title,
      actions: actions,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: 0,
      centerTitle: true,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      (toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0));
}
