
Development
-----------
The app is build in Phoeinx web framework. 

### Database
The database is configure with a premade docker-compose config.

#### Setup
```sh
docker-compose up -d
```

#### Stop database
```sh
docker-compose down
```

### Phoenix Web
Make sure to `cd ./skooog` first.

#### Get depenedencies
```sh
mix deps.get
```

#### Migrate database
```sh
mix ecto.migrate 
# OR mix ecto.setup 
```

#### Start server
```sh
mix phx.server
```

#### Sync strings
```sh
mix gettext.extract --merge
```

#### Generate model
```sh
mix phx.gen.html Core NumberThing numberthings text:string
```

Current datamodel
-----------------

Användare
- Inloggning (användare, lösen?)
- Har ETT namn
- Har EN behörighet (A,B,C)

Köpare
- Har ETT namn
- Har ETT eget unikt ID (KöparID)

Objekt
- Har ETT eget unikt ID (ObjektID)
- Resterande beskrivna attribut ifrån bladet...

ObjektKommentar
- Tillhör ETT objekt (ObjektID)
- Tillhör EN användare (UserID)
- Text ETT innehåll

Skördare
- Har ETT eget unikt ID (SkörarID)
- Har ETT namn

Delegring
- Har ETT projekt (ObjektID)
- Har EN typ (skörade / manuell)
- Har EN skördare (SköradID) om typ=skörade
- Har EN prioritet

## Model generation
```sh
mix phx.gen.html Core Object objects buyer_id:references:buyers supplier:string location:string deforestation_submission_date:date deforestation_confirmed_date:date area:decimal preliminary_volume:decimal sticks:boolean sticks_volume:decimal
```

### Custom types
- `business_status:object_business_status`
- `type:object_type`