import 'package:flutter/material.dart';
import 'package:omni_app_flutter/core/constants/color_constants.dart';
import 'package:omni_app_flutter/core/constants/style_constants.dart';
import 'package:omni_app_flutter/core/themes/app_theme.dart';
import 'package:omni_app_flutter/domain/models/photo_model.dart';
import 'package:omni_app_flutter/presentation/widgets/widget_text_label.dart';

/// Class that create a item customizable for the photos
class WidgetItemPhoto extends StatelessWidget {
  final PhotoModel _item;
  final Function(bool) _onTap;

  const WidgetItemPhoto({
    required Key key,
    required PhotoModel item,
    required Function(bool) onTap
  }): _item = item,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(kDimens10)),
            boxShadow: [
              BoxShadow(
                  blurRadius: kDimens10,
                  color: kShadowLight,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(kDimens1, kDimens1)
              )
            ],
            color: kWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDimens15, horizontal: kDimens10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: kDimens60,
                  width: kDimens60,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(kDimens10)),
                    child: Stack(
                      children: [
                        const Center(
                          child: CircularProgressIndicator(
                            color: kSecondary,
                            strokeWidth: kDimens1,
                          ),
                        ),
                        Image.network(
                          _item.thumbnailUrl,
                          height: kDimens60,
                          width: kDimens60,
                          fit: BoxFit.cover
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: kDimens10),
                Expanded(
                    child: WidgetTextLabel(
                      key: Key('${_item.id}${_item.title}'),
                      text: _item.title,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                          color: kBlack,
                          fontSize: kDimens15,
                          fontWeight: FontWeight.w900
                      ),
                    )
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: kDimens20)
      ],
    );
  }
}