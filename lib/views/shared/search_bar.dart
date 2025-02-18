import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onProfileTap;
  final VoidCallback onSearchTap;

  const TopBar({
    super.key,
    required this.onProfileTap,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Привет, путешественник",
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Куда отправимся сегодня?",
                    style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.secondary),
                  ),
                ],
              ),
              const Spacer(),
              // Profile Button with Splash Effect
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: theme.colorScheme.primary.withValues(alpha:0.08),
                  highlightColor: theme.colorScheme.primary.withValues(alpha:0.04),
                  onTap: onProfileTap,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      'assets/icons/ic_profile.svg',
                      width: 32,
                      height: 32,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.colorScheme.surfaceBright,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset(
                    'assets/icons/ic_zoom.svg',
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              // Search Filter Button with Splash Effect
              suffixIcon: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  splashColor: theme.colorScheme.primary.withValues(alpha:0.08),
                  highlightColor: theme.colorScheme.primary.withValues(alpha:0.04),
                  onTap: onSearchTap,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/icons/ic_tune.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        theme.colorScheme.secondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              hintText: "Поиск...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
