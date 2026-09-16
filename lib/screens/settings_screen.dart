import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';
import 'controller_beta_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _bluetoothDiscovery = true;
  bool _highFidelity = true;
  bool _copilotSync = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020609),
      body: SafeArea(
        child: Column(
          children: [
            _SettingsHeader(onBack: () => Navigator.pop(context)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _SettingsSectionLabel(
                      label: 'MIDI & HARDWARE',
                      color: Color(0xFF00FF68),
                    ),
                    const _SettingsOption(
                      title: 'Controladora MIDI',
                      value: 'Demo (sem hardware)',
                    ),
                    const _SettingsOption(
                      title: 'Mapeamento de Botões',
                      value: 'Padrão MixGo',
                    ),
                    _SettingsSwitch(
                      title: 'Auto-detectar via Bluetooth',
                      value: _bluetoothDiscovery,
                      onChanged: (value) => setState(() => _bluetoothDiscovery = value),
                    ),
                    const SizedBox(height: 12),
                    const _SettingsSectionLabel(
                      label: 'ÁUDIO & LATÊNCIA',
                      color: Color(0xFF00D9FF),
                    ),
                    const _SettingsOption(
                      title: 'Latência de Áudio',
                      value: 'Preview local',
                    ),
                    const _SettingsOption(
                      title: 'Formato de Saída',
                      value: 'Mock stereo',
                    ),
                    _SettingsSwitch(
                      title: 'Modo Alta Fidelidade',
                      value: _highFidelity,
                      onChanged: (value) => setState(() => _highFidelity = value),
                    ),
                    const SizedBox(height: 12),
                    const _SettingsSectionLabel(
                      label: 'AI & DJ COPILOT PREFERÊNCIAS',
                      color: Color(0xFFC323FF),
                    ),
                    const _SettingsOption(
                      title: 'Agressividade da IA',
                      value: 'Preview local',
                    ),
                    _SettingsSwitch(
                      title: 'Auto-Sync BPM (Demo)',
                      value: _copilotSync,
                      onChanged: (value) => setState(() => _copilotSync = value),
                    ),
                    const SizedBox(height: 12),
                    const _SettingsSectionLabel(
                      label: 'CONTA & DADOS',
                      color: Color(0xFF88909B),
                    ),
                    const _SettingsOption(
                      title: 'Status da Sessão',
                      value: 'Visitante (Demo)',
                    ),
                    const _SettingsOption(
                      title: 'Perfil',
                      value: 'Entrar',
                    ),
                  ],
                ),
              ),
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.controller,
              onController: () => Navigator.pushReplacementNamed(
                context,
                ControllerBetaScreen.routeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.chevron_left_rounded, size: 18),
              color: const Color(0xFFD9DDE3),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints.tightFor(width: 27, height: 27),
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFF1A202A),
                shape: const CircleBorder(),
              ),
              tooltip: 'Voltar',
            ),
            const SizedBox(width: 7),
            const Text(
              'Configurações',
              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSectionLabel extends StatelessWidget {
  const _SettingsSectionLabel({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, bottom: 5),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 5,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.7,
        ),
      ),
    );
  }
}

class _SettingsOption extends StatelessWidget {
  const _SettingsOption({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1219),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF202631)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Color(0xFF737B87), fontSize: 6),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF68717D), size: 13),
        ],
      ),
    );
  }
}

class _SettingsSwitch extends StatelessWidget {
  const _SettingsSwitch({required this.title, required this.value, required this.onChanged});

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1219),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF202631)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w600),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: const Color(0xFF00FF68),
            activeTrackColor: const Color(0xFF075A31),
            inactiveThumbColor: const Color(0xFF414957),
            inactiveTrackColor: const Color(0xFF161C25),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
