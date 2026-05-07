real((Real,_), R):- R is Real.
imaginary((_,Imag), I):- I is Imag.

conjugate((Real, Imag), (Real, Imag2)):- Imag2 is Imag * -1. 

abs((Real, Imag), R):- R1 is Real^2 + Imag ^2, 
 R is sqrt(R1).

add((Real1, Imag1), (Real2, Imag2), (RealR, ImagR)):- RealR is Real1 + Real2, ImagR is Imag1 + Imag2.

sub((Real1, Imag1), (Real2, Imag2), (RealR, ImagR)):- RealR is Real1 - Real2, ImagR is Imag1 - Imag2.


mul((A, B), (C, D), (RealR, ImagR)):- RealR is (A * C - B * D), ImagR is (B * C + A * D) .


div((A, B), (C, D), (RealR, ImagR)):- RealR is (A * C + B * D)/(C^2 + D^2), ImagR is (B * C - A * D)/(C^2 + D^2).
