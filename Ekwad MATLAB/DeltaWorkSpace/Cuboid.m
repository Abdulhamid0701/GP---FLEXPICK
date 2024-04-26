function [sum, middleZ] = Cuboid()

s = 200*8; % êîëè÷åñòâî øàãîâ íà 1 îáîðîò øàãîâîãî äâèãàòåëÿ
sd = 360/s; % óãîë îäíîãî øàãà

%Îïðåäåëåíèå ìàêñèìàëüíî è ìèíèìàëüíî äîñòèæèìîãî Z
minZ = 0;
maxZ = -500;
for th = -35 : sd : 105
    [~,~, Z, fl] = FKinem(th, th, th);
    if (fl == 0)
        if(minZ > Z)
            minZ = Z;
        end
        if(maxZ < Z)
            maxZ = Z;
        end
    end
end

middleZ = (maxZ+minZ)/2 % ñðåäíÿÿ âûñîòà
orig_dist = (maxZ-middleZ); % ðàññòîÿíèå îò öåíòðà
dist = orig_dist; % ïðåäïîëîæèòåëüíûé ðàçìåð ñòîðîíû êóáà
sum = 0;
%Íàõîæäåíèå ñòîðîíû êóáà = 2*sum
Flag = zeros(8,1);
while(orig_dist > sum && dist > 0.1)
    sum = sum + dist;
    [~,~,~,Flag(1)] = IKinem(+sum, +sum, middleZ+sum);
    [~,~,~,Flag(2)] = IKinem(+sum, -sum, middleZ+sum);
    [~,~,~,Flag(3)] = IKinem(-sum, -sum, middleZ+sum);
    [~,~,~,Flag(4)] = IKinem(-sum, +sum, middleZ+sum);
    [~,~,~,Flag(5)] = IKinem(+sum, +sum, middleZ-sum);
    [~,~,~,Flag(6)] = IKinem(+sum, -sum, middleZ-sum);
    [~,~,~,Flag(7)] = IKinem(-sum, -sum, middleZ-sum);
    [~,~,~,Flag(8)] = IKinem(-sum, +sum, middleZ-sum);
    if (min(Flag) < 0)
        sum = sum - dist;
        dist = dist/2;
    end
end
%Îòðèñîâêà êóáà â 3D
hold on
plotcube([2*sum 2*sum 2*sum],[-sum  -sum  middleZ-sum],.3,[0 1 0]);
hold off
sum
end