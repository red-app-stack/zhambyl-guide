import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, isLiked, VoidCallback? onTap});

  @override
  LikeButtonState createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton> with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    // Corrected animation mapping
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    // Start the bounce effect
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        GestureDetector(
          onTap: toggleLike,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: SvgPicture.asset(
                isLiked ? 'assets/icons/nav_favourite.svg' : 'assets/icons/like.svg',
                key: ValueKey<bool>(isLiked),
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isLiked ? theme.colorScheme.secondary : theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
