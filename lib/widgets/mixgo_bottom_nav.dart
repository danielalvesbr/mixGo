import 'package:flutter/material.dart';

enum MixGoNavItem { controller, library, assistant }

class MixGoBottomNav extends StatelessWidget {
  const MixGoBottomNav({
    super.key,
    required this.selected,
    this.onController,
    this.onLibrary,
    this.onAssistant,
    this.disabled = const {},
    this.selectedColor = const Color(0xFF00FF68),
  });

  final MixGoNavItem selected;
  final VoidCallback? onController;
  final VoidCallback? onLibrary;
  final VoidCallback? onAssistant;
  final Set<MixGoNavItem> disabled;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Color(0xFF080C12),
        border: Border(top: BorderSide(color: Color(0xFF1B212A))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.tune_rounded,
            label: 'Controlador',
            selected: selected == MixGoNavItem.controller,
            selectedColor: selectedColor,
            disabled: disabled.contains(MixGoNavItem.controller),
            onPressed: onController,
          ),
          _NavItem(
            icon: Icons.folder_open_outlined,
            label: 'Biblioteca',
            selected: selected == MixGoNavItem.library,
            selectedColor: selectedColor,
            disabled: disabled.contains(MixGoNavItem.library),
            onPressed: onLibrary,
          ),
          _NavItem(
            icon: Icons.auto_awesome_outlined,
            label: 'Assistente',
            selected: selected == MixGoNavItem.assistant,
            selectedColor: selectedColor,
            disabled: disabled.contains(MixGoNavItem.assistant),
            onPressed: onAssistant,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.disabled,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final Color selectedColor;
  final bool disabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final color = selected
        ? selectedColor
        : disabled
            ? const Color(0xFF3B424D)
            : const Color(0xFF68717D);
    return InkWell(
      onTap: disabled ? null : onPressed,
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 86,
        height: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 17),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(color: color, fontSize: 6, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
