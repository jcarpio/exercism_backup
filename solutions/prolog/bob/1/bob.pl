white(' ').
white('\n').
white('\t').
white('\r').

is_not_alpha(X):- \+ is_alpha(X).
upper_case_phrase(Phrase):- string_upper(Phrase, Phrase).
is_question(Phrase):- string_chars(Phrase, List), length(List, L), nth1(L, List, '?').
no_alpha(Phrase):- string_chars(Phrase, List), maplist(is_not_alpha, List).
all_white_phrase(Phrase):- string_chars(Phrase, List), maplist(white, List).
empty_phrase(Phrase):- string_chars(Phrase, []).
remove_whites([], []).
remove_whites([H|T], R):- white(H), remove_whites(T, R).
remove_whites([H|T], [H|R]):- \+ white(H), remove_whites(T, R).
remove_whites_phrase(Phrase, PhraseR):- string_chars(Phrase, List), remove_whites(List, R), string_chars(PhraseR, R).

hey(Phrase, "Fine. Be that way!"):- empty_phrase(Phrase), !.
hey(Phrase, "Fine. Be that way!"):- all_white_phrase(Phrase), !.
hey(Phrase, "Whatever."):- \+ empty_phrase(Phrase), no_alpha(Phrase), \+ is_question(Phrase), !.
hey(Phrase, "Sure."):- remove_whites_phrase(Phrase, Phrase2), is_question(Phrase2), \+ upper_case_phrase(Phrase2), !.
hey(Phrase, "Sure."):- is_question(Phrase), no_alpha(Phrase), !.
hey(Phrase, "Whoa, chill out!"):- \+ is_question(Phrase), upper_case_phrase(Phrase), !.
hey(Phrase, "Calm down, I know what I'm doing!"):- is_question(Phrase), upper_case_phrase(Phrase), !.
hey(_, "Whatever."). 

