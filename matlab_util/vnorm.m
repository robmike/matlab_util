function y = vnorm(A,varargin)
% VNORM - Return the vector norm along specified dimension of A
% VNORM(A) returns the 2-norm along the first non-singleton
% dimension of A
% VNORM(A,dim) return the 2-norm along the dimension 'dim'
% VNORM(A,dim,normtype) returns the norm specified by normtype
% along the dimension 'dim'
% VNORM(A,[],normtype) returns the norm specified by normtype along
% the first non-singleton dimension of A
% 
% norm type may be one of {inf,-inf,positive integer}

dim = [];
ntype = [];

if nargin>1
    dim = varargin{1};
    if dim~=floor(dim) || dim<1
        error('Dimension must be positive integer');
    end
    if nargin>2
        ntype = varargin{2};
    end
end


if isempty(ntype)
    y = sqrt(sum( abs(A).^2 , dim) );
elseif isinf(ntype)
    if ntype > 0
        y=max(abs(A), [], dim);
    else
        y=min(abs(A), [], dim);
    end
elseif ntype~=floor(ntype) || ntype<1
    error(['Norm type must be one of inf,-inf or a positive ' ...
           'integer']);
else 
    y = (sum( abs(A).^ntype , dim) )^(1/ntype);
end 
