 function fields2vars(s)
%fields2vars: Make variables out of structure fields
%  s.a = 1; s.b = 2; fields2vars(s)
%  will create variables 'a' and 'b' in the current workspace containing
%  the contents of s.a and s.b, respectively.

% written by Douglas M. Schwarz
% dmschwarz&urgrad,rochester,edu
% Make obvious changes to get real email address. 

fields = fieldnames(s);
for i = 1:length(fields)
     assignin('caller', fields{i}, s.(fields{i}))
end 