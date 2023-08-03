import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ossos_technical_test/common/config_size.dart';
import 'package:ossos_technical_test/common/extension/extension.dart';

import '../../../../common/widgets/osson_text.dart';
import '../../model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.item,
  });

  final Pokemon item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: context.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.scrim.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5,
            ),
            BoxShadow(
              color: context.colorScheme.scrim.withOpacity(0.05),
              offset: const Offset(5, -5),
              blurRadius: 2,
            )
          ],
          borderRadius: OSSize.br16),
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: OSSize.br16, color: context.colorScheme.outline.withOpacity(0.2)),
                  child: item.getImage != null
                      ? ExtendedImage.network(item.getImage!, handleLoadingProgress: true)
                      : FittedBox(child: FlutterLogo()))), //todo take defult
          Expanded(
              flex: 2,
              child: RPadding(
                padding: REdgeInsets.all(8.0),
                child: OSText(
                  item.name ?? '',
                  style: context.textTheme.bodyMedium,
                ),
              )),
        ],
      ),
    );
  }
}
