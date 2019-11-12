function [indRand_mean,indRand_median,indRand_mode,indRand_ci] = TaskAQ2(smpl,N)
indRand=zeros(1,N);
for i = 1:N
mu=smpl(1,i);
tau= smpl(2,i);
sigma= smpl(3,i);
theta= mu+(tau*randn(1));
ransam= theta+(sigma*randn(1));
indRand(i) = exp(ransam);
end
indRand_mean=mean(indRand);
findmedianranguy=sort(indRand);
indRand_median=findmedianranguy(end/2);
figure;
hranguy = histogram(indRand,'normalization','pdf');
hranguy.BinWidth=10;
findmoderanguy=find(hranguy.Values == max(hranguy.Values));
indRand_mode=hranguy.BinEdges(findmoderanguy(1,1))+hranguy.BinWidth/2;
hold on
plot([indRand_mode,indRand_mode],[0,0.006],'r','LineWidth',1);
ed=[min(indRand):1:max(indRand)];
hrg1=histcounts(indRand,ed);
hrg1=hrg1/sum(hrg1);
hrg2=cumsum(hrg1);
[c1 index1] = min(abs(hrg2-0.025));
cll=ed(index1);
[c2 index2] = min(abs(hrg2-0.975));
clu=ed(index2);
indRand_ci=[cll clu];
hold on
plot([cll,cll],[0,0.006],'b','LineStyle','--','LineWidth',3);
hold on
plot([clu,clu],[0,0.006],'b','LineStyle','--','LineWidth',3);
end