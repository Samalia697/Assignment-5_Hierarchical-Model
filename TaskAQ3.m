function [] = TaskAQ3(smpl,y,ind)
for kk = 1:26
    thetamean(kk) = mean(y(ind==kk));
end

[m5,n5]=size(thetamean);
for i = 1:n5
thetameanforh(i) = mean(smpl(3+i,:)); 
end

figure;
scatter((1:1:26),thetamean,200,'.','b');
hold on;
scatter((1:1:26),thetameanforh,200,'.','r');
legend('Without Hierarchical','With Hierarchical');
end