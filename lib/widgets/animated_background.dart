import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _controller1 = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller2 = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();

    _controller3 = AnimationController(
      duration: const Duration(seconds: 25),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
        ),
      ),
      child: Stack(
        children: [
          // Floating orb 1
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Positioned(
                left: 50 + 100 * math.sin(_controller1.value * 2 * math.pi),
                top: 100 + 50 * math.cos(_controller1.value * 2 * math.pi),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryBlue.withOpacity(0.3),
                        AppColors.primaryBlue.withOpacity(0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Floating orb 2
          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Positioned(
                right: 30 + 80 * math.cos(_controller2.value * 2 * math.pi),
                top: 200 + 60 * math.sin(_controller2.value * 2 * math.pi),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryGreen.withOpacity(0.3),
                        AppColors.primaryGreen.withOpacity(0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Floating orb 3
          AnimatedBuilder(
            animation: _controller3,
            builder: (context, child) {
              return Positioned(
                left: 200 + 70 * math.cos(_controller3.value * 2 * math.pi),
                bottom: 150 + 40 * math.sin(_controller3.value * 2 * math.pi),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryYellow.withOpacity(0.3),
                        AppColors.primaryYellow.withOpacity(0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Additional floating elements
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Positioned(
                right:
                    80 + 60 * math.sin(_controller1.value * 2 * math.pi * 0.7),
                bottom:
                    100 + 30 * math.cos(_controller1.value * 2 * math.pi * 0.7),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryPurple.withOpacity(0.2),
                        AppColors.primaryPurple.withOpacity(0.05),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Positioned(
                left:
                    30 + 50 * math.cos(_controller2.value * 2 * math.pi * 0.5),
                bottom:
                    300 + 40 * math.sin(_controller2.value * 2 * math.pi * 0.5),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.primaryOrange.withOpacity(0.25),
                        AppColors.primaryOrange.withOpacity(0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Subtle overlay for better text readability
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, AppColors.black.withOpacity(0.1)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParticleBackground extends StatefulWidget {
  final int particleCount;
  final Color particleColor;
  final double maxParticleSize;
  final double minParticleSize;
  final Duration animationDuration;

  const ParticleBackground({
    super.key,
    this.particleCount = 50,
    this.particleColor = AppColors.white,
    this.maxParticleSize = 4.0,
    this.minParticleSize = 1.0,
    this.animationDuration = const Duration(seconds: 30),
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    )..repeat();

    particles = List.generate(widget.particleCount, (index) => Particle());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(
            particles: particles,
            animationValue: _controller.value,
            color: widget.particleColor,
            maxSize: widget.maxParticleSize,
            minSize: widget.minParticleSize,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class Particle {
  late double x;
  late double y;
  late double size;
  late double speedX;
  late double speedY;
  late double opacity;

  Particle() {
    x = math.Random().nextDouble();
    y = math.Random().nextDouble();
    size = math.Random().nextDouble();
    speedX = (math.Random().nextDouble() - 0.5) * 0.002;
    speedY = (math.Random().nextDouble() - 0.5) * 0.002;
    opacity = math.Random().nextDouble() * 0.5 + 0.1;
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;
  final Color color;
  final double maxSize;
  final double minSize;

  ParticlePainter({
    required this.particles,
    required this.animationValue,
    required this.color,
    required this.maxSize,
    required this.minSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    for (final particle in particles) {
      // Update particle position
      particle.x += particle.speedX;
      particle.y += particle.speedY;

      // Wrap around screen
      if (particle.x > 1) particle.x = 0;
      if (particle.x < 0) particle.x = 1;
      if (particle.y > 1) particle.y = 0;
      if (particle.y < 0) particle.y = 1;

      // Calculate actual position and size
      final x = particle.x * size.width;
      final y = particle.y * size.height;
      final particleSize = minSize + (maxSize - minSize) * particle.size;

      paint.color = color.withOpacity(particle.opacity);
      canvas.drawCircle(Offset(x, y), particleSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
