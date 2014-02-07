function cyclelines(h)
% CYCLELINES - Adjust the line properties of a plot
%   h is a figure handle
% FIXME: Construct all unique permutations of dashes and markers
% FIXME: Marker size changes thickness when changing line thickness
dash = {'--'};
lthick = 2; % FIXME: Get current default
colour = 'brcmk'; %rgbcmyk
marker = '+ox*sd^'; %{'+ox*sd^v><ph'}
msize = 6; % FIXME: Get current default

cprod = cartprod(1:length(dash),1:length(marker));

lns = findobj(h,'type','line');

for i=1:length(lns)
    %didx = rem(i,length(dash))+1;
    %midx = rem(i,length(marker))+1;
    cidx= rem(i,length(colour))+1;
    didx = cprod(i,1);
    midx = cprod(i,2);

    set(lns(i),'LineStyle',dash{didx},'marker',marker(midx), ...
               'color',colour(cidx),'markersize',msize,'linewidth',lthick);
end
