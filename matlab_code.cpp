//
//  matlab_code.cpp
//  
//
//  Created by Mengqi Liu on 1/28/2014.
//
//

#include "matlab_code.h"



//A1Q5(b), Newton's Method

x = 3;
Flag = true;
while (Flag)
y = x;
x = y-((x+sqrt(x)) * (20-x + sqrt(20-x))-155.55)/ ((1+(1/(2*sqrt(x))))*(20-x+sqrt(20-x))-((x+sqrt(x))*(1+(1/(2*sqrt(20-x))))))
disp(x);
if abs(y-x) < power(10,-6)
Flag = false;
end
end


//A1Q6(b), Fix-point Iteration

x = 1;
z = 0;
Flag = true;
while (Flag)
y = x;
z = z + 1;
x = sqrt((y+3-power(y,4))/2);
disp(x);
if z == 20
Flag = false;
end
end


x = 1;
z = 0;
Flag = true;
while (Flag)
y = x;
z = z + 1;
x = (3*power(y,4)+2*power(y,2)+3)/(4*power(x,3)+4*x-1);
disp(x);
if z == 20
Flag = false;
end
end


y = 3
x = 0.5* y + 1/y;
disp(x);

