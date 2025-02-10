import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zhambyl_guide/controllers/panorama_explorer.dart';
import 'package:zhambyl_guide/views/shared/like_button.dart';

class TravelBottomSheet extends StatelessWidget {
  final Map<String, dynamic> location;

  const TravelBottomSheet({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 120,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          _buildHeader(theme),
          const SizedBox(height: 8),
          _buildDescription(theme),
          const SizedBox(height: 8),
          Card(
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.hardEdge,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildImageCarousel(),
                      const SizedBox(height: 16),
                      _buildActionButtons(context, theme, location),
                      const SizedBox(height: 16),
                      _buildDurationText(theme)
                    ],
                  )))
        ],
      ),
    );
  }

  /// 🔹 Header with title and rating
  Widget _buildHeader(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location["title"],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            Text(
              location["subtitle"],
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  print("tapped");
                },
                splashColor: theme.colorScheme.primary.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Chip(
                    label: Row(children: [
                      SvgPicture.asset(
                        "assets/icons/star.svg",
                        colorFilter: ColorFilter.mode(
                          theme.colorScheme.secondary,
                          BlendMode.srcIn,
                        ),
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "5.0",
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ]),
                    backgroundColor: theme.colorScheme.surfaceDim,
                    labelPadding: EdgeInsets.symmetric(horizontal: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "12 рецензий",
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
                decoration: TextDecoration.underline,
                decorationThickness: 2.0,
              ),
              textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: true), // Adjust vertical alignment of text with the underline
            ),
          ],
        ),
      ],
    );
  }

  /// 🔹 Description Section
  Widget _buildDescription(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandableText(
            text: location['description'],
            maxLines: 2,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  /// 🔹 Image Swiper (Carousel)
  Widget _buildImageCarousel() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: FlutterCarousel(
        options: FlutterCarouselOptions(
          height: 200,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          enableInfiniteScroll: true,
          viewportFraction: 1.0,
          slideIndicator: CircularSlideIndicator(),
        ),
        items: location["images"].map<Widget>((imagePath) {
          return Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          );
        }).toList(),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.style,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            widget.text,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            style: widget.style,
          ),
          secondChild: Text(
            widget.text,
            style: widget.style,
          ),
          crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 32),
          ),
          child: Text(
            _expanded ? 'Свернуть' : 'Читать дальше',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildActionButtons(BuildContext context, ThemeData theme, Map<String, dynamic> location) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 200, // Adjust this value as needed
        child: _buildPrimaryButton(context, theme, "Начать путешествие"),
      ),
      Row(
        children: [
          LikeButton(
            isLiked: location["isLiked"],
            size: 19,
          ),
          const SizedBox(width: 12),
          _buildIconButton(theme, "assets/icons/share.svg"),
        ],
      ),
    ],
  );
}

Widget _buildPrimaryButton(BuildContext context, ThemeData theme, String text) {
  return ElevatedButton.icon(
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => const PanoramaExplorer(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.primary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    label: Text(text, style: const TextStyle(fontSize: 14)),
  );
}

Widget _buildIconButton(ThemeData theme, String iconPath) {
  return IconButton(
    onPressed: () {},
    icon: SvgPicture.asset(
      iconPath,
      width: 20,
      height: 20,
      colorFilter: ColorFilter.mode(
        theme.colorScheme.primary,
        BlendMode.srcIn,
      ),
    ),
    style: IconButton.styleFrom(
      backgroundColor: theme.colorScheme.surfaceDim,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
  );
}

/// 🔹 Duration Text
Widget _buildDurationText(ThemeData theme) {
  return Text(
    "Время прохождения ~25 минут",
    style: TextStyle(fontSize: 14, color: theme.colorScheme.onSurfaceVariant),
  );
}
