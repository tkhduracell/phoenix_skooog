
Current datamodel
-----------------

Användare
- Inloggning (användare, lösen?)
- Har ETT namn
- Har EN behörighet (A,B,C)

Projekt
- Har ETT eget unikt ID (ProjektID)
- Har EN köpare (KöparID)
- Resterande beskrivna attribut ifrån bladet...

Köpare
- Har ETT namn
- Har ETT eget unikt ID (KöparID)

Objekt
- Har ETT eget unikt ID (ObjektID)
- Resterande beskrivna attribut ifrån bladet...
- Ägs ETT projekt (ProjektID)

ObjektKommentar
- Tillhör ETT Objekt (ObjektID)
- Tillhör EN användare (UserID)
- Text ETT innehåll

Skördare
- Har ETT eget unikt ID (SkörarID)
- Har ETT namn

Delegring
- Har ETT projekt (ProjektID)
- Har EN typ (skörade / manuell)
- Har EN skördare (SköradID) om typ=skörade
- Har EN prioritet