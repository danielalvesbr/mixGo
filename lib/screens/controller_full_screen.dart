import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';
import 'assistant_screen.dart';
import 'library_full_screen.dart';
import 'settings_full_screen.dart';

class ControllerFullScreen extends StatefulWidget {
  const ControllerFullScreen({super.key});

  static const routeName = '/controller-full';

  @override
  State<ControllerFullScreen> createState() => _ControllerFullScreenState();
}

class _ControllerFullScreenState extends State<ControllerFullScreen> {
  bool _isPlaying = false;
  bool _leftCue = false;
  bool _rightCue = false;
  final _leftPads = List<bool>.filled(4, false);
  final _rightPads = List<bool>.filled(4, false);
  double _crossfader = 0.5;
  double _leftFader = 0.68;
  double _rightFader = 0.56;

  void _togglePad(List<bool> pads, int index) {
    setState(() => pads[index] = !pads[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020609),
      body: SafeArea(
        child: Column(
          children: [
            const _FullHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(12, 2, 12, 10),
                child: Column(
                  children: [
                    const _FullTrackRow(),
                    const SizedBox(height: 7),
                    const _FullWaveform(),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: _FullDeck(
                            isLeft: true,
                            isCue: _leftCue,
                            pads: _leftPads,
                            faderValue: _leftFader,
                            onCue: () => setState(() => _leftCue = !_leftCue),
                            onPad: (index) => _togglePad(_leftPads, index),
                            onFader: (value) => setState(() => _leftFader = value),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _FullDeck(
                            isLeft: false,
                            isCue: _rightCue,
                            pads: _rightPads,
                            faderValue: _rightFader,
                            onCue: () => setState(() => _rightCue = !_rightCue),
                            onPad: (index) => _togglePad(_rightPads, index),
                            onFader: (value) => setState(() => _rightFader = value),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    _FullMixerRow(
                      value: _crossfader,
                      onChanged: (value) => setState(() => _crossfader = value),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        _FullTransport(
                          isLeft: true,
                          isCue: _leftCue,
                          isPlaying: _isPlaying,
                          onCue: () => setState(() => _leftCue = !_leftCue),
                          onPlay: () => setState(() => _isPlaying = !_isPlaying),
                        ),
                        const Spacer(),
                        _FullTransport(
                          isLeft: false,
                          isCue: _rightCue,
                          isPlaying: _isPlaying,
                          onCue: () => setState(() => _rightCue = !_rightCue),
                          onPlay: () => setState(() => _isPlaying = !_isPlaying),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const _RecommendationCard(),
                  ],
                ),
              ),
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.controller,
              onLibrary: () => Navigator.pushReplacementNamed(
                context,
                LibraryFullScreen.routeName,
              ),
              onAssistant: () => Navigator.pushReplacementNamed(
                context,
                AssistantScreen.routeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FullHeader extends StatelessWidget {
  const _FullHeader();

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
                    style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: 'Go',
                    style: TextStyle(color: Color(0xFF00FF68), fontSize: 17, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: BoxDecoration(color: const Color(0xFF00FF68), borderRadius: BorderRadius.circular(2)),
              child: const Text('FULL', style: TextStyle(color: Colors.black, fontSize: 5, fontWeight: FontWeight.w900)),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, SettingsFullScreen.routeName),
              icon: const Icon(Icons.settings_outlined, color: Color(0xFFD9DDE3), size: 19),
              tooltip: 'Configurações',
            ),
          ],
        ),
      ),
    );
  }
}

class _FullTrackRow extends StatelessWidget {
  const _FullTrackRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _FullTrackCard(deck: 'DECK A  •  PREVIEW', title: 'Acid Rain', artist: 'DJ Collab Original', bpm: '124.0 BPM', accent: Color(0xFF00FF68))),
        SizedBox(width: 8),
        Expanded(child: _FullTrackCard(deck: 'DECK B  •  PREVIEW', title: 'Samba de Sol (Remix)', artist: 'Brasil Electro', bpm: '124.0 BPM', accent: Color(0xFF00D9FF))),
      ],
    );
  }
}

