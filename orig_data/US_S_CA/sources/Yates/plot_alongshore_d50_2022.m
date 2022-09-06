%% plot_alongshore_d50.m
%% script makes a plot of averge grain size along sampled section of coast
%% February 9, 2005

function plot_alongshore_d50
close all
clear

data=load('~/Data/GRAIN/haas_data/haas_grain_size.dat');

inan=find(isnan(data(:,3))==1);
data(inan,:)=[];

% load ~/Projects/UTLIDAR/focus_site_boundaries.mat

figure
hold on
xbox=[-60 60 60 -60 -60];
txtx = 0.005;

% %% onofre
% ybox=[onofre_range(1)*ones(1,2) onofre_range(2)*ones(1,2) onofre_range(1)];
% honofre=fill(xbox,ybox,[0.83 0.89 0.99]);
% set(honofre,'Linestyle','none')
% hold on
% text(txtx,mean(onofre_range),'Onofre')
% 
% %% torrey
% ybox=[torrey_range(1)*ones(1,2) torrey_range(2)*ones(1,2) torrey_range(1)];
% htorrey=fill(xbox,ybox,[0.83 0.89 0.99]);
% set(htorrey,'Linestyle','none')
% hold on
% text(txtx,mean(torrey_range),'Torrey')
% 
% %% pendleton 
% ybox=[pendleton_range(1)*ones(1,2) pendleton_range(2)*ones(1,2) pendleton_range(1)];
% hpend=fill(xbox,ybox,[0.83 0.89 0.99]);
% set(hpend,'Linestyle','none')
% hold on
% text(txtx,mean(pendleton_range),'Pendleton')

%%%% plot jen haas sand data
plot(data(:,1),data(:,3),'.','markersize',15)
title('Alongshore Sand Grain Size')
xlabel('Median Grain Size [mm]')
ylabel('Latitude [^oN]')
axis([0 0.7 min(data(:,3)) max(data(:,3))])

%% load and plot spring 2007 sand sampling
load torrey_d50
%[ind] = find(elev==0.11);
%d50 = d50(ind); lat = lat(ind);
plot(d50(ibb),lat(ibb),'.g','markersize',15)

load onofre_d50
%[ind] = find(elev==0.11);
%d50 = d50(ind); lat = lat(ind)
plot(d50(ibb),lat(ibb),'.g','markersize',15)

load pendleton_d50
%[ind] = find(elev==0.11);
%d50 = d50(ind); lat = lat(ind);
plot(d50(ibb),lat(ibb),'.g','markersize',15)

%% load and plot fall 07 sampling
load fall07_o_d50
d50 = d50(ibb); lat = lat(ibb);
plot(d50,lat,'.r','markersize',15)

load fall07_p_d50
d50 = d50(ibb); lat = lat(ibb);
plot(d50,lat,'.r','markersize',15)

load fall07_cp_d50
d50 = d50(ibb); lat = lat(ibb);
plot(d50,lat,'.r','markersize',15)
axis([0 0.8 min(data(:,3)) max(data(:,3))])

set(gcf,'paperposition',[0.1 0.25 8 8])
print(gcf,'-dpsc2','~/Projects/sand_grain_sampling/figures/alongshore_d50.ps')

addinsert = 1;
if addinsert==1
 axis([0 0.8 min(data(:,3)) max(data(:,3))])
 %% load the data from the focus sites
 load ~/Projects/sand_grain_sampling/plot_d50_tp_so_cp
 
 axes('position',[0.56 0.17 0.42 0.52])
 barweb(alldata,errdata)
 hold on

 axis([0.5 3.5 0.1 0.45])
 set(gca,'xtick',[1:3])
 set(gca,'xticklabel',{'Torrey','Pendleton','Onofre'})
 legend('Mean Underwater D50','Mean MSL D50','Mean Backbeach D50',2)
 title('Grain Size')
 ylabel('Grain Size [mm]')
 
 %set(gcf,'paperposition',[0.1 0.25 8 8])
 %print(gcf,'-dpsc2','~/Projects/sand_grain_sampling/figures/alongshore_d50_inset.ps')
end
