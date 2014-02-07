% ============================================
function af=all_div(num)
% find all divisors of a positive integer

% get prime factors, assume sorted
p=factor(num);

% count the primes, (not histc because matlab 5.2)
d=diff(p);
k=[1,1+find(d~=0)];
reps=diff([k,length(p)+1]);
p=p(k);

af=1;
for i=1:length(p)
  af=af*(p(i).^(0:reps(i)));
  af=af(:);
end

% the factors should come out sorted
af=sort(af');
% ============================================ 
