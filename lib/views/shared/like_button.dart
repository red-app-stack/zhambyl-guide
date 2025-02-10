import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LikeButton extends StatefulWidget {
  final bool? isLiked;
  final VoidCallback? onTap;
  final double size;

  const LikeButton({
    super.key,
    this.isLiked,
    this.onTap,
    this.size = 16,
  });

  @override
  LikeButtonState createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton> with SingleTickerProviderStateMixin {
  late bool _isLiked;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked ?? false;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLiked != oldWidget.isLiked) {
      setState(() {
        _isLiked = widget.isLiked ?? false;
      });
    }
  }

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    } else {
      setState(() {
        _isLiked = !_isLiked;
      });
    }

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

    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: widget.size * 2,
          height: widget.size * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isLiked ? theme.colorScheme.surfaceDim : theme.colorScheme.primary,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: Center(
              child: SvgPicture.asset(
                _isLiked ? 'assets/icons/nav_favourite.svg' : 'assets/icons/like.svg',
                key: ValueKey<bool>(_isLiked),
                width: widget.size,
                height: widget.size,
                colorFilter: ColorFilter.mode(
                  _isLiked ? theme.colorScheme.primary : theme.colorScheme.surfaceDim,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
