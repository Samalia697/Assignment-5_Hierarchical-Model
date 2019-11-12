function [ind4_mean,ind4_median,ind4_mode,ind4_ci] = TaskAQ1(smpl)
dudetheta = exp(smpl(7,:) + smpl(3,:).^2/2);%expected value in log normal distribution
ind4_mean=mean(dudetheta);
find_Ind4_median=sort(dudetheta);
ind4_median=find_Ind4_median(floor(end/2));
figure;
h_ind4 = histogram(dudetheta,'normalization','pdf');
h_ind4.BinWidth=10;
find_Ind4_mode=find(h_ind4.Values == max(h_ind4.Values));
ind4_mode=h_ind4.BinEdges(find_Ind4_mode)+h_ind4.BinWidth/2;
hold on
plot([ind4_mode,ind4_mode],[0,0.012],'r','LineWidth',1);
ed=[min(dudetheta):1:max(dudetheta)];
hdude1=histcounts(dudetheta,ed);
hdude1=hdude1/sum(hdude1);
hdude2=cumsum(hdude1);
[c1 index1] = min(abs(hdude2-0.025));
cll=ed(index1);
[c2 index2] = min(abs(hdude2-0.975));
clu=ed(index2);
ind4_ci=[cll clu];
hold on
plot([cll,cll],[0,0.012],'b','LineStyle','--','LineWidth',3);
hold on
plot([clu,clu],[0,0.012],'b','LineStyle','--','LineWidth',3);
end