import 'package:flutter/material.dart';

import '../widgets/mixgo_bottom_nav.dart';
import 'controller_full_screen.dart';
import 'library_full_screen.dart';

class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  static const routeName = '/assistant';

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final _messageController = TextEditingController();
  final _messages = <_AssistantMessage>[
    const _AssistantMessage(
      text: 'Analisando o Deck A. Encontrei uma\nharmonia perfeita de 124 BPM em 5B.\nSugiro o clássico “Samba de Sol” ou quer\nalgo com mais energia?',
      isUser: false,
    ),
    const _AssistantMessage(
      text: 'Quero algo brasileiro com bastante\npercussão para manter a pista no alto.',
      isUser: true,
    ),
    const _AssistantMessage(
      text: 'Preparando sugestões de Afro House\nbrasileiro. Veja o que achei destas opções\ncombinam bem com seu BPM atual.',
      isUser: false,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage([String? suggestion]) {
    final text = (suggestion ?? _messageController.text).trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_AssistantMessage(text: text, isUser: true));
      _messages.add(const _AssistantMessage(
        text: 'Entendi. Vou ajustar a próxima sugestão para\nessa energia e manter a mixagem em 124 BPM.',
        isUser: false,
      ));
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020609),
      body: SafeArea(
        child: Column(
          children: [
            const _AssistantHeader(),
            const _DeckStatus(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
                children: [
                  for (final message in _messages) ...[
                    _MessageBubble(message: message),
                    const SizedBox(height: 9),
                  ],
                  const _SuggestionLabel(),
                  const SizedBox(height: 6),
                  _Suggestions(onSuggestionSelected: _sendMessage),
                ],
              ),
            ),
            _MessageComposer(
              controller: _messageController,
              onSend: _sendMessage,
            ),
            MixGoBottomNav(
              selected: MixGoNavItem.assistant,
              selectedColor: const Color(0xFFC323FF),
              onController: () => Navigator.pushReplacementNamed(
                context,
                ControllerFullScreen.routeName,
              ),
              onLibrary: () => Navigator.pushReplacementNamed(
                context,
                LibraryFullScreen.routeName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AssistantMessage {
  const _AssistantMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;
}

class _AssistantHeader extends StatelessWidget {
  const _AssistantHeader();

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
              child: const Text('AI', style: TextStyle(color: Colors.black, fontSize: 5, fontWeight: FontWeight.w900)),
            ),
            const Spacer(),
            const Icon(Icons.more_vert_rounded, color: Color(0xFF9FA6B1), size: 18),
          ],
        ),
      ),
    );
  }
}

class _DeckStatus extends StatelessWidget {
  const _DeckStatus();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1219),
        border: Border.all(color: const Color(0xFF202631)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Row(
        children: [
          Icon(Icons.chat_bubble_outline_rounded, color: Color(0xFF00FF68), size: 11),
          SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('PREVIEW LOCAL DO DECK A', style: TextStyle(color: Color(0xFF777F8A), fontSize: 5, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
              SizedBox(height: 2),
              Text('Acid Rain — 124 BPM (Mock)', style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final _AssistantMessage message;

  @override
  Widget build(BuildContext context) {
    final bubbleColor = message.isUser ? const Color(0xFFB52AE8) : const Color(0xFF121821);
    final borderColor = message.isUser ? const Color(0xFFD34AFF) : const Color(0xFF29313C);
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 280),
        child: Column(
          crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: borderColor),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isUser ? Colors.white : const Color(0xFFD4D8DE),
                  fontSize: 7,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Text(
              message.isUser ? 'DJ YOU' : 'COPILOT AI',
              style: const TextStyle(color: Color(0xFF5E6672), fontSize: 4, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuggestionLabel extends StatelessWidget {
  const _SuggestionLabel();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'SUGESTÕES DE COPILOT',
      style: TextStyle(color: Color(0xFF5E6672), fontSize: 5, fontWeight: FontWeight.w800, letterSpacing: 0.5),
    );
  }
}

class _Suggestions extends StatelessWidget {
  const _Suggestions({required this.onSuggestionSelected});

  final ValueChanged<String> onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    const suggestions = ['Aumentar energia 🔥', 'Transição harmônica', 'Algo brasileiro'];
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        for (final suggestion in suggestions)
          GestureDetector(
            onTap: () => onSuggestionSelected(suggestion),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF10251B),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xFF176E3E)),
              ),
              child: Text(suggestion, style: const TextStyle(color: Color(0xFF00FF68), fontSize: 6, fontWeight: FontWeight.w700)),
            ),
          ),
      ],
    );
  }
}

class _MessageComposer extends StatelessWidget {
  const _MessageComposer({required this.controller, required this.onSend});

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 5, 12, 7),
      decoration: const BoxDecoration(
        color: Color(0xFF080C12),
        border: Border(top: BorderSide(color: Color(0xFF1B212A)), bottom: BorderSide(color: Color(0xFF1B212A))),
      ),
      child: SizedBox(
        height: 31,
        child: TextField(
          controller: controller,
          onSubmitted: (_) => onSend(),
          style: const TextStyle(color: Colors.white, fontSize: 7),
          cursorColor: const Color(0xFFC323FF),
          decoration: InputDecoration(
            hintText: 'Diga o que você quer tocar em seguida...',
            hintStyle: const TextStyle(color: Color(0xFF656D79), fontSize: 7),
            filled: true,
            fillColor: const Color(0xFF10141C),
            contentPadding: const EdgeInsets.symmetric(horizontal: 9),
            suffixIcon: IconButton(
              onPressed: onSend,
              icon: const Icon(Icons.send_rounded, size: 14),
              color: Colors.white,
              style: IconButton.styleFrom(backgroundColor: const Color(0xFFC323FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              tooltip: 'Enviar mensagem',
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFF29313C))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFF29313C))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Color(0xFFC323FF))),
          ),
        ),
      ),
    );
  }
}

