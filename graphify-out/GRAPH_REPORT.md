# Graph Report - MixGo  (2026-09-16)

## Corpus Check
- 59 files · ~35,424 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 52 file(s) not represented in the graph (top: (none) 8, .xcconfig 8, .xml 7)

## Summary
- 582 nodes · 785 edges · 40 communities (24 shown, 16 thin omitted)
- Extraction: 98% EXTRACTED · 2% INFERRED · 0% AMBIGUOUS · INFERRED: 17 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `7c7c0c83`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- signup_screen.dart
- my_application.cc
- Win32Window
- AppDelegate
- main.dart
- ai_login_required_screen.dart
- wWinMain
- manifest.json
- What You Must Do When Invoked
- controller_beta_screen.dart
- MainActivity.kt
- graphify reference: extra exports and benchmark
- String?
- graphify reference: query, path, explain
- graphify reference: add a URL and watch a folder
- graphify reference: commit hook and native CLAUDE.md integration
- graphify reference: incremental update and cluster-only
- assistant_screen.dart
- graphify reference: GitHub clone and cross-repo merge
- graphify reference: transcribe video and audio
- MixGo
- CLAUDE.md
- .claude/CLAUDE.md
- extraction-spec.md
- LaunchImage.imageset/README.md
- library_screen.dart
- StatelessWidget
- settings_full_screen.dart
- library_full_screen.dart
- RegisterPlugins
- @gmail
- @mixgo
- controller_full_screen.dart
- settings_screen.dart
- CustomPainter
- build

## God Nodes (most connected - your core abstractions)
1. `Win32Window` - 24 edges
2. `MessageHandler` - 12 edges
3. `What You Must Do When Invoked` - 12 edges
4. `/graphify` - 11 edges
5. `FlutterWindow` - 10 edges
6. `Create` - 10 edges
7. `WndProc` - 10 edges
8. `MessageHandler` - 9 edges
9. `graphify reference: extra exports and benchmark` - 8 edges
10. `_MyApplication` - 7 edges

## Surprising Connections (you probably didn't know these)
- `OnCreate` --calls--> `RegisterPlugins()`  [INFERRED]
  windows/runner/flutter_window.h → windows/flutter/generated_plugin_registrant.cc
- `wWinMain()` --calls--> `CreateAndAttachConsole()`  [INFERRED]
  windows/runner/main.cpp → windows/runner/utils.cpp
- `Win32Window::Win32Window()` --calls--> `Destroy`  [INFERRED]
  windows/runner/win32_window.cpp → windows/runner/win32_window.h
- `my_application_activate()` --calls--> `fl_register_plugins()`  [INFERRED]
  linux/runner/my_application.cc → linux/flutter/generated_plugin_registrant.cc
- `main()` --calls--> `my_application_new()`  [INFERRED]
  linux/runner/main.cc → linux/runner/my_application.cc

## Import Cycles
- None detected.

## Communities (40 total, 16 thin omitted)

### Community 0 - "signup_screen.dart"
Cohesion: 0.06
Nodes (36): controller_full_screen.dart, build, controller, createState, dispose, _emailController, hint, keyboardType (+28 more)

### Community 1 - "my_application.cc"
Cohesion: 0.09
Nodes (22): FlPluginRegistry, FlView, GApplication, gboolean, gchar, GObject, GtkApplication, fl_register_plugins() (+14 more)

### Community 2 - "Win32Window"
Cohesion: 0.06
Nodes (56): FlutterViewController, RECT, unique_ptr, DartProject, HWND, LPARAM, LRESULT, UINT (+48 more)

### Community 3 - "AppDelegate"
Cohesion: 0.06
Nodes (25): Any, Cocoa, Flutter, FlutterAppDelegate, FlutterImplicitEngineBridge, FlutterImplicitEngineDelegate, FlutterMacOS, FlutterPluginRegistry (+17 more)

### Community 4 - "main.dart"
Cohesion: 0.08
Nodes (22): build, main, MyApp, NavigatorState, package:flutter/material.dart, package:flutter_test/flutter_test.dart, package:mixgo/main.dart, Route /assistant (+14 more)

### Community 5 - "ai_login_required_screen.dart"
Cohesion: 0.07
Nodes (28): controller_beta_screen.dart, IconData, AiLoginRequiredScreen, _AssistantLock, _background, build, _CopilotFeatureCard, description (+20 more)

### Community 6 - "wWinMain"
Cohesion: 0.24
Nodes (9): _In_, _In_opt_, vector, wWinMain(), string, wchar_t, CreateAndAttachConsole(), GetCommandLineArguments() (+1 more)

### Community 7 - "manifest.json"
Cohesion: 0.18
Nodes (10): background_color, description, display, icons, name, orientation, prefer_related_applications, short_name (+2 more)

