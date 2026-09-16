// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mixgo/main.dart';

void main() {
  testWidgets('Splash opens the beta controller', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ENTRAR NO DECK'), findsOneWidget);

    await tester.tap(find.text('ENTRAR NO DECK'));
    await tester.pumpAndSettle();

    expect(find.text('DECK A  •  DEMO'), findsOneWidget);
  });

  testWidgets('Splash opens login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Fazer Login / Criar Conta'));
    await tester.pumpAndSettle();

    expect(find.text('Desbloqueie todo o potencial'), findsOneWidget);
  });

  testWidgets('Controller opens library', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('ENTRAR NO DECK'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Biblioteca'));
    await tester.pumpAndSettle();

    expect(find.text('Minha Coleção'), findsOneWidget);
    expect(find.text('Acid Rain'), findsOneWidget);
  });

  testWidgets('Controller opens AI login required and then login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('ENTRAR NO DECK'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Assistente'));
    await tester.pumpAndSettle();

    expect(find.text('🔒 Assistente MixGo'), findsOneWidget);

    await tester.tap(find.text('ENTRAR'));
    await tester.pumpAndSettle();

    expect(find.text('Desbloqueie todo o potencial'), findsOneWidget);
  });

  testWidgets('Login opens signup', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Fazer Login / Criar Conta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CRIAR CONTA GRÁTIS'));
    await tester.pumpAndSettle();

    expect(find.text('Crie seu Deck Virtual'), findsOneWidget);
  });

  testWidgets('Signup returns to login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Fazer Login / Criar Conta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CRIAR CONTA GRÁTIS'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('FAZER LOGIN'));
    await tester.pumpAndSettle();

    expect(find.text('Desbloqueie todo o potencial'), findsOneWidget);
  });

  testWidgets('Controller opens settings', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('ENTRAR NO DECK'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Configurações'), findsOneWidget);
    expect(find.text('Controladora MIDI'), findsOneWidget);
  });

  testWidgets('Login demo opens beta controller', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Fazer Login / Criar Conta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continuar no Modo Demo'));
    await tester.pumpAndSettle();

    expect(find.text('DECK A  •  DEMO'), findsOneWidget);
  });

  testWidgets('Controller Full opens and controls respond', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed('/controller-full');
    await tester.pumpAndSettle();

    expect(find.text('DECK A  •  PREVIEW'), findsOneWidget);
    expect(find.text('HOT CUE'), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.play_arrow_rounded).first);
    await tester.pump();
    expect(find.byIcon(Icons.pause_rounded), findsNWidgets(2));

    await tester.tap(find.text('HOT CUE').first);
    await tester.drag(find.byType(CustomPaint).first, const Offset(0, 20));
    await tester.pump();
  });

  testWidgets('Assistant opens and sends a mock message', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed('/assistant');
    await tester.pumpAndSettle();

    expect(find.text('SUGESTÕES DE COPILOT'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Tocar algo mais energético');
    await tester.tap(find.byTooltip('Enviar mensagem'));
    await tester.pump();

    expect(find.text('Tocar algo mais energético'), findsOneWidget);
  });

  testWidgets('Full controller opens Assistant', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed('/controller-full');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Assistente'));
    await tester.pumpAndSettle();

    expect(find.text('SUGESTÕES DE COPILOT'), findsOneWidget);
  });

  testWidgets('Assistant returns to full controller', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed('/assistant');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Controlador'));
    await tester.pumpAndSettle();

    expect(find.text('DECK A  •  PREVIEW'), findsOneWidget);
  });

  testWidgets('Settings returns to beta controller', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed('/settings');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Controlador'));
    await tester.pumpAndSettle();

    expect(find.text('DECK A  •  DEMO'), findsOneWidget);
  });

  testWidgets('Login enters the full controller', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Fazer Login / Criar Conta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('ENTRAR'));
    await tester.pumpAndSettle();

    expect(find.text('DECK A  •  PREVIEW'), findsOneWidget);
    expect(find.text('FULL'), findsOneWidget);
  });

  testWidgets('Signup enters the full controller', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Fazer Login / Criar Conta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CRIAR CONTA GRÁTIS'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('CRIAR CONTA E TOCAR'));
    await tester.pumpAndSettle();

    expect(find.text('DECK A  •  PREVIEW'), findsOneWidget);
  });

  testWidgets('Full navigation opens full library and settings', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final navigator = tester.state<NavigatorState>(find.byType(Navigator));
    navigator.pushNamed('/controller-full');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Biblioteca'));
    await tester.pumpAndSettle();

    expect(find.text('FULL LIBRARY'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    await tester.tap(find.text('Controlador'));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Full Demo'), findsOneWidget);
  });

  testWidgets('Beta recommendation banner opens login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('ENTRAR NO DECK'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Libere Recomendações ilimitadas'));
    await tester.pumpAndSettle();

    expect(find.text('Desbloqueie todo o potencial'), findsOneWidget);
  });

  testWidgets('Library search and Assistant navigation work', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('ENTRAR NO DECK'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Biblioteca'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'acid');
    expect(find.text('acid'), findsOneWidget);
    await tester.tap(find.text('Assistente'));
    await tester.pumpAndSettle();

    expect(find.text('🔒 Assistente MixGo'), findsOneWidget);
  });
}
