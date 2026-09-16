import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';
import 'controller_beta_screen.dart';
import 'library_screen.dart';
import 'login_screen.dart';

class AiLoginRequiredScreen extends StatelessWidget {
  const AiLoginRequiredScreen({super.key});

  static const routeName = '/ai-login-required';
  static const _background = Color(0xFF020609);
  static const _panel = Color(0xFF10141C);
  static const _purple = Color(0xFFC323FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 34, 18, 16),
                child: Column(
                  children: [
                    const _AssistantLock(),
                    const SizedBox(height: 16),
                    const Text(
                      '🔒 Assistente MixGo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Para utilizar o Assistente de IA, você precisa estar\nconectado à sua conta.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF9B9FA9),
                        fontSize: 7,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const _CopilotFeatureCard(),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          LoginScreen.routeName,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _purple,
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: _purple.withValues(alpha: 0.65),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        child: const Text('ENTRAR'),
                      ),
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 32,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          LoginScreen.routeName,
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF00FF68),
                          side: const BorderSide(color: Color(0xFF202631)),
                          backgroundColor: _panel,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: const Text('Criar conta'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF7B818D),
                        textStyle: const TextStyle(fontSize: 7),
                        minimumSize: const Size(60, 24),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text('Voltar'),
                    ),
                  ],
                ),
              ),
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.assistant,
              selectedColor: _purple,
              onController: () => Navigator.pushReplacementNamed(
                context,
                ControllerBetaScreen.routeName,
              ),
              onLibrary: () => Navigator.pushReplacementNamed(
                context,
                LibraryScreen.routeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AssistantLock extends StatelessWidget {
  const _AssistantLock();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53,
      height: 53,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF180F25),
        border: Border.all(color: AiLoginRequiredScreen._purple, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AiLoginRequiredScreen._purple.withValues(alpha: 0.65),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(Icons.lock_outline_rounded, color: AiLoginRequiredScreen._purple, size: 24),
    );
  }
}

class _CopilotFeatureCard extends StatelessWidget {
  const _CopilotFeatureCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
      decoration: BoxDecoration(
        color: AiLoginRequiredScreen._panel,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF202631)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RECURSOS DO COPILOT AI',
            style: TextStyle(
              color: Color(0xFF777E8A),
              fontSize: 5,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
          SizedBox(height: 9),
          _FeatureRow(
            icon: Icons.bolt_rounded,
            iconColor: Color(0xFF00FF68),
            title: 'Transições Harmônicas Inteligentes',
            description: 'Análise de BPM e tonalidade em tempo real\npara mixagens perfeitas.',
          ),
          SizedBox(height: 10),
          _FeatureRow(
            icon: Icons.auto_awesome_rounded,
            iconColor: AiLoginRequiredScreen._purple,
            title: 'Curadoria da Pista Dinâmica',
            description: 'Sugestões baseadas no clima atual do seu\nset.',
          ),
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 15),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF8F96A1),
                  fontSize: 6,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

