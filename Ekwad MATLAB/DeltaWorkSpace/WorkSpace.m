function [A, n] = WorkSpace()
n = 1; %êîëè÷åñòâî òî÷åê â ìàññèâå
% ïåðåáîð âñåõ âîçìîæíûõ ïîëîæåíèé îáúåêòà óïðàâëåíèÿ
h = 2;% øàã îáõîäà
A = zeros((140/h)^3, 3);
for th1 = -30 : h : 60
    for th2 = -30 : h : 60
        for th3 = -30 : h : 60
            [X, Y, Z, fl] = FKinem(th1, th2, th3);
            if fl == 0 
               A(n, 1) = X;
               A(n, 2) = Y;
               A(n, 3) = Z;
               n = n+1;
            end
         end
    end
end
end
