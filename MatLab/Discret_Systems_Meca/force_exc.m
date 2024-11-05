function force = force_exc(t)
Vamp = [1;0];
f_exc = [0.5;0.8];
w_exc = 2*pi.*f_exc;
force = Vamp*cos(w_exc.*t);
end