<<<<<<< HEAD
# curve_clash

A new Flutter project.
=======

# 🎮 Curve Clash

**Curve Clash** er en moderne multiplatform-versjon av klassikeren *Achtung, die Kurve!*  
Spill på TV, styr med mobilen – eller rett fra tastaturet. Laget i Flutter + Flame.
>>>>>>> e1f36d6 (Push fungerende lokal versjon per 28. mai)

## Getting Started

<<<<<<< HEAD
This project is a starting point for a Flutter application.
=======
## 🚀 Hvordan kjøre
>>>>>>> e1f36d6 (Push fungerende lokal versjon per 28. mai)

A few resources to get you started if this is your first Flutter project:

<<<<<<< HEAD
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
> Testet med Flutter 3.22 og Flame 1.29

---

## 🧱 Struktur

```
lib/
├── components/             # Spillobjekter
│   ├── player/             # Player-model + komponent
│   ├── snake.dart
│   └── wall.dart
├── managers/               # Spilllogikk
│   ├── game_manager.dart
│   ├── player_manager.dart
│   ├── wall_manager.dart
│   └── overlay_controller.dart
├── overlays/               # UI overlays
├── config/                 # Farger, knapper, konstantverdier
├── input/                  # Tastatur, mobil osv
└── curve_clash_game.dart   # FlameGame entrypoint
```

---

## 🔧 Debug-modus

Sjekk `lib/config/debug.dart`:

```dart
class DebugConfig {
  static const bool debugMode = true;
}
```

Når aktivert:
- Kan vise slange-kollisjonssirkel
- Logger slangeoppførsel og tastetrykk

---

## 🧭 Planlagte funksjoner

- [x] Nedtelling og startskjerm
- [x] Støtte for tastaturkontroller
- [x] Bevegelse med hale og hull
- [x] Vegg- og selvkollisjon
- [ ] Kollisjon med andre slanger
- [ ] Poengsystem og rundevinnere
- [ ] Mobil som kontroller
- [ ] Apple TV som hovedskjerm
- [ ] Treningsmodus
- [ ] Vinneranimasjoner

---

## 🛠 Vedlikehold

- Bruk `PlayerColors.colors[i]` for spillfarge
- Ikke legg `Component` direkte i managers – bruk `game.add(...)`
- `Snake` får `gameRef` automatisk via `HasGameRef<CurveClashGame>`

---

Laget med ❤️ i Flutter & Flame
>>>>>>> e1f36d6 (Push fungerende lokal versjon per 28. mai)
