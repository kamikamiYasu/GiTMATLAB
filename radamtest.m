strage = struct('avrdelta',[],'mindelta',[],'minmatrix',[]);

Marray = [6 7 8 9 10]
Narray = [12 14 16 18 20]

for i = 1:5
    strage(i) = randammatrix(Narray(i),Marray(i))
end