class _FullTrackCard extends StatelessWidget {
  const _FullTrackCard({required this.deck, required this.title, required this.artist, required this.bpm, required this.accent});

  final String deck;
  final String title;
  final String artist;
  final String bpm;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.fromLTRB(8, 7, 7, 6),
      decoration: BoxDecoration(color: const Color(0xFF0D1219), borderRadius: BorderRadius.circular(7), border: Border.all(color: accent.withValues(alpha: 0.55))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(deck, style: TextStyle(color: accent, fontSize: 6, fontWeight: FontWeight.w800, letterSpacing: 0.4)),
        const SizedBox(height: 3),
        Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w700)),
        const Spacer(),
        Row(children: [
          Text(bpm, style: TextStyle(color: accent, fontSize: 6, fontWeight: FontWeight.w700)),
          const Spacer(),
          Flexible(child: Text(artist, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Color(0xFF6C737E), fontSize: 5))),
        ]),
      ]),
    );
  }
}

class _FullWaveform extends StatelessWidget {
  const _FullWaveform();

  @override
  Widget build(BuildContext context) => SizedBox(height: 34, child: CustomPaint(painter: _FullWaveformPainter(), child: const SizedBox.expand()));
}

class _FullWaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = size.height / 2;
    final green = Paint()..color = const Color(0xFF00FF68)..strokeWidth = 2..strokeCap = StrokeCap.round;
    final cyan = Paint()..color = const Color(0xFF00D9FF)..strokeWidth = 2..strokeCap = StrokeCap.round;
    final count = math.max(1, (size.width / 4).floor());
    for (var index = 0; index < count; index++) {
      final x = index * size.width / count + 2;
      final height = ((math.sin(index * 1.9) * 0.35 + math.sin(index * 0.43) * 0.35 + 0.3) * size.height).abs().clamp(3.0, size.height * 0.85);
      canvas.drawLine(Offset(x, center - height / 2), Offset(x, center + height / 2), index < count * 0.48 ? green : cyan);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _FullDeck extends StatelessWidget {
  const _FullDeck({required this.isLeft, required this.isCue, required this.pads, required this.faderValue, required this.onCue, required this.onPad, required this.onFader});

  final bool isLeft;
  final bool isCue;
  final List<bool> pads;
  final double faderValue;
  final VoidCallback onCue;
  final ValueChanged<int> onPad;
  final ValueChanged<double> onFader;

  @override
  Widget build(BuildContext context) {
    final accent = isLeft ? const Color(0xFF00FF68) : const Color(0xFF00D9FF);
    return Column(children: [
      _FullJogWheel(accent: accent),
      const SizedBox(height: 4),
      _PadRow(pads: pads, accent: accent, onPad: onPad),
      const SizedBox(height: 5),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
        _Knob(label: 'GAIN'),
        _Knob(label: 'MID'),
        _Knob(label: 'LOW'),
      ]),
      const SizedBox(height: 4),
      _ChannelFader(value: faderValue, accent: accent, onChanged: onFader),
      const SizedBox(height: 3),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(isLeft ? 'CH A' : 'CH B', style: TextStyle(color: accent, fontSize: 5, fontWeight: FontWeight.w800)),
        Text(isLeft ? '124.0 BPM' : '124.0 BPM', style: const TextStyle(color: Color(0xFF6C737E), fontSize: 5)),
      ]),
      const SizedBox(height: 4),
      _SmallCueButton(label: 'CUE', active: isCue, accent: accent, onPressed: onCue),
    ]);
  }
}

class _FullJogWheel extends StatefulWidget {
  const _FullJogWheel({required this.accent});

  final Color accent;

  @override
  State<_FullJogWheel> createState() => _FullJogWheelState();
}

