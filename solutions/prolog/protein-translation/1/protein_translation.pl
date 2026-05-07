
translate("AUG", ["Methionine"]).
translate("UUU", ["Phenylalanine"]).
translate("UUC", ["Phenylalanine"]).
translate("UUA", ["Leucine"]).
translate("UUG", ["Leucine"]).
translate("UCU", ["Serine"]).
translate("UCC", ["Serine"]).
translate("UCA", ["Serine"]).
translate("UCG", ["Serine"]).
translate("UAU", ["Tyrosine"]).
translate("UAC", ["Tyrosine"]).
translate("UGU", ["Cysteine"]).
translate("UGC", ["Cysteine"]).
translate("UGG", ["Tryptophan"]).
translate("UAA", []).
translate("UAG", []).
translate("UGA", []).

translate(String, R):- string_codes(String, Codes), append(L1, [85, 65, 65|_], Codes), translate_list(L1, R). % "UAA"
translate(String, R):- string_codes(String, Codes), append(L1, [85, 65, 71|_], Codes), translate_list(L1, R). % "UAG"
translate(String, R):- string_codes(String, Codes), append(L1, [85, 71, 65|_], Codes), translate_list(L1, R). % "UGA"

translate(String, R):- string_length(String, L), L> 3, string_codes(String, Codes), \+ append(_, [85, 65, 65|_], Codes), \+ append(_, [85, 65, 71|_], Codes), \+ append(_, [85, 71, 65|_], Codes), translate_list(Codes, R).

translate_list(List, []):- length(List, L), L < 3.
translate_list(List, R3):- length(L1, 3), append(L1, Tail, List), translate_list(Tail, R), string_codes(S1, L1), translate(S1, R2), append(R2, R, R3).

