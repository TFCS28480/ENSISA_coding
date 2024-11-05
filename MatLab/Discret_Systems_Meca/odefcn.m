function dydt = odefcn(t,y,A,B)
  dydt = A\(B*y);
end