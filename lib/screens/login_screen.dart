import 'package:flutter/material.dart';

import 'controller_beta_screen.dart';
import 'controller_full_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020609),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 62, 18, 28),
          child: Column(
            children: [
              const _LoginLock(),
              const SizedBox(height: 18),
              const Text(
                'Desbloqueie todo o potencial',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Faça login para aproveitar suas transições personalizadas.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF8E949E), fontSize: 7),
              ),
              const SizedBox(height: 22),
              _LoginField(
                label: 'E-mail',
                hint: 'seu-email@gmail.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              _LoginField(
                label: 'Senha',
                hint: '••••••••',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 34,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    ControllerFullScreen.routeName,
                    (route) => false,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FF68),
                    foregroundColor: Colors.black,
                    elevation: 8,
                    shadowColor: const Color(0xFF00FF68).withValues(alpha: 0.55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.w900),
                  ),
                  child: const Text('ENTRAR'),
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                height: 34,
                child: OutlinedButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    ControllerBetaScreen.routeName,
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF10141C),
                    side: const BorderSide(color: Color(0xFF202631)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    textStyle: const TextStyle(fontSize: 7, fontWeight: FontWeight.w600),
                  ),
                  child: const Text('Continuar no Modo Demo'),
                ),
              ),
              const SizedBox(height: 55),
              const Text(
                'Não tem uma conta?',
                style: TextStyle(color: Color(0xFF7E858F), fontSize: 7),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, SignupScreen.routeName),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF00FF68),
                  textStyle: const TextStyle(fontSize: 7, fontWeight: FontWeight.w800),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                ),
                child: const Text('CRIAR CONTA GRÁTIS'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginLock extends StatelessWidget {
  const _LoginLock();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF21102B),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC323FF).withValues(alpha: 0.3),
            blurRadius: 12,
          ),
        ],
      ),
      child: const Icon(Icons.lock_outline_rounded, color: Color(0xFFC323FF), size: 22),
    );
  }
}

class _LoginField extends StatelessWidget {
  const _LoginField({
    required this.label,
    required this.hint,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF9EA4AE), fontSize: 7)),
        const SizedBox(height: 5),
        SizedBox(
          height: 34,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: const TextStyle(color: Colors.white, fontSize: 8),
            cursorColor: const Color(0xFF00FF68),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF5E6672), fontSize: 8),
              filled: true,
              fillColor: const Color(0xFF10141C),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Color(0xFF202631)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Color(0xFF202631)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Color(0xFF00FF68)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}