<h1 align="center"> Progetto Sistemi Informativi 2017/2018 </h1>
<p class="tagline"> Canobbio Edoardo 805585</p>

In questo file viene raccolto tutto il procedimento di creazione del Sistema Informativo. Sono tuttavia disponibili anche i singoli files per ogni step (dagli Use Case ai file SQL).

## Indice
[Glossario](#glossario)<br>
[Requisiti Rivisti](#requisiti-rivisti)<br>
[Use Cases](#use-cases)<br>
[Diagramma delle Classi](#diagramma-delle-classi)<br>
[Schema ER](#schema-ER)<br>
[Schema a stella](#schema-a-stella)<br>
[Implementazione SQL](#implementazione-sql)<br>
[Interrogazione SQL](#interrogazione-sql)<br>

## Glossario

|Termine|Sinonimi|Descrizione|
|:-----|:------|:---------|
|membro||persona afferente all'ateneo|
|richiedente||un membro che effettua una richiesta|
|missione||incarico svolto da un membro per conto dell'ateneo|
|richiesta|[...] di autorizzazione|compilata da un richiedente per autorizzare una missione|
|fondo|capitale iniziale|somma di denaro utilizzata per pagare le missioni|
|strutturato|personale [...]|membri che lavorano per l'ateneo|
|non strutturato|personale [...]|membri che usufruiscono dei servizi dell'ateneo|
|studente||generico membro del personale non strutturato dell'ateneo|
|studente di dottorato||specializzazione di "studente"|
|borsista||specializzazione di "studnte"|
|docente|professore, ricercatore|membro del personale strutturato dell'ateneo|
|tutor||docente a cui è stato assegnato almeno uno studente|
|responsabile|[...] del fondo, [...] del progetto|membro del perosnale strutturato che gestisce un fondo|
|direttore||membro del personale strutturato che supervisiona un dipartimento dell'ateneo|
|assicurazione di viaggio|approvazione, autorizzazione di viaggio|rilasciata dal direttore, esito positivo a una richiesta|
|progetto di ricerca|progetto|collaborazione tra più membri|
|team||gruppo di membri che lavorano ad un progetto|
|borsa|pagamento|somma di denaro pagata ad un borsista|



## Requisiti rivisti

### Processo:
- Un membro deve compilare una richiesta di autorizzazione per andare in missione.

- La richiesta è composta da: nome, cognome e matricola del richiedente, luogo in cui si svolgerà la missione, data di partenza e ritorno, la spesa prevista e il fondo a cui si appoggia.

- Una volta sottomessa la richiesta il richiedente resta in attesa dell'esito.

- Se il richiedente è uno studente la richiesta deve essere approvata anche dal suo tutor.

- La richiesta deve sempre essere approvata dal responsabile del fondo.

- La richiesta deve infine sempre essere approvata dal direttore del dipartimento.

- La richiesta approvata deve arrivare all'ufficio pagamenti.

- L'ufficio pagamenti paga la missione al richiedente.

- Il richiedente viene sempre notificato dell'esito, sia positivo che negativo, della richiesta.


### Personale

- Il personale è diviso in strutturato e non strutturato.

- Strutturato: tecnici-amministrativi e docenti.

- Non strutturato: studenti.

- Un tutor è un docente assegnato a uno studente.

- Tutto il personale afferisce sempre ad un dipartimento.

- I docenti possono insegnare corsi.

### Fondi

- Un fondo deve essere associato a un progetto.

- Un progetto deve avere un responsabile.

- Il responsabile del progetto è anche responsabile del fondo associato.

- Un progetto ha data di inizio e fine.

- Un team è formato da membri dell'ateneo.

- Un team è associato al progetto a cui lavora.

- Solo i membri del team associato a un progetto possono accedere ai fondi di tale progetto.

- I borsisti sono pagati dall'ateneo.

- Un borsista può avere più borse.

- Un borsista può avere più borse attive, purchè i periodi di attività non si sovrappongano.

## Use Cases
![casi](https://github.com/CanobbioE/UNITO/blob/master/SI/singleFiles/diagrams/Use%20Cases%20(extra)/1_Use%20Cases.png)
