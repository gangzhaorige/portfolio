import 'package:flutter/material.dart';
import 'package:my_portfolio/ui/widgets/skills/switcher_cards.dart';
import 'package:my_portfolio/ui/widgets/skills/switcher_contents.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../model/switcher_model.dart';

class Switcher extends StatelessWidget {
  const Switcher({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SwitchNavigation(),
      child: ScreenTypeLayout.builder(
        desktop: (_) => Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: const SwitcherCards()
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: const SwitcherContents(),
              ),
            ),
          ],
        ),
        tablet: (_) => const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitcherCards(),
            SwitcherContents()
          ],
        ),
        mobile: (_) => const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitcherCards(),
            SwitcherContents()
          ],
        ),
      ),
    );
    
  }
}