### Community 8 - "What You Must Do When Invoked"
Cohesion: 0.07
Nodes (26): For /graphify add and --watch, For /graphify query, For the commit hook and native CLAUDE.md integration, For --update and --cluster-only, /graphify, Honesty Rules, Interpreter guard for subcommands, Part A - Structural extraction for code files (+18 more)

### Community 9 - "controller_beta_screen.dart"
Cohesion: 0.05
Nodes (44): dart:math, double?, accent, _angleForPosition, artist, bpm, color, ControllerBetaScreen (+36 more)

### Community 15 - "graphify reference: extra exports and benchmark"
Cohesion: 0.22
Nodes (8): graphify reference: extra exports and benchmark, Step 6b - Wiki (only if --wiki flag), Step 7 - Neo4j export (only if --neo4j or --neo4j-push flag), Step 7a - FalkorDB export (only if --falkordb or --falkordb-push flag), Step 7b - SVG export (only if --svg flag), Step 7c - GraphML export (only if --graphml flag), Step 7d - MCP server (only if --mcp flag), Step 8 - Token reduction benchmark (only if total_words > 5000)

### Community 17 - "graphify reference: query, path, explain"
Cohesion: 0.33
Nodes (5): For /graphify explain, For /graphify path, graphify reference: query, path, explain, Step 0 — Constrained query expansion (REQUIRED before traversal), Step 1 — Traversal

### Community 18 - "graphify reference: add a URL and watch a folder"
Cohesion: 0.50
Nodes (3): For /graphify add, For --watch, graphify reference: add a URL and watch a folder

### Community 19 - "graphify reference: commit hook and native CLAUDE.md integration"
Cohesion: 0.50
Nodes (3): For git commit hook, For native CLAUDE.md integration, graphify reference: commit hook and native CLAUDE.md integration

### Community 20 - "graphify reference: incremental update and cluster-only"
Cohesion: 0.50
Nodes (3): For --cluster-only, For --update (incremental re-extraction), graphify reference: incremental update and cluster-only

### Community 21 - "assistant_screen.dart"
Cohesion: 0.09
Nodes (23): _AssistantHeader, _AssistantMessage, AssistantScreen, _AssistantScreenState, build, controller, createState, _DeckStatus (+15 more)

### Community 24 - "MixGo"
Cohesion: 0.25
Nodes (7): Estado atual, Estrutura, Executar, MixGo, Tecnologias, Telas, Validação

### Community 29 - "library_screen.dart"
Cohesion: 0.06
Nodes (36): ai_login_required_screen.dart, build, artist, _Artwork, _background, bpm, build, color (+28 more)

### Community 30 - "StatelessWidget"
Cohesion: 0.11
Nodes (18): _DeckHeader, _DeckSide, _SignupBanner, _TrackRow, _TransportControls, _ChannelFader, _FullDeck, _FullHeader (+10 more)

### Community 31 - "settings_full_screen.dart"
Cohesion: 0.12
Nodes (17): assistant_screen.dart, build, color, _copilotSync, createState, _highFidelity, label, onChanged (+9 more)

### Community 32 - "library_full_screen.dart"
Cohesion: 0.11
Nodes (18): artist, bpm, build, color, controller, createState, dispose, _FilterChip (+10 more)

### Community 36 - "controller_full_screen.dart"
Cohesion: 0.05
Nodes (39): accent, active, _angleForPosition, artist, bpm, createState, _crossfader, deck (+31 more)

### Community 37 - "settings_screen.dart"
Cohesion: 0.06
Nodes (34): Color, _bluetoothDiscovery, build, color, _copilotSync, createState, _highFidelity, label (+26 more)

### Community 38 - "CustomPainter"
Cohesion: 0.29
Nodes (7): CustomPainter, _JogWheelPainter, _WaveformPainter, _CrossfaderPainter, _FaderPainter, _FullJogPainter, _FullWaveformPainter

## Knowledge Gaps
- **255 isolated node(s):** `main`, `build`, `routeName`, `_background`, `_panel` (+250 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 343 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **16 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `build` connect `library_screen.dart` to `controller_beta_screen.dart`?**
  _High betweenness centrality (0.007) - this node is a cross-community bridge._
- **Are the 4 inferred relationships involving `MessageHandler` (e.g. with `Destroy` and `GetClientArea`) actually correct?**
  _`MessageHandler` has 4 INFERRED edges - model-reasoned connections that need verification._
- **What connects `main`, `build`, `routeName` to the rest of the system?**
  _255 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `signup_screen.dart` be split into smaller, more focused modules?**
  _Cohesion score 0.05832147937411095 - nodes in this community are weakly interconnected._
- **Should `my_application.cc` be split into smaller, more focused modules?**
  _Cohesion score 0.09401709401709402 - nodes in this community are weakly interconnected._
- **Should `Win32Window` be split into smaller, more focused modules?**
  _Cohesion score 0.05673076923076923 - nodes in this community are weakly interconnected._
- **Should `AppDelegate` be split into smaller, more focused modules?**
  _Cohesion score 0.06342780026990553 - nodes in this community are weakly interconnected._