class _FullJogWheelState extends State<_FullJogWheel> {
  double _turns = 0;
  double? _previousAngle;

  double _angleForPosition(Offset position) {
    const center = Offset(36, 36);
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
      child: SizedBox(width: 72, height: 72, child: CustomPaint(painter: _FullJogPainter(accent: widget.accent, turns: _turns))),
    );
  }
}

class _FullJogPainter extends CustomPainter {
  const _FullJogPainter({required this.accent, required this.turns});

  final Color accent;
  final double turns;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width * 0.37;
    final outer = Paint()..color = const Color(0xFF101722);
    final ring = Paint()..color = accent..style = PaintingStyle.stroke..strokeWidth = 1.5;
    final inner = Paint()..color = const Color(0xFF080B10);
    final marker = Paint()..color = accent..strokeWidth = 2..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius + 7, outer);
    canvas.drawCircle(center, radius + 7, ring);
    canvas.drawCircle(center, radius - 1, inner);
    final angle = turns * math.pi * 2 - math.pi / 2;
    canvas.drawLine(center + Offset(math.cos(angle) * (radius - 4), math.sin(angle) * (radius - 4)), center + Offset(math.cos(angle) * (radius + 4), math.sin(angle) * (radius + 4)), marker);
  }

  @override
  bool shouldRepaint(covariant _FullJogPainter oldDelegate) => oldDelegate.turns != turns;
}

class _PadRow extends StatelessWidget {
  const _PadRow({required this.pads, required this.accent, required this.onPad});

  final List<bool> pads;
  final Color accent;
  final ValueChanged<int> onPad;

  @override
  Widget build(BuildContext context) {
    const labels = ['HOT CUE', 'LOOP', 'BEAT', 'SAMPLE'];
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      for (var index = 0; index < labels.length; index++)
        GestureDetector(
          onTap: () => onPad(index),
          child: Container(
            width: 25,
            height: 17,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: pads[index] ? accent : const Color(0xFF151B24), borderRadius: BorderRadius.circular(3), border: Border.all(color: accent.withValues(alpha: 0.65))),
            child: Text(labels[index], style: TextStyle(color: pads[index] ? Colors.black : const Color(0xFF828B98), fontSize: 3, fontWeight: FontWeight.w900)),
          ),
        ),
    ]);
  }
}

class _Knob extends StatelessWidget {
  const _Knob({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) => Column(children: [
        Container(width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xFF151B24), border: Border.all(color: const Color(0xFF536071))), child: const Align(alignment: Alignment.topCenter, child: SizedBox(width: 2, height: 5, child: ColoredBox(color: Color(0xFFD4D9DE))))),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Color(0xFF68717D), fontSize: 4)),
      ]);
}

class _ChannelFader extends StatelessWidget {
  const _ChannelFader({required this.value, required this.accent, required this.onChanged});

  final double value;
  final Color accent;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) => onChanged((value - details.delta.dy / 80).clamp(0.0, 1.0)),
      child: SizedBox(height: 42, child: CustomPaint(painter: _FaderPainter(value: value, accent: accent), child: const SizedBox.expand())),
    );
  }
}

class _FaderPainter extends CustomPainter {
  const _FaderPainter({required this.value, required this.accent});

  final double value;
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.width / 2;
    final track = Paint()..color = const Color(0xFF343D4A)..strokeWidth = 2;
    final fill = Paint()..color = accent..strokeWidth = 2;
    final top = 4.0;
    final bottom = size.height - 4;
    final y = bottom - (bottom - top) * value;
    canvas.drawLine(Offset(center, top), Offset(center, bottom), track);
    canvas.drawLine(Offset(center, y), Offset(center, bottom), fill);
    canvas.drawRect(Rect.fromCenter(center: Offset(center, y), width: 12, height: 5), Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _FaderPainter oldDelegate) => oldDelegate.value != value;
}

