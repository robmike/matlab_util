% Returns the Cartesian product of two sets specified by vectors x,y
function b=cartprod(x,y)

[X,Y]=meshgrid(x,y);
b=[reshape(X,length(X(:)),1) reshape(Y,length(Y(:)),1)];