function[d] = dist(vo, a, t)
mi2km = 1/0.621;
hr2s = 3600;
km2m = 1000;
vo = vo * mi2km *km2m / hr2s;
t = t * hr2s;
d = vo * t + 0.5 * a * t^2;
d = d / km2m;
end