import 'package:custom_widgets/src/text_h4.widget.dart';
import 'package:flutter/material.dart';

/// appbar version 1
class AppBarV1 extends StatelessWidget {
  /// appbar version 1
  const AppBarV1({
    required this.keyScaffold,
    required this.title,
    required this.painter,
    super.key,
  });

  /// key de scaffold
  final GlobalKey<ScaffoldState> keyScaffold;

  /// texto de titulo
  final String title;

  /// painter logo
  final CustomPainter painter;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                keyScaffold.currentState!.openDrawer();
              },
              child: CircleAvatar(
                child: CustomPaint(
                  size: const Size(30, 30),
                  painter: painter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextH4(
                text: title,
              ),
            ),
          ],
        ),
      ),
      floating: true,
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          // height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.5),
          ),

          padding: const EdgeInsets.symmetric(horizontal: 16),
          // margin: EdgeInsets.symmetric(horizontal: 16),
          child: const TextH4(text: 'DESARROLLO DE SOFTWARE'),
        ),
        // centerTitle: true,
      ),
    );
  }
}
