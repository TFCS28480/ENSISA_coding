function dydt = odefcn2(t,y,M,C,K)
  % dydt = A\(B*y+[force_exc(t);0])
  ndd1 = size(M,1);
  dydt=[C M;M zeros(ndd1)]\([-K zeros(ndd1);zeros(ndd1) M]*y+[force_exc(t);zeros(ndd1,1)];
end