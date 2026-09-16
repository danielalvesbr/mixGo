import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';
import 'assistant_screen.dart';
import 'controller_full_screen.dart';

class LibraryFullScreen extends StatefulWidget {
  const LibraryFullScreen({super.key});

  static const routeName = '/library-full';

  @override
  State<LibraryFullScreen> createState() => _LibraryFullScreenState();
}

class _LibraryFullScreenState extends State<LibraryFullScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020609),
      body: SafeArea(
        child: Column(
          children: [
            const _FullLibraryHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SearchField(controller: _searchController),
                    const SizedBox(height: 8),
                    const Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: [
                        _FilterChip('120-128 BPM', selected: true),
                        _FilterChip('House'),
                        _FilterChip('Alta Energia 🔥'),
                      ],
                    ),
                    const SizedBox(height: 17),
                    const Text('Minha Coleção', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 7),
                    const _TrackCard(title: 'Acid Rain', artist: 'DJ Collab Original', bpm: '124 BPM', color: Color(0xFF20C997)),
                    const SizedBox(height: 6),
                    const _TrackCard(title: 'Groove Dealer', artist: 'Funk Master', bpm: '126 BPM', color: Color(0xFFD4A72C)),
                    const SizedBox(height: 15),
                    const Row(children: [Expanded(child: Divider(color: Color(0xFF2B1A30))), Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('FULL LIBRARY', style: TextStyle(color: Color(0xFFC82DE2), fontSize: 5, fontWeight: FontWeight.w800))), Expanded(child: Divider(color: Color(0xFF2B1A30)))]),
                    const SizedBox(height: 12),
                    const _TrackCard(title: 'Samba de Sol (AI Mix)', artist: 'Brasil Electro', bpm: '124 BPM', color: Color(0xFFE96925)),
                    const SizedBox(height: 6),
                    const _TrackCard(title: 'Bossa Nova Chill (Carioca)', artist: 'Instrumental', bpm: '120 BPM', color: Color(0xFFE17157)),
                  ],
                ),
              ),
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.library,
              selectedColor: const Color(0xFFFF3B30),
              onController: () => Navigator.pushReplacementNamed(context, ControllerFullScreen.routeName),
              onAssistant: () => Navigator.pushReplacementNamed(context, AssistantScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

class _FullLibraryHeader extends StatelessWidget {
  const _FullLibraryHeader();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 46,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(TextSpan(children: [
            TextSpan(text: 'Mix ', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800)),
            TextSpan(text: 'Go', style: TextStyle(color: Color(0xFF00FF68), fontSize: 17, fontWeight: FontWeight.w800)),
            TextSpan(text: '  FULL', style: TextStyle(color: Color(0xFF00FF68), fontSize: 5, fontWeight: FontWeight.w900)),
          ])),
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
        cursorColor: const Color(0xFFFF3B30),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Color(0xFF7D8591), size: 14),
          hintText: 'Pesquisar faixas, artistas ou playlists...',
          hintStyle: const TextStyle(color: Color(0xFF737B87), fontSize: 7),
          filled: true,
          fillColor: const Color(0xFF0D1219),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFF202631))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFF202631))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFFFF3B30))),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip(this.label, {this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        decoration: BoxDecoration(color: selected ? const Color(0xFF00FF68) : const Color(0xFF0D1219), borderRadius: BorderRadius.circular(4), border: Border.all(color: selected ? const Color(0xFF00FF68) : const Color(0xFF29303A))),
        child: Text(label, style: TextStyle(color: selected ? Colors.black : const Color(0xFFD2D5DA), fontSize: 6, fontWeight: FontWeight.w800)),
      );
}

class _TrackCard extends StatelessWidget {
  const _TrackCard({required this.title, required this.artist, required this.bpm, required this.color});

  final String title;
  final String artist;
  final String bpm;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: const Color(0xFF0D1219), borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xFF202631))),
        child: Row(children: [
          Container(width: 38, height: 38, decoration: BoxDecoration(color: color.withValues(alpha: 0.8), borderRadius: BorderRadius.circular(4)), child: const Icon(Icons.graphic_eq_rounded, color: Colors.white, size: 20)),
          const SizedBox(width: 8),
          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w700)), const SizedBox(height: 3), Text(artist, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF8D949F), fontSize: 6)), const SizedBox(height: 2), Text(bpm, style: TextStyle(color: color, fontSize: 6, fontWeight: FontWeight.w700))])),
          const Icon(Icons.library_music_outlined, color: Color(0xFF00FF68), size: 14),
        ]),
      );
}
