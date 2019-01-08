strage = struct('avrdelta',[],'mindelta',[],'minmatrix',[]);

Marray = [9 12 15]
Narray = [12 16 20]

for i = 1:3
    strage(i) = randammatrix(Narray(i),Marray(i))
end