class _FullMixerRow extends StatelessWidget {
  const _FullMixerRow({required this.value, required this.onChanged});

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) => onChanged((value + details.delta.dx / 150).clamp(0.0, 1.0)),
      child: SizedBox(height: 24, child: CustomPaint(painter: _CrossfaderPainter(value: value), child: const SizedBox.expand())),
    );
  }
}

class _CrossfaderPainter extends CustomPainter {
  const _CrossfaderPainter({required this.value});

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height / 2;
    final left = size.width * 0.14;
    final right = size.width * 0.86;
    canvas.drawLine(Offset(left, y), Offset(right, y), Paint()..color = const Color(0xFF343D4A)..strokeWidth = 2);
    final x = left + (right - left) * value;
    canvas.drawRect(Rect.fromCenter(center: Offset(x, y), width: 14, height: 6), Paint()..color = Colors.white);
    const labelStyle = TextStyle(color: Color(0xFF68717D), fontSize: 4);
    const leftText = TextSpan(text: 'A', style: labelStyle);
    const rightText = TextSpan(text: 'B', style: labelStyle);
    TextPainter(text: leftText, textDirection: TextDirection.ltr)..layout()..paint(canvas, Offset(left - 2, y + 7));
    TextPainter(text: rightText, textDirection: TextDirection.ltr)..layout()..paint(canvas, Offset(right - 2, y + 7));
  }

  @override
  bool shouldRepaint(covariant _CrossfaderPainter oldDelegate) => oldDelegate.value != value;
}

class _SmallCueButton extends StatelessWidget {
  const _SmallCueButton({required this.label, required this.active, required this.accent, required this.onPressed});

  final String label;
  final bool active;
  final Color accent;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(onTap: onPressed, child: Container(width: 27, height: 19, alignment: Alignment.center, decoration: BoxDecoration(color: active ? accent : const Color(0xFF151B24), borderRadius: BorderRadius.circular(4), border: Border.all(color: accent)), child: Text(label, style: TextStyle(color: active ? Colors.black : accent, fontSize: 6, fontWeight: FontWeight.w900))));
}

class _FullTransport extends StatelessWidget {
  const _FullTransport({required this.isLeft, required this.isCue, required this.isPlaying, required this.onCue, required this.onPlay});

  final bool isLeft;
  final bool isCue;
  final bool isPlaying;
  final VoidCallback onCue;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    final accent = isLeft ? const Color(0xFF00FF68) : const Color(0xFF00D9FF);
    return Row(children: [
      _SmallCueButton(label: 'CUE', active: isCue, accent: accent, onPressed: onCue),
      const SizedBox(width: 5),
      GestureDetector(onTap: onPlay, child: Container(width: 26, height: 22, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFF151B24), borderRadius: BorderRadius.circular(5), border: Border.all(color: accent)), child: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, color: accent, size: 15))),
    ]);
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard();

  @override
  Widget build(BuildContext context) => Container(width: double.infinity, height: 49, padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: const Color(0xFF1B1122), borderRadius: BorderRadius.circular(7), border: Border.all(color: const Color(0xFFC323FF))), child: Row(children: [
        const Icon(Icons.auto_awesome_rounded, color: Color(0xFFC323FF), size: 13),
        const SizedBox(width: 7),
        const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text('MOCK RECOMMENDATION', style: TextStyle(color: Color(0xFFC323FF), fontSize: 5, fontWeight: FontWeight.w900)), SizedBox(height: 2), Text('Bossa Groove — 124 BPM', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w800)), Text('Preview local da interface', style: TextStyle(color: Color(0xFF9E7BAA), fontSize: 5))])),
        Container(height: 21, padding: const EdgeInsets.symmetric(horizontal: 8), alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFFC323FF), borderRadius: BorderRadius.circular(4)), child: const Text('CARREGAR', style: TextStyle(color: Colors.white, fontSize: 5, fontWeight: FontWeight.w900))),
      ]));
}

