# MixGo

MixGo é um protótipo Flutter da disciplina TI4 para a Sprint 2 de um DJ deck
com Controller Beta, Controller Full e Copilot AI.

## Tecnologias

- Flutter e Dart
- Material Design e `CustomPainter`
- Dados locais e estados mockados

## Estrutura

- `lib/main.dart`: ponto de entrada e rotas
- `lib/screens/`: telas da Sprint 2
- `test/widget_test.dart`: testes de navegação e interações locais

## Telas

Splash, Controller Beta/Demo, Controller Full, Library, AI Login Required,
Assistant/Copilot, Login, Signup e Settings.

A Controller Beta representa o modo Demo/visitante. A Controller Full representa
a experiência completa visual de usuário autenticado, sem autenticação real.

## Estado atual

Áudio, MIDI, Spotify, IA, backend, autenticação, persistência e sincronização
continuam mockados ou não implementados. Botões, faders, pads, switches e chat
respondem apenas localmente quando aplicável.

## Executar

```bash
flutter pub get
flutter run
```

## Validação

```bash
flutter analyze
flutter test
flutter build web --no-pub
```