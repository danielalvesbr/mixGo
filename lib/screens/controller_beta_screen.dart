import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';

import 'ai_login_required_screen.dart';
import 'library_screen.dart';
import 'settings_screen.dart';

class ControllerBetaScreen extends StatefulWidget {
  const ControllerBetaScreen({super.key});

  static const routeName = '/controller-beta';

  @override
  State<ControllerBetaScreen> createState() => _ControllerBetaScreenState();
}

class _ControllerBetaScreenState extends State<ControllerBetaScreen> {
  bool _isPlaying = false;
  bool _leftCue = false;
  bool _rightCue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020609),
      body: SafeArea(
        child: Column(
          children: [
            _DeckHeader(
              onSettingsPressed: () => Navigator.pushNamed(
                context,
                SettingsScreen.routeName,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                child: Column(
                  children: [
                    const _TrackRow(),
                    const SizedBox(height: 8),
                    const _Waveform(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _DeckSide(isLeft: true, isCue: _leftCue)),
                        const SizedBox(width: 20),
                        Expanded(child: _DeckSide(isLeft: false, isCue: _rightCue)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _TransportControls(
                            isLeft: true,
                            isCue: _leftCue,
                            onCue: () => setState(() => _leftCue = !_leftCue),
                            onPlay: () => setState(() => _isPlaying = !_isPlaying),
                            isPlaying: _isPlaying,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _TransportControls(
                            isLeft: false,
                            isCue: _rightCue,
                            onCue: () => setState(() => _rightCue = !_rightCue),
                            onPlay: () => setState(() => _isPlaying = !_isPlaying),
                            isPlaying: _isPlaying,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _SignupBanner(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                    ),
                  ],
                ),
              ),
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.controller,
              onLibrary: () => Navigator.pushNamed(
                context,
                LibraryScreen.routeName,
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

class _DeckHeader extends StatelessWidget {
  const _DeckHeader({required this.onSettingsPressed});

  final VoidCallback onSettingsPressed;

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
                      color: Color(0xFF00FF68),
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
                color: const Color(0xFF00FF68),
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
              onPressed: onSettingsPressed,
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

class _TrackRow extends StatelessWidget {
  const _TrackRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _TrackCard(
            deck: 'DECK A  •  DEMO',
            title: 'Acid Rain',
            artist: 'DJ Lumen',
            bpm: '124.0 BPM',
            keyLabel: '4A',
            accent: Color(0xFF00FF68),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _TrackCard(
            deck: 'DECK B  •  DEMO',
            title: 'Samba de Sol (Remix)',
            artist: 'DJ Lumen',
            bpm: '124.0 BPM',
            keyLabel: '5B',
            accent: Color(0xFF00D9FF),
          ),
        ),
      ],
    );
  }
}

class _TrackCard extends StatelessWidget {
  const _TrackCard({
    required this.deck,
    required this.title,
    required this.artist,
    required this.bpm,
    required this.keyLabel,
    required this.accent,
  });

  final String deck;
  final String title;
  final String artist;
  final String bpm;
  final String keyLabel;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.fromLTRB(8, 7, 8, 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1219),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: accent.withValues(alpha: 0.55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            deck,
            style: TextStyle(
              color: accent,
              fontSize: 6,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 3),
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
          const Spacer(),
          Row(
            children: [
              Text(
                '$bpm  $keyLabel',
                style: const TextStyle(color: Color(0xFF8D949F), fontSize: 6),
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFF6C737E), fontSize: 6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Waveform extends StatelessWidget {
  const _Waveform();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: CustomPaint(
        painter: _WaveformPainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final green = Paint()
      ..color = const Color(0xFF00FF68)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    final cyan = Paint()
      ..color = const Color(0xFF00D9FF)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    final center = size.height / 2;
    final count = math.max(1, (size.width / 4).floor());

    for (var index = 0; index < count; index++) {
      final x = index * size.width / count + 2;
      final wave = (math.sin(index * 1.9) * 0.35 +
              math.sin(index * 0.43) * 0.35 +
              0.3) *
          size.height;
      final height = wave.abs().clamp(3.0, size.height * 0.85);
      canvas.drawLine(
        Offset(x, center - height / 2),
        Offset(x, center + height / 2),
        index < count * 0.48 ? green : cyan,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DeckSide extends StatelessWidget {
  const _DeckSide({required this.isLeft, required this.isCue});

  final bool isLeft;
  final bool isCue;

  @override
  Widget build(BuildContext context) {
    final color = isLeft ? const Color(0xFF00FF68) : const Color(0xFF00D9FF);
    return Column(
      children: [
        _JogWheel(accent: color),
        const SizedBox(height: 7),
        Container(
          width: 22,
          height: 15,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isCue ? const Color(0xFF00FF68) : const Color(0xFF111720),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            'HOT CUE',
            style: TextStyle(
              color: isCue ? Colors.black : const Color(0xFF7D8490),
              fontSize: 3,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}

class _JogWheel extends StatefulWidget {
  const _JogWheel({required this.accent});

  final Color accent;

  @override
  State<_JogWheel> createState() => _JogWheelState();
}

class _JogWheelState extends State<_JogWheel> {
  double _turns = 0;

  double? _previousAngle;

  double _angleForPosition(Offset position) {
    const center = Offset(45, 45);
    return math.atan2(position.dy - center.dy, position.dx - center.dx);
  }

  void _startCircularGesture(DragStartDetails details) {
    _previousAngle = _angleForPosition(details.localPosition);
  }

  void _updateCircularGesture(DragUpdateDetails details) {
    final currentAngle = _angleForPosition(details.localPosition);
    final previousAngle = _previousAngle;
    if (previousAngle == null) {
      _previousAngle = currentAngle;
      return;
    }

    var delta = currentAngle - previousAngle;
    if (delta > math.pi) delta -= math.pi * 2;
    if (delta < -math.pi) delta += math.pi * 2;

    setState(() => _turns += delta / (math.pi * 2));
    _previousAngle = currentAngle;
  }

  void _endCircularGesture([DragEndDetails? details]) {
    _previousAngle = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _startCircularGesture,
      onPanUpdate: _updateCircularGesture,
      onPanEnd: _endCircularGesture,
      onPanCancel: _endCircularGesture,
      child: SizedBox(
        width: 90,
        height: 90,
        child: CustomPaint(
          painter: _JogWheelPainter(accent: widget.accent, turns: _turns),
        ),
      ),
    );
  }
}

class _JogWheelPainter extends CustomPainter {
  const _JogWheelPainter({required this.accent, required this.turns});

  final Color accent;
  final double turns;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width * 0.39;
    final outer = Paint()
      ..color = const Color(0xFF101722)
      ..style = PaintingStyle.fill;
    final ring = Paint()
      ..color = accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final inner = Paint()
      ..color = const Color(0xFF080B10)
      ..style = PaintingStyle.fill;
    final marker = Paint()
      ..color = accent
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius + 8, outer);
    canvas.drawCircle(center, radius + 8, ring);
    canvas.drawCircle(center, radius - 1, inner);
    final angle = turns * math.pi * 2 - math.pi / 2;
    canvas.drawLine(
      center + Offset(math.cos(angle) * (radius - 4), math.sin(angle) * (radius - 4)),
      center + Offset(math.cos(angle) * (radius + 4), math.sin(angle) * (radius + 4)),
      marker,
    );
  }

  @override
  bool shouldRepaint(covariant _JogWheelPainter oldDelegate) =>
      oldDelegate.turns != turns || oldDelegate.accent != accent;
}

class _TransportControls extends StatelessWidget {
  const _TransportControls({
    required this.isLeft,
    required this.isCue,
    required this.onCue,
    required this.onPlay,
    required this.isPlaying,
  });

  final bool isLeft;
  final bool isCue;
  final bool isPlaying;
  final VoidCallback onCue;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    final accent = isLeft ? const Color(0xFF00FF68) : const Color(0xFF00D9FF);
    return Row(
      mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        _RoundControl(
          label: 'CUE',
          color: isCue ? accent : const Color(0xFF6E7581),
          onPressed: onCue,
        ),
        const SizedBox(width: 6),
        _RoundControl(
          icon: isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
          color: accent,
          onPressed: onPlay,
        ),
      ],
    );
  }
}

class _RoundControl extends StatelessWidget {
  const _RoundControl({this.label, this.icon, required this.color, required this.onPressed});

  final String? label;
  final IconData? icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF111720),
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: 26,
          height: 22,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: color.withValues(alpha: 0.8)),
          ),
          child: icon == null
              ? Text(
                  label!,
                  style: TextStyle(color: color, fontSize: 6, fontWeight: FontWeight.w900),
                )
              : Icon(icon, color: color, size: 14),
        ),
      ),
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
        color: const Color(0xFF12101A),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color(0xFFC82DE2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.workspace_premium_outlined, color: Color(0xFFC82DE2), size: 12),
              SizedBox(width: 5),
              Text(
                'Libere Recomendações ilimitadas',
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
              color: const Color(0xFFC82DE2),
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
