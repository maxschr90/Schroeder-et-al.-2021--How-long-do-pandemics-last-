syms alpha L H x

p =(alpha*L^alpha*x^(-alpha - 1))/(1 - (L/H)^alpha)

dpda = diff(p,alpha)

subs(dpda,[L,H,x],[15,3300,500])

ezsurf(subs(dpda,[L,H,x],[15,3300,500]),[0,3])