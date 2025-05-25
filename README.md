# Curve Clash

Curve Clash er en moderne nyversjon av det klassiske spillet **Achtung, die Kurve!** – med støtte for macOS, tastaturkontroll, flere spillere og retro-stil.

---

## 🚀 Kom i gang (macOS)

```bash
flutter clean
flutter pub get
flutter run -d macos
```

---

## 📁 Mappestruktur

```
lib/
├── main.dart               # Starter appen og registrerer overlays
├── curve_clash_game.dart  # Spillmotor og overlaykontroll
├── game_manager.dart      # Håndterer poeng, runder, og vinnerlogikk
├── player_manager.dart    # Ansvarlig for å spawne og resette spillere
├── player_component.dart  # Komponent for hver spiller (retning, hale, bevegelse)
├── overlays/
│   ├── start_overlay.dart     # Startskjerm med logo og startknapp
│   ├── countdown_overlay.dart # Viser 3-2-1-GO før runde
│   └── round_overlay.dart     # Viser resultat etter runde
├── game_config.dart       # Konstanter som fart og farger
├── player_colors.dart     # Definerer farger for spillere
```

---

## 🎮 Spilleregler

- Slangene styrer med tastatur (A/D for spiller 1, venstre/høyre for spiller 2).
- Kollisjon med hale, annen spiller eller vegg = tap.
- Spilleren som ikke krasjer får 1 poeng.
- Førstemann til 5 poeng vinner.

---

## 🔧 Utviklingsregler

- **Ikke bland UI og logikk** – overlays i egne filer, logikk i managers.
- **Én fil = ett ansvar** – del opp logikk hvis den vokser.
- Bruk `GameManager` for poeng og `PlayerManager` for spillerstart.
- Alt kjørbart skal gå via `flutter run -d macos`.

---

## 🔜 TODO

- [ ] Spillermeny med navn og farger
- [ ] Flere enn 2 spillere
- [ ] Støtte for nettverk og multiplayer?
- [ ] Vis sluttresultat etter 5 poeng
- [ ] Legg til bakgrunnsmusikk

---

## 📦 Assets

```
assets/
├── images/
│   └── curve_clash_logo_offisiell.png
├── audio/
│   ├── count.wav
│   ├── go.wav
│   └── crash.wav
```

---

Utviklet med ❤️ og tastetrykk.