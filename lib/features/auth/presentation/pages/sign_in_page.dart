import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/constants/app_constants.dart';
import '../../../../../../../../core/themes/app_colors.dart';
import '../../../../../widgets/animated_background.dart';
import '../../../../../widgets/auth_text_field.dart';
import '../../../../auth_event.dart';
import '../../../../auth_state.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../validators.dart';
import '../../domain/usercases/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: AppConstants.longAnimation,
      vsync: this,
    );

    _slideController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 200), () {
      _fadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthSignInRequested(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  void _forgotPassword() {
    if (_emailController.text.trim().isNotEmpty) {
      context.read<AuthBloc>().add(
        AuthPasswordResetRequested(email: _emailController.text.trim()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email address first')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.go('/home');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          } else if (state is AuthPasswordResetSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Password reset email sent to ${state.email}'),
                backgroundColor: AppColors.success,
              ),
            );
          }
        },
        child: Stack(
          children: [
            // Animated background
            const AnimatedBackground(),

            // Main content
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Column(
                  children: [
                    // Back button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GlassmorphicContainer(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppConstants.largePadding),

                    // Header section
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          Text(
                            'Welcome Back!',
                            style: Theme.of(context).textTheme.displayMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                  shadows: [
                                    Shadow(
                                      color: AppColors.black.withOpacity(0.3),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                          ),

                          const SizedBox(height: AppConstants.smallPadding),

                          Text(
                            'Sign in to continue your learning journey',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: AppColors.white.withOpacity(0.9),
                                  shadows: [
                                    Shadow(
                                      color: AppColors.black.withOpacity(0.3),
                                      offset: const Offset(0, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppConstants.largePadding * 2),

                    // Form section
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: GlassmorphicContainer(
                          padding: const EdgeInsets.all(
                            AppConstants.largePadding,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Email field
                                AuthTextField(
                                  controller: _emailController,
                                  labelText: 'Email',
                                  hintText: 'Enter your email',
                                  keyboardType: TextInputType.emailAddress,
                                  prefixIcon: Icons.email_outlined,
                                  validator: (value) {
                                    if (!Validators.isNotEmpty(value)) {
                                      return ValidationMessages.emailRequired;
                                    }
                                    if (!Validators.isValidEmail(value!)) {
                                      return ValidationMessages.emailInvalid;
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(
                                  height: AppConstants.defaultPadding,
                                ),

                                // Password field
                                AuthTextField(
                                  controller: _passwordController,
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  obscureText: _obscurePassword,
                                  prefixIcon: Icons.lock_outlined,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (!Validators.isNotEmpty(value)) {
                                      return ValidationMessages
                                          .passwordRequired;
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(
                                  height: AppConstants.defaultPadding,
                                ),

                                // Remember me and forgot password
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      },
                                      activeColor: AppColors.primaryBlue,
                                      checkColor: AppColors.white,
                                    ),
                                    Text(
                                      'Remember me',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColors.white.withOpacity(
                                              0.9,
                                            ),
                                          ),
                                    ),
                                    const Spacer(),
                                    TextButton(
                                      onPressed: _forgotPassword,
                                      child: Text(
                                        'Forgot Password?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.primaryYellow,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: AppConstants.largePadding,
                                ),

                                // Sign in button
                                BlocBuilder<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    final isLoading = state is AuthLoading;

                                    return GlassmorphicButton(
                                      onPressed: isLoading ? null : _signIn,
                                      isLoading: isLoading,
                                      backgroundColor: AppColors.primaryBlue,
                                      child: const Text('Sign In'),
                                    );
                                  },
                                ),

                                const SizedBox(
                                  height: AppConstants.defaultPadding,
                                ),

                                // Divider
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: AppColors.white.withOpacity(0.3),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppConstants.defaultPadding,
                                      ),
                                      child: Text(
                                        'OR',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.white
                                                  .withOpacity(0.7),
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: AppColors.white.withOpacity(0.3),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: AppConstants.defaultPadding,
                                ),

                                // Social login buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: GlassmorphicButton(
                                        onPressed: () {
                                          context.read<AuthBloc>().add(
                                            AuthGoogleSignInRequested(),
                                          );
                                        },
                                        backgroundColor: AppColors.white
                                            .withOpacity(0.2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.g_mobiledata,
                                              color: AppColors.white,
                                              size: 24,
                                            ),
                                            const SizedBox(width: 8),
                                            const Text('Google'),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: AppConstants.defaultPadding,
                                    ),
                                    Expanded(
                                      child: GlassmorphicButton(
                                        onPressed: () {
                                          context.read<AuthBloc>().add(
                                            AuthAppleSignInRequested(),
                                          );
                                        },
                                        backgroundColor: AppColors.black
                                            .withOpacity(0.3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.apple,
                                              color: AppColors.white,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 8),
                                            const Text('Apple'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppConstants.largePadding),

                    // Sign up link
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: GlassmorphicContainer(
                        padding: const EdgeInsets.all(
                          AppConstants.defaultPadding,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: AppColors.white.withOpacity(0.9),
                                  ),
                            ),
                            TextButton(
                              onPressed: () => context.push('/sign-up'),
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: AppColors.primaryYellow,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
