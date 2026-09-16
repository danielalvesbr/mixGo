import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';
import 'assistant_screen.dart';
import 'controller_full_screen.dart';

class SettingsFullScreen extends StatefulWidget {
  const SettingsFullScreen({super.key});

  static const routeName = '/settings-full';

  @override
  State<SettingsFullScreen> createState() => _SettingsFullScreenState();
}

class _SettingsFullScreenState extends State<SettingsFullScreen> {
  bool _highFidelity = true;
  bool _copilotSync = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020609),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.chevron_left_rounded, size: 18), color: const Color(0xFFD9DDE3), tooltip: 'Voltar'),
                  const Text('Configurações', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)),
                ]),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                children: [
                  const _SectionLabel('ÁUDIO & LATÊNCIA', Color(0xFF00D9FF)),
                  const _Option('Latência de Áudio', 'Preview local'),
                  _SwitchOption('Modo Alta Fidelidade', _highFidelity, (value) => setState(() => _highFidelity = value)),
                  const SizedBox(height: 12),
                  const _SectionLabel('AI & DJ COPILOT PREFERÊNCIAS', Color(0xFFC323FF)),
                  const _Option('Agressividade da IA', 'Preview local'),
                  _SwitchOption('Auto-Sync BPM (Demo)', _copilotSync, (value) => setState(() => _copilotSync = value)),
                  const SizedBox(height: 12),
                  const _SectionLabel('CONTA & DADOS', Color(0xFF88909B)),
                  const _Option('Status da Sessão', 'Full Demo'),
                ],
              ),
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.controller,
              onController: () => Navigator.pushReplacementNamed(context, ControllerFullScreen.routeName),
              onLibrary: () => Navigator.pushReplacementNamed(context, '/library-full'),
              onAssistant: () => Navigator.pushReplacementNamed(context, AssistantScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.only(left: 3, bottom: 5), child: Text(label, style: TextStyle(color: color, fontSize: 5, fontWeight: FontWeight.w900, letterSpacing: 0.7)));
}

class _Option extends StatelessWidget {
  const _Option(this.title, this.value);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Container(height: 32, margin: const EdgeInsets.only(bottom: 4), padding: const EdgeInsets.symmetric(horizontal: 9), decoration: BoxDecoration(color: const Color(0xFF0D1219), borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFF202631))), child: Row(children: [Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w600))), Text(value, style: const TextStyle(color: Color(0xFF737B87), fontSize: 6))]));
}

class _SwitchOption extends StatelessWidget {
  const _SwitchOption(this.title, this.value, this.onChanged);

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) => Container(height: 32, margin: const EdgeInsets.only(bottom: 4), padding: const EdgeInsets.symmetric(horizontal: 9), decoration: BoxDecoration(color: const Color(0xFF0D1219), borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFF202631))), child: Row(children: [Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w600))), Switch(value: value, onChanged: onChanged, activeThumbColor: const Color(0xFF00FF68), activeTrackColor: const Color(0xFF075A31), materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)]));
}
