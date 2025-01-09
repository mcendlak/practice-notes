> :white_check_mark: *Jeśli będziesz mieć problem z rozwiązaniem tego zadania, poproś o pomoc na odpowiednim kanale na Slacku, tj. `s5e03-php-notes-mini-project` (dotyczy [mentee](https://devmentor.pl/mentoring-javascript/)) lub na ogólnodostępnej i bezpłatnej [społeczności na Discordzie](https://devmentor.pl/discord). Pamiętaj, aby treść Twojego wpisu spełniała [odpowiednie kryteria](https://devmentor.pl/jak-prosic-o-pomoc/).*

&nbsp;

# `#03` PHP: Notes Mini-Project

Napisz klasę `Pagination`, która będzie przyjmować w konstruktorze 2 parametry tj.
- ilość wszystkich elementów
- ilość elementów wyświetlanych na jednej stronie

Klasa `Pagination` ma posiadać również metodę `prepare()`, która zwróci tablicę zgodną z tym szablonem:
- `new Pagination(9, 8)->prepare()` => [0, 8]
- `new Pagination(40, 10)->prepare()` => [0, 10, 20, 30]
- `new Pagination(10, 3)->prepare()` => [0, 3, 6, 9]

*PS. Zwróć uwagę jak działa [LIMIT](https://www.w3schools.com/sql/sql_top.asp) oraz [OFFSET](https://www.w3schools.com/php/php_mysql_select_limit.asp) w SQL - może będziesz chciał zaproponować usprawienie do działania tej klasy/metody.*

&nbsp;
> :no_entry: *Jeśli nie posiadasz materiałów do tego zadania tj. **Wideo**, znajdziesz je na stronie [laracasts.com](https://laracasts.com/referral/bogolubow)*

> :arrow_left: [*poprzednie zadanie*](./../02) | [*następne zadanie*](./../04) :arrow_right:
