inter(line(M1, C1), line(M2, C2), X, Y) :-
  MX1 is M1 * X,
  MX2 is M2 * X,
  Y is (MX1 + C1),
  Y is (MX2 + C2).
