function p = oosetfemops(p)
% OOSETFEMOPS set up function to save FEM mass and stiffness matrix in
% state variable p
%
%   p = oosetfemops(p)
%
% Input:
%   p : 'p' variable of pde2path (contains collection of current
%       continuation data)
%
% Ouput:
%   p : updated 'p' variable of pde2path
%

[K,M,~] = p.pdeo.fem.assema(p.pdeo.grid,1,1,1); % assemble matrices
p.mat.vM=sum(M,1); % such that vM*u=\int u dx
p.mat.M = M; % mass matrix
p.mat.K = K; % stiffness matrix
end