/* File untuk eksplorasi */
:- dynamic(teleport/1).
:- dynamic(dungeon/1).

/* Gerak ke Utara */
w :-
    running(_),
    \+round(_),
    posisi(A,B),
    isWall(A,B-1,A,B-1),
    write('Nabrak'),nl,
    !.

w :-
    running(_),
    \+round(_),
    posisi(A,B),
    isBorder(A,B-1),
    write('Nabrak'),nl,
    !.

w :-
    running(_),
    \+round(_),
    posisi(A,B),
    isStore(A,B-1),
    retract(posisi(A,B)),
    Bnew is B-1,
    asserta(posisi(A,Bnew)),
    asserta(inStore(1)),
    write('Anda berada di Store'),nl,
    write('Masukkan \'store.\' untuk melihat menu dan melakukan pembelian.'),nl,
    !.

w :-
    running(_),
    \+round(_),
    posisi(A,B),
    isQuest(A,B-1),
    retract(posisi(A,B)),
    Bnew is B-1,
    asserta(posisi(A,Bnew)),
    write('Anda berada di Quest'),startQuest,
    !.

w :-
    running(_),
    \+round(_),
    posisi(A,B),
    isDungeon(A,B-1),
    retract(posisi(A,B)),
    Bnew is B-1,
    asserta(posisi(A,Bnew)),
    asserta(dungeon(1)),
    write('Anda berada di Dungeon'),nl, bossMode,
    !.

w :-
    running(_),
    \+round(_),
    posisi(A,B),
    isTeleport(A,B-1),
    retract(posisi(A,B)),
    Bnew is B-1,
    asserta(posisi(A,Bnew)),
    asserta(teleport(1)),
    write('Anda berada di Teleport'),nl,
    write('Masukkan \'teleport.\' untuk menggunakan teleport.'),nl,
    !.

