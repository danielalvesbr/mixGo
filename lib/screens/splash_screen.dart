import 'package:flutter/material.dart';

import 'controller_beta_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';
  static const _background = Color(0xFF020609);
  static const _panel = Color(0xFF11151D);
  static const _green = Color(0xFF00FF68);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 402),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
                  child: Column(
                    children: [
                      const Spacer(flex: 10),
                      const _MixGoLogo(),
                      const SizedBox(height: 22),
                      const Text(
                        'AI DJ PILOT',
                        style: TextStyle(
                          color: Color(0xFFB7B7BF),
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.2,
                        ),
                      ),
                      const Spacer(flex: 4),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          color: _panel,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF20242D)),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              '“A IA recomenda”',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '“O DJ controla.”',
                              style: TextStyle(
                                color: _green,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 2),
                      SizedBox(
                        width: double.infinity,
                        height: 34,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            ControllerBetaScreen.routeName,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _green,
                            foregroundColor: Colors.black,
                            elevation: 7,
                            shadowColor: _green.withValues(alpha: 0.65),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          child: const Text('ENTRAR NO DECK'),
                        ),
                      ),
                      const SizedBox(height: 7),
                      SizedBox(
                        width: double.infinity,
                        height: 34,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            LoginScreen.routeName,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _panel,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Color(0xFF1B2028)),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: const Text('Fazer Login / Criar Conta'),
                        ),
                      ),
                      const Spacer(flex: 3),
                      const Text(
                        'Modo Demo não requer cadastro. Controles locais disponíveis.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF5E626A),
                          fontSize: 6,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 100,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MixGoLogo extends StatelessWidget {
  const _MixGoLogo();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00C9FF), Color(0xFF9D36FF), Color(0xFFFF2ABF)],
          ).createShader(bounds),
          child: const Text(
            'M G',
            style: TextStyle(
              color: Colors.white,
              fontSize: 47,
              fontWeight: FontWeight.w900,
              height: 0.82,
              letterSpacing: -7,
            ),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'MixGo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            height: 0.8,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'THE NEXT GENERATION OF DJING',
          style: TextStyle(
            color: Color(0xFF6D717A),
            fontSize: 4,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}