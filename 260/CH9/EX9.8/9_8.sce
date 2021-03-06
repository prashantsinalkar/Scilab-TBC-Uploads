//Eg-9.8
//pg-413

clc
clear

//After substituting alpha=lamda*R,z/L,r/R,L/R
//Treq=T-Ta/T0-Ta
//first three zeros are taken from appendix 9F


alpha=[2.4048;5.5201;8.6537];

a=[1;-2.2499997;1.2656208;-.3163866;.0444479;-.0039444;.00021];
b=[.5;-.56249985;.21093573;-.03954289;.00443319;-.00031761;.00001109];
c=[.36746691;.60559366;-.74350384;.25300117;-.04261214;.00427916;-.00024846];
d=[-.6366198;.2212091;2.1682709;-1.31164827;.3123951;-.0400976;.0027873];
e=[0.79788456;-.00000077;-.0055274;-.00009512;.00137237;-.00072805;.000014476];
f=[.79788456;.00000156;.01659667;.00017105;-.00249511;.00113653;-.00020033];
g=[-.78539816;-.04166397;-.00003954;.00262573;.00054125;-.00029333;.00013558];
h=[-2.35619449;.12499612;.0000565;-.00637879;.00074348;.00079824;-.00029166];


for i=1:3
   
x=alpha(i);

p=x/3*x/3;
q=3/x;

if x<3 then
 J0(i)=a(1)+p*(a(2)+p*(a(3)+p*(a(4)+p*(a(5)+p*(a(6)+p*(a(7)))))))  ;
  J1(i)=x*(b(1)+p*(b(2)+p*(b(3)+p*(b(4)+p*(b(5)+p*(b(6)+p*(b(7))))))))  ;
else
    f0=e(1)+q*(e(2)+q*(e(3)+q*(e(4)+q*(e(5)+q*(e(6)+q*(e(7)))))));
    f1=f(1)+q*(f(2)+q*(f(3)+q*(f(4)+q*(f(5)+q*(f(6)+q*(f(7))))))) ;
    theta0=x+g(1)+q*(g(2)+q*(g(3)+q*(g(4)+q*(g(5)+q*(g(6)+q*(g(7))))))) ; 
    theta1=x+h(1)+q*(h(2)+q*(h(3)+q*(h(4)+q*(h(5)+q*(h(6)+q*(h(7))))))) ; 
    J0(i)=(1/x)^.5*f0*cos(theta0);
    J1(i)=(1/x)^.5*f1*cos(theta1);
end

end
for i=1:3
   
x=alpha(i)/2;

p=x/3*x/3;
q=3/x;

if x<3 then
 JJ0(i)=a(1)+p*(a(2)+p*(a(3)+p*(a(4)+p*(a(5)+p*(a(6)+p*(a(7)))))))  ;
  JJ1(i)=x*(b(1)+p*(b(2)+p*(b(3)+p*(b(4)+p*(b(5)+p*(b(6)+p*(b(7))))))))  ;
else
    f0=e(1)+q*(e(2)+q*(e(3)+q*(e(4)+q*(e(5)+q*(e(6)+q*(e(7)))))));
    f1=f(1)+q*(f(2)+q*(f(3)+q*(f(4)+q*(f(5)+q*(f(6)+q*(f(7))))))) ;
    theta0=x+g(1)+q*(g(2)+q*(g(3)+q*(g(4)+q*(g(5)+q*(g(6)+q*(g(7))))))) ; 
    theta1=x+h(1)+q*(h(2)+q*(h(3)+q*(h(4)+q*(h(5)+q*(h(6)+q*(h(7))))))) ; 
    JJ0(i)=(1/x)^.5*f0*cos(theta0);
    JJ1(i)=(1/x)^.5*f1*cos(theta1);
end

end

Treq=0;

for i=1:3
Treq=(1/alpha(i)*JJ0(i)*sinh(.5*alpha(i))/J1(i)/sinh(2*alpha(i)))+Treq;
end
Tfinal=2*Treq;
disp("values of alpha ,required bessel functions and final required value are respectively")
disp(alpha)
disp(JJ0)
disp(J1)
disp(Tfinal)

