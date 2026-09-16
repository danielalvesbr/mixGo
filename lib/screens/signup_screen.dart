import 'package:flutter/material.dart';

import 'controller_beta_screen.dart';
import 'controller_full_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
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
          padding: const EdgeInsets.fromLTRB(18, 57, 18, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Crie seu Deck Virtual',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              const Center(
                child: Text(
                  'Seja bem-vindo ao futuro do DJing\nintegrado com Inteligência Artificial.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF8E949E), fontSize: 7, height: 1.35),
                ),
              ),
              const SizedBox(height: 20),
              _SignupField(
                label: 'Nome artístico / DJ Name',
                hint: 'DJ Remix Master',
                controller: _nameController,
              ),
              const SizedBox(height: 12),
              _SignupField(
                label: 'E-mail',
                hint: 'dj@mixgo.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              _SignupField(
                label: 'Senha',
                hint: '••••••••',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 11),
              InkWell(
                onTap: () => setState(() => _acceptedTerms = !_acceptedTerms),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                      height: 15,
                      child: Checkbox(
                        value: _acceptedTerms,
                        onChanged: (value) => setState(() => _acceptedTerms = value ?? false),
                        activeColor: const Color(0xFF00FF68),
                        checkColor: Colors.black,
                        side: const BorderSide(color: Color(0xFF00FF68)),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Expanded(
                      child: Text(
                        'Aceito os Termos de Uso e Política de Privacidade do MixGo.',
                        style: TextStyle(color: Color(0xFF8E949E), fontSize: 6, height: 1.3),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
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
                  child: const Text('CRIAR CONTA E TOCAR'),
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
              const SizedBox(height: 54),
              const Center(
                child: Text(
                  'Já possui conta?',
                  style: TextStyle(color: Color(0xFF7E858F), fontSize: 7),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, LoginScreen.routeName),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF00FF68),
                    textStyle: const TextStyle(fontSize: 7, fontWeight: FontWeight.w800),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  ),
                  child: const Text('FAZER LOGIN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignupField extends StatelessWidget {
  const _SignupField({
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