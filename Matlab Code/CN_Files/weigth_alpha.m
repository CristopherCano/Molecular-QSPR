function[alpha_data] = weigth_alpha(net,selected_input)

%Weights matrix data output, and relative relevance of FG
%weights = getwb(net);
wb = formwb(net,net.b,net.iw,net.lw);
[b,iw,lw] = separatewb(net,wb);
IW_1 = iw{:,:};
[rown, coln] = size(IW_1);
suma_Wij2 = 1./sum(IW_1.^2);
alpha = log10(suma_Wij2);

%min_alpha = min(alpha);
alpha_plus = normalize(alpha'); %alpha-min_alpha; 

%Labels data 
char = cellstr(selected_input(:));
[sorted_data, new_indices] = sort(alpha_plus,'descend'); %sort in des order
sorted_labels = char(new_indices);

%Sort the data & Rearrenge Labels
sorted_labels=categorical(sorted_labels);
alpha_data=table(sorted_data,sorted_labels);

end