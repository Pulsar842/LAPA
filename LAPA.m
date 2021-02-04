close all
clc

set(0,'Defaultfigurewindowstyle','docked')

X = 100;
Y = 100;

loops = 500;

V = zeros(X,Y);
bcOnes=ones(Y,1);
bcZeros=zeros(Y,1);
V(:,1)=bcOnes;
V(:,Y)=bcZeros;

for i = 1:loops
   
    for j = 2:(X-1) 
        for a = 2:(Y-1)
           if a == 1
               V(a,j) = V(a+1,j);
           elseif a == Y
               V(a,j) = V(a+1,j); 
           else
               V(a,j) = (V(a,j)+V(a-1,j)+V(a,j+1)+V(a,j-1))/4;
           end
        end    
    end
   
   V(:,1)=bcOnes;
   V(:,Y)=bcOnes;
   V(1,:) = bcZeros;
   V(X,:) = bcZeros;
   
   if mod(i,20) ==0
      figure(1)
      fprintf(num2str(i) + "\n");
      h = surf(V');
      pause(0.05)
   end

end
  

[Ex,Ey] = gradient(V);

figure(2) 
Esurfplot = subplot(2,1,1);
Esurf = surf(Ex,Ey);
Equivplot = subplot(2,1,2);
Equiv = quiver(Ex,Ey);