w :-
    running(_),
    \+round(_),
    posisi(A,B),
    \+cekArea(A,B),
    retractall(inStore(_)),
    retractall(dungeon(_)),
    retractall(teleport(_)),
    retract(posisi(A,B)),
    Bnew is B-1,
    asserta(posisi(A,Bnew)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke utara.'),nl),
    !.

w :-
    running(_),
    \+round(_),
    posisi(A,B),
    cekArea(A,B),
    retract(posisi(A,B)),
    Bnew is B-1,
    asserta(posisi(A,Bnew)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke utara.'),nl),
    !.

/* Gerak ke Barat */
a :-
    running(_),
    \+round(_),
    posisi(A,B),
    isBorder(A-1,B),
    write('Nabrak'),
    !.

a :-
    running(_),
    \+round(_),
    posisi(A,B),
    isWall(A-1,B,A-1,B),
    write('Nabrak'),nl,
    !.

a :-
    running(_),
    \+round(_),
    posisi(A,B),
    isStore(A-1,B),
    retract(posisi(A,B)),
    Anew is A-1,
    asserta(posisi(Anew,B)),
    asserta(inStore(1)),
    write('Anda berada di Store'),nl,
    write('Masukkan \'store.\' untuk melihat menu dan melakukan pembelian.'),nl,
    !.

a :-
    running(_),
    \+round(_),
    posisi(A,B),
    isQuest(A-1,B),
    retract(posisi(A,B)),
    Anew is A-1,
    asserta(posisi(Anew,B)),
    write('Anda berada di Quest'),startQuest,
    !.

a :-
    running(_),
    \+round(_),
    posisi(A,B),
    isDungeon(A-1,B),
    retract(posisi(A,B)),
    Anew is A-1,
    asserta(posisi(Anew,B)),
    asserta(dungeon(1)),
    write('Anda berada di Dungeon'),nl,bossMode,
    !.

a :-
    running(_),
    \+round(_),
    posisi(A,B),
    isTeleport(A-1,B),
    retract(posisi(A,B)),
    Anew is A-1,
    asserta(posisi(Anew,B)),
    asserta(teleport(1)),
    write('Anda berada di Teleport'),nl,
    write('Masukkan \'teleport.\' untuk menggunakan teleport.'),nl,
    !.

a :-
    running(_),
    \+round(_),
    posisi(A,B),
    \+cekArea(A,B),
    retractall(inStore(_)),
    retractall(dungeon(_)),
    retractall(teleport(_)),
    retract(posisi(A,B)),
    Anew is A-1,
    asserta(posisi(Anew,B)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke barat.'),nl),
    !.

a :-
    running(_),
    \+round(_),
    posisi(A,B),
    cekArea(A,B),
    retract(posisi(A,B)),
    Anew is A-1,
    asserta(posisi(Anew,B)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke barat.'),nl),
    !.

/* Gerak ke Selatan */
s :-
    running(_),
    \+round(_),
    posisi(A,B),
    isBorder(A,B+1),
    write('Nabrak'),
    !.

s :-
    running(_),
    \+round(_),
    posisi(A,B),
    isWall(A,B+1,A,B+1),
    write('Nabrak'),nl,
    !.

s :-
    running(_),
    \+round(_),
    posisi(A,B),
    isStore(A,B+1),
    retract(posisi(A,B)),
    Bnew is B+1,
    asserta(posisi(A,Bnew)),
    asserta(inStore(1)),
    write('Anda berada di Store'),nl,
    write('Masukkan \'store.\' untuk melihat menu dan melakukan pembelian.'),nl,
    !.

s :-
    running(_),
    \+round(_),
    posisi(A,B),
    isQuest(A,B+1),
    retract(posisi(A,B)),
    Bnew is B+1,
    asserta(posisi(A,Bnew)),
    write('Anda berada di Quest'),startQuest,
    !.

s :-
    running(_),
    \+round(_),
    posisi(A,B),
    isDungeon(A,B+1),
    retract(posisi(A,B)),
    Bnew is B+1,
    asserta(posisi(A,Bnew)),
    asserta(dungeon(1)),
    write('Anda berada di Dungeon'),nl,bossMode,
    !.

s :-
    running(_),
    \+round(_),
    posisi(A,B),
    isTeleport(A,B+1),
    retract(posisi(A,B)),
    Bnew is B+1,
    asserta(posisi(A,Bnew)),
    asserta(teleport(1)),
    write('Anda berada di Teleport'),nl,
    write('Masukkan \'teleport.\' untuk menggunakan teleport.'),nl,
    !.

s :-
    running(_),
    \+round(_),
    posisi(A,B),
    \+cekArea(A,B),
    retractall(inStore(_)),
    retractall(dungeon(_)),
    retractall(teleport(_)),
    retract(posisi(A,B)),
    Bnew is B+1,
    asserta(posisi(A,Bnew)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke selatan.'),nl),
    !.

s :-
    running(_),
    \+round(_),
    posisi(A,B),
    cekArea(A,B),
    retract(posisi(A,B)),
    Bnew is B+1,
    asserta(posisi(A,Bnew)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke selatan.'),nl),
    !.

/* Gerak ke Timur */
d :-
    running(_),
    \+round(_),
    posisi(A,B),
    isBorder(A+1,B),
    write('Nabrak'),
    !.

d :-
    running(_),
    \+round(_),
    posisi(A,B),
    isWall(A+1,B,A+1,B),
    write('Nabrak'),nl,
    !.

d :-
    running(_),
    \+round(_),
    posisi(A,B),
    isStore(A+1,B),
    retract(posisi(A,B)),
    Anew is A+1,
    asserta(posisi(Anew,B)),
    asserta(inStore(1)),
    write('Anda berada di Store'),nl,
    write('Masukkan \'store.\' untuk melihat menu dan melakukan pembelian.'),nl,
    !.

d :-
    running(_),
    \+round(_),
    posisi(A,B),
    isQuest(A+1,B),
    retract(posisi(A,B)),
    Anew is A+1,
    asserta(posisi(Anew,B)),
    write('Anda berada di Quest'),startQuest,
    !.

d :-
    running(_),
    \+round(_),
    posisi(A,B),
    isDungeon(A+1,B),
    retract(posisi(A,B)),
    Anew is A+1,
    asserta(posisi(Anew,B)),
    asserta(inQuest(1)),
    write('Anda berada di Dungeon'),nl,bossMode,
    !.

d :-
    running(_),
    \+round(_),
    posisi(A,B),
    isTeleport(A+1,B),
    retract(posisi(A,B)),
    Anew is A+1,
    asserta(posisi(Anew,B)),
    asserta(teleport(1)),
    write('Anda berada di Teleport'),nl,
    write('Masukkan \'teleport.\' untuk menggunakan teleport.'),nl,
    !.

d :-
    running(_),
    \+round(_),
    posisi(A,B),
    \+cekArea(A,B),
    retractall(inStore(_)),
    retractall(dungeon(_)),
    retractall(teleport(_)),
    retract(posisi(A,B)),
    Anew is A+1,
    asserta(posisi(Anew,B)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke timur.'),nl),
    !.

d :-
    running(_),
    \+round(_),
    posisi(A,B),
    cekArea(A,B),
    retract(posisi(A,B)),
    Anew is A+1,
    asserta(posisi(Anew,B)),
    (randomEncounter -> write(''); write('Anda berpindah 1 kotak ke timur.'),nl),
    !.

/* Kemungkinan bertemu musuh */
randomEncounter :-
    running(_),
    \+round(_),
    random(1,100,Encounter),
    (
        Encounter < 15 ->
        posisi(_,B),
        randomEnemy(_,B)

    ).

/* Randomize musuh berdasarkan Area */
randomEnemy(_,X) :-
    /* Cek Koordinat Y Player */
    (
        X < 5 ->
        random(1,3,EnemyID) % Di 1 <= Y <=4 bisa lawan Slime / Goblin
    ;   X < 8 ->
        random(3,5,EnemyID) % Di 5 <= Y <=7 bisa lawan Wolf / Golem
    ;   EnemyID is 5 % Di Y > 7 bisa lawan Wizard
    ),
    quest(A,B,C,D,E),
    (
        EnemyID =:= 1 ->
        write('Anda menemukan Slime!'),nl,
        battle(slime),
        (victory -> Anew is A + 1 , retract(quest(A,B,C,D,E)),asserta(quest(Anew,B,C,D,E)), retractall(victory),cekQuest
        ;kabur -> retractall(kabur)
        ;gameOver -> write('Game Over'),nl, quit
        ;retract(running(1)),retractall(round(_)),start)
    ;   EnemyID =:= 2 ->
        write('Anda menemukan Goblin!'),nl,
        battle(goblin),
        (victory -> Bnew is B + 1 , retract(quest(A,B,C,D,E)), asserta(quest(A,Bnew,C,D,E)), retractall(victory),cekQuest
        ;kabur -> retractall(kabur)
        ;gameOver -> write('Game Over'),nl, quit
        ;retract(running(1)),retractall(round(_)),start)
    ;   EnemyID =:= 3 ->
        write('Anda menemukan Wolf!'),nl,
        battle(wolf),
        (victory -> Cnew is C + 1 , retract(quest(A,B,C,D,E)), asserta(quest(A,B,Cnew,D,E)), retractall(victory),cekQuest
        ;kabur -> retractall(kabur)
        ;gameOver -> write('Game Over'),nl, quit
        ;retract(running(1)),retractall(round(_)),start)
    ;   EnemyID =:= 4 ->
        write('Anda menemukan Golem!'),nl,
        battle(golem),
        (victory -> Dnew is D + 1 , retract(quest(A,B,C,D,E)), asserta(quest(A,B,C,Dnew,E)), retractall(victory),cekQuest
        ;kabur -> retractall(kabur)
        ;gameOver -> write('Game Over'),nl, quit
        ;retract(running(1)),retractall(round(_)),start)
    ;   EnemyID =:= 5 ->
        write('Anda menemukan Wizard!'),nl,
        battle(wizard),
        (victory -> Enew is E + 1 , retract(quest(A,B,C,D,E)), asserta(quest(A,B,C,D,Enew)), retractall(victory),cekQuest
        ;kabur -> retractall(kabur)
        ;gameOver -> write('Game Over'),nl, quit
        ;retract(running(1)),retractall(round(_)),start)
    ).

/* Teleport */
teleport :-
    running(_),
    \+teleport(_),
	write('Pemain tidak berada di tempat teleport.'),nl,
    !.

teleport :-
    running(_),
    teleport(_),
    panjang(P),
    lebar(L),
    write('Kemana kamu akan teleport? (Pemain hanya dapat Teleport ke area kosong)'),nl,
    write('Posisi X: '),
    read(TpX), TpX > -1, TpX < P,
    write('Posisi Y: '),
    read(TpY), TpY > -1, TpY < L,
    cekArea(TpX,TpY),
    retract(posisi(_,_)),
    asserta(posisi(TpX,TpY)),
    write('Anda telah diteleport ke koordinat ('), write(TpX), write(','), write(TpY), write(')'),
    retract(teleport(_)),
    !.

/* Mengecek posisi X,Y bukan area yang terisi dengan wall, dungeoon, store, quest, border, teleport */
cekArea(X,Y) :-
    \+isWall(X,Y,X,Y),
    \+isDungeon(X,Y),
    \+isTeleport(X,Y),
    \+isStore(X,Y),
    \+isQuest(X,Y),
    \+isBorder(X,Y).
