import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';
import 'ai_login_required_screen.dart';
import 'controller_beta_screen.dart';
import 'login_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  static const routeName = '/library';
  static const _background = Color(0xFF020609);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LibraryScreen._background,
      body: SafeArea(
        child: Column(
          children: [
            const _LibraryHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SearchField(controller: _searchController),
                    const SizedBox(height: 8),
                    const _FilterRow(),
                    const SizedBox(height: 17),
                    const Text(
                      'Minha Coleção',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const _LibraryTrack(
                      title: 'Acid Rain',
                      artist: 'DJ Collab Original',
                      bpm: '124 BPM',
                      color: Color(0xFF20C997),
                      isPro: false,
                    ),
                    const SizedBox(height: 6),
                    const _LibraryTrack(
                      title: 'Groove Dealer',
                      artist: 'Funk Master',
                      bpm: '126 BPM',
                      color: Color(0xFFD4A72C),
                      isPro: false,
                    ),
                    const SizedBox(height: 15),
                    const _CopilotDivider(),
                    const SizedBox(height: 12),
                    const _LibraryTrack(
                      title: 'Samba de Sol (AI Mix)',
                      artist: 'Brasil Electro',
                      bpm: '124 BPM',
                      color: Color(0xFFE96925),
                      isPro: true,
                    ),
                    const SizedBox(height: 6),
                    const _LibraryTrack(
                      title: 'Bossa Nova Chill (Carioca)',
                      artist: 'Instrumental',
                      bpm: '120 BPM',
                      color: Color(0xFFE17157),
                      isPro: true,
                    ),
                    const SizedBox(height: 10),
                    _SignupBanner(
                      onPressed: () => Navigator.pushNamed(context, LoginScreen.routeName),
                    ),
                  ],
                ),
              ),
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.library,
              selectedColor: const Color(0xFFFF3B30),
              onController: () => Navigator.pushReplacementNamed(
                context,
                ControllerBetaScreen.routeName,
              ),
              onAssistant: () => Navigator.pushNamed(
                context,
                AiLoginRequiredScreen.routeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LibraryHeader extends StatelessWidget {
  const _LibraryHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Mix ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextSpan(
                    text: 'Go',
                    style: TextStyle(
                      color: _LibraryScreenColors.green,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: BoxDecoration(
                color: _LibraryScreenColors.green,
                borderRadius: BorderRadius.circular(2),
              ),
              child: const Text(
                'BETA',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 5,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_outlined, size: 19),
              color: const Color(0xFFD9DDE3),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints.tightFor(width: 32, height: 32),
              tooltip: 'Configurações',
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 8),
        cursorColor: _LibraryScreenColors.red,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Color(0xFF7D8591), size: 14),
          hintText: 'Pesquisar faixas, artistas ou playlists...',
          hintStyle: const TextStyle(color: Color(0xFF737B87), fontSize: 7),
          filled: true,
          fillColor: _LibraryScreenColors.panel,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFF202631))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFF202631))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFFFF3B30))),
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        _FilterChip('120-128 BPM', selected: true),
        _FilterChip('House'),
        _FilterChip('Alta Energia 🔥'),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip(this.label, {this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: selected ? _LibraryScreenColors.green : _LibraryScreenColors.panel,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: selected ? _LibraryScreenColors.green : const Color(0xFF29303A),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.black : const Color(0xFFD2D5DA),
          fontSize: 6,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _LibraryTrack extends StatelessWidget {
  const _LibraryTrack({
    required this.title,
    required this.artist,
    required this.bpm,
    required this.color,
    required this.isPro,
  });

  final String title;
  final String artist;
  final String bpm;
  final Color color;
  final bool isPro;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: _LibraryScreenColors.panel,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF202631)),
      ),
      child: Row(
        children: [
          _Artwork(color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFF8D949F), fontSize: 6),
                ),
                const SizedBox(height: 2),
                Text(
                  bpm,
                  style: TextStyle(color: color, fontSize: 6, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Icon(
            isPro ? Icons.lock_outline_rounded : Icons.library_music_outlined,
            color: isPro ? _LibraryScreenColors.red : _LibraryScreenColors.green,
            size: 14,
          ),
          if (isPro) ...[
            const SizedBox(width: 3),
            const Text(
              'PRO',
              style: TextStyle(color: _LibraryScreenColors.red, fontSize: 5, fontWeight: FontWeight.w900),
            ),
          ],
        ],
      ),
    );
  }
}

class _Artwork extends StatelessWidget {
  const _Artwork({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.9), const Color(0xFF20252D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(Icons.graphic_eq_rounded, color: Colors.white.withValues(alpha: 0.85), size: 20),
    );
  }
}

class _CopilotDivider extends StatelessWidget {
  const _CopilotDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFF2B1A30), height: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'INTELIGÊNCIA ARTIFICIAL CO-PILOT',
            style: TextStyle(
              color: _LibraryScreenColors.magenta,
              fontSize: 5,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.4,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFF2B1A30), height: 1)),
      ],
    );
  }
}

class _SignupBanner extends StatelessWidget {
  const _SignupBanner({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(7),
      child: Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 7),
      decoration: BoxDecoration(
        color: const Color(0xFF170F12),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: _LibraryScreenColors.red),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.lock_outline_rounded, color: _LibraryScreenColors.red, size: 11),
              SizedBox(width: 5),
              Text(
                'Libere Recomendações Ilimitadas',
                style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 4),
            const Text(
            'Crie uma conta para explorar playlists de demonstração\ne testar os controles locais do MixGo.',
            style: TextStyle(color: Color(0xFF9B9AA5), fontSize: 6, height: 1.15),
          ),
          const SizedBox(height: 6),
          Container(
            height: 18,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _LibraryScreenColors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              'CRIAR CONTA GRÁTIS',
              style: TextStyle(color: Colors.white, fontSize: 6, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
      ),
    );
  }
}

class _LibraryScreenColors {
  static const panel = Color(0xFF0D1219);
  static const green = Color(0xFF00FF68);
  static const red = Color(0xFFFF3B30);
  static const magenta = Color(0xFFC82DE2);
}