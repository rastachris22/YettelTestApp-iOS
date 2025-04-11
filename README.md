# YettelTestApp-iOS
# iOS App Setup and Notes

## Xcode Projekt Generálása Tuist segítségével

Az Xcode projekt generálásához a [Tuist](https://tuist.io) nevű toolt használtam.  
A repository letöltése, a tool telepítése és beállítása után az alábbi parancsokat kell kiadni a projekt könyvtárában:

```bash
tuist install
tuist generate
```

A sikeres generálást követően megnyílik az Xcode projekt, és az alkalmazás már buildelhető is.

## Design és Megvalósítás

Az alkalmazás felépítése az Apple iOS Human Interface Guidelines alapján történt.  
Ennek eredményeképpen például a **Navigation Bar** eltér a wireframe-en látható verziótól — a testreszabott natív iOS Navigation Bar került felhasználásra.

## Finomhangolásra Szoruló Részek

- `FontStyle` definiálása
- Bizonyos UI elemek külön `View`-ba történő kiszervezése az újrafelhasználhatóság érdekében

## Javaslatok a Továbbfejlesztéshez

- Az API adatstruktúrák mobilbaráttá tétele:
  - Szomszédos vármegyék tárolása a backend-en
  - A képernyőkhöz igazodó, előfeldolgozott API válaszok
  - Kliens oldali mappelés minimalizálása (pl. egymáshoz tartozó objektumok előre összekapcsolása backend oldalon)

---

*Made with ❤️ using Tuist and SwiftUI*


