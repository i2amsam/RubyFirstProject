%% Seven Languages in Seven Weeks Week 3 -Prolog
%% Day one chaper end challenge
%% Make a data set in prolog and ask some interesting question

%Movies in the form of acted(who, what).
acted(kevin_bacon, starting_over).
acted(burt_reynolds, starting_over).
acted(austin_pendleton, starting_over).

acted(kevin_bacon, the_gift).
acted(kevin_bacon, foot_loose).
acted(kevin_bacon, quicksilver).

acted(kevin_bacon, white_water_summer).
acted(sean_astin, white_water_summer).
acted(jonathan_ward, white_water_summer).

acted(kevin_bacon, tremors).
acted(reba_mcentire, tremors).
acted(michael_gross, tremors).

acted(elijah_wood, lotr).
acted(ian_mckellen, lotr).
acted(liv_tyler, lotr).
acted(viggo_mortensen, lotr).
acted(sean_astin, lotr).
acted(orlando_bloom, lotr).
acted(hugo_weaving, lotr).
acted(andy_serkis, lotr).

acted(sam_phillips, gladiator).

% Acted with if they were both in the same film 
one_degree(X, Y) :- \+(X = Y), acted(X, Z), acted(Y, Z).

% Two degrees if they both acted with the same person
two_degrees(X,Y) :- \+(X = Y), one_degree(X, Z), one_degree(Y, Z).
