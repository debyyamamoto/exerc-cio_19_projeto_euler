normal_years([31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]).
leap_years([31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]).

is_leap_year(Year) :-
    (Year mod 4 =:= 0, Year mod 100 =\= 0) ; (Year mod 400 =:= 0).

count_sundays(StartYear, EndYear, Domingos) :-
    normal_years(NormalMonths),
    leap_years(LeapMonths),
    EndYear_2 is EndYear + 1,
    count_sundays_helper(StartYear, EndYear_2, 2, NormalMonths, LeapMonths, 0, Domingos).

count_sundays_helper(EndYear, EndYear, _, _, _, Domingos, Domingos). 
count_sundays_helper(Year, EndYear, D_S, NormalMonths, LeapMonths, Acc, Domingos) :-
    (is_leap_year(Year) -> Months = LeapMonths ; Months = NormalMonths),
    count_sundays_in_year(Months, D_S, 0, SundaysInYear, NewD_S),
    NextYear is Year + 1,
    NewAcc is Acc + SundaysInYear,
    count_sundays_helper(NextYear, EndYear, NewD_S, NormalMonths, LeapMonths, NewAcc, Domingos).

count_sundays_in_year([], D_S, Sundays, Sundays, D_S). 

count_sundays_in_year([DaysInMonth|RestOfMonths], D_S, Acc, Sundays, NewD_S) :-
    (D_S =:= 0 -> NewAcc is Acc + 1 ; NewAcc is Acc),
    NewD_S_Temp is (D_S + DaysInMonth) mod 7,
    count_sundays_in_year(RestOfMonths, NewD_S_Temp, NewAcc, Sundays, NewD_S).
