function f = nodalf(p,u)
% NODALf help function, which calculates the 'reaction' part of the ode
% (see output)
%
%   f = nodal(p,u)
%
% Input:
%   p : 'p' variable of pde2path (contains collection of current
%       continuation data
%   u : solution (entries 1:p.np) + parameters (entries (p.nu+1:end))
%
% Ouput:
%   f : evaluation of f = -g*v+M*(log((1+v)/(2+v)) + 1/(2+v)) + K - lambda
%
uSol = u(1:p.np); % extract solution and parameter data
par = u(p.nu+1:end); % par = [M,g,lambda]
g = par(2); % gravity
M = par(1); % Marangoni number
lambda = par(3); % mass constraint parameter

% calculate M*K(0)
K = -M*(log(1/2)+1/2)*ones(size(uSol));
% calculate vector field
f = -g*uSol+M*(log((1+uSol)./(2+uSol))+1./(2+uSol)) + K + lambda;
end