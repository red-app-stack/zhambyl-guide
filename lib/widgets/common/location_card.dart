// LocationCard Widget
import 'package:flutter/material.dart';
import 'package:zhambyl_guide/views/shared/like_button.dart';

class LocationCard extends StatelessWidget {
  final Map<String, dynamic> location;
  final VoidCallback? onLikeToggle;

  const LocationCard({super.key, required this.location, this.onLikeToggle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              location["image"],
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: const Alignment(0.0, -0.05),
                  colors: [
                    theme.colorScheme.surface,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 12,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        location["title"],
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        location["subtitle"],
                        style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    LikeButton(
                      isLiked: location["isLiked"],
                      onTap: onLikeToggle,
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}