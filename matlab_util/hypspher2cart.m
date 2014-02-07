function x= hypspher2cart(r,t)
% Convert from hyperspherical to cartesian coordinates

% if nargin<2 || isempty(dim)
%     idx = find(size(r)~=1);
%     if ~isempty(idx)
%         dim = idx(1);
%     else
%         dim = 1;
%     end
% elseif fix(dim)~=dim || dim<1
%     error('Dimension must be positive integer');
% end

n=size(t,1) + 1; % Dimension R^n
if ~isvector(r)
   error 'r must be a vector'
end
m=size(t,2);
if size(r,1)<size(r,2)
   r=r'; % To column vector; 
end
lenr = length(r);

if ~isscalar(r) && lenr~=m
    error 'Dimension mismatch'
end
% 
% if any(any(t(1:end-1,:)<0)) || any(any(t(1:end-1,:)>pi))
%    error('All angle entries except last must be in [0,pi]') 
% end

x = zeros(n,m);
x(1,:) = cos(t(1,:));
if n-1>=2 % Matlab should implicitly take care of this but just in case
x(2:end-1,:) = cumprod( sin(t(1:end-1,:)),1 ).*cos( t(2:end,:) );
end
x(end,:) = prod( sin(t), 1 );

if ~isscalar(r)
    x = repmat(r',n,1).*x;
else
    x=r'.*x;
end



end