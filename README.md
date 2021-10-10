# Strings-in-assembly
Implementarea unor functii de criptare in assembly x86.

-CODERIE ANDREI-LUCIAN 322CD-

1. Se pune in bl character din key, dupa care acest caracter
se xoreaza cu character din plain text, rezultatul se pune
astfel in edx. Se incrementeaza cele 3 valori pentru ca 
a se trece la urmatoarele charactere. Se face un loop peste
acest label, in ecx fiind lengthul lui plaintext, astfel
loopul se termina cand ecx devine 0, adica dupa ce a fost 
parcurs tot plain_text. Astfel dupa terminarea loopului, in
edx va fi rezultatul final.


2. Fac un for mare pana cand lungeamea lui plain text va fi 0.
Pun characterul din plain text in al, verific daca este litera
sau nu, daca nu este litera in ciphertext pun acel elemnt, iar
daca este litera, verific intai daca numarul din key depaseste
lungimea alfabetului, daca da il scad cate 26 din el pana va ramane
mai mic sau egal cu 27, dupa care verific daca este litera 
mare sau mica si aplic algoritmul de verificare daca trece de z in ascii
si resetare la a-z, la fel si pentru litera mare. Rezultatul final il pun
in edx. Daca toate comparatiile au ajuns sa nu mai foloseasca jumpurile
se sare la stop, insemnand ca programul s-a terminat, trecand prin
toate verificarile, in edx ramanand valoarea finala.



3. Golesc ecx si ebx pentru a ma folosi de aceste registre, daca am nevoie
pe parcurs de valoarea lor actuala ma folosesc de valoarea din [ebp + x].
Fac un for pana cand ecx va avea valoarea lui lui plain_textlen
Pun in al si ah charactere din key si plaintext, daca un char din
plaintext este nonLitera, in noua cheie care se va forma pun spatiu,
iar daca este litera, in edx pun caracterul din key. In cazul in care ebx
ajunge la valorea lui key_len * contorul pentru key * acesta se reseteaza la 0.
Dupa ce cheia s-a format in edx aceasta se pastreaza in ebx si se reseteaza
toata valoarile ba la 0, ba la cele date initial in schelet. 
Dupa ce am facut cheia extinsa, fac un al 2 lea for, tot pana la lungimea lui plaintext.
In care adun characterle, verific daca depasesc litere in ASCII, acest algoritm este
foarte asemanator cu partea de la caesar, doar ca nu se mai aduga un numar, cise 
adauga un character care are si el un cod ASCII.



4. Golesc edx-ul si ecx-ul pentru a le putea folosi pe post de iteratori
pentru haystack respectiv needle.In al si ah se vor pune pe rand chars
din haystack respectiv needle. Daca acestea sunt egale se maresc si ecx
si edx cu 1, iar daca ecx este egal cu needle_len atunci inseamna
ca am gasit in haystack pe needle si se sare la good, unde din edx se scade ecx-ul
actual, ramanand in edx valoarea care trebuie printata, daca nu sunt egale, algoritmul
se ia de la cap pana cand edx va ajungea la lungimea lui haystack. Daca al si ah nu sunt egale se
incrementeaza iteratorul pentru haystack, iteratorul pentru needle devine  iar 0 si
se reia algoritmul. Daca edx ajungle la lungimea lui haystack inseamna
ca needle nu a fost gasit in haystack si se sare la wrong unde se pune in edx
lungimea lui haystack + 1.


5. Am incercat mai multe variante, dar ma impiedicam mereu cand aveam nevoie
de functia mul sau div. Mereu imi dadea seg fault.. Si n-am avut timp
sa o mai fac in perioada asta cu 4 teme. *sadface*
