%% plot_haas_sand_data.m
%% script makes a plot of averge grain size along sampled section of coast
%% February 9, 2005

function plot_haas_sand_data
close all
clear

data=load('haas_data/haas_grain_size.dat');

inan=find(isnan(data(:,3))==1);
data(inan,:)=[];

figure
plot(data(:,1),data(:,3),'.','MarkerSize',20)
title('Sand Grain Size')
xlabel('Sand Grain Diameter [mm]')
ylabel('Latitude')

%% mark on here the san onofre and torrey pines regions
load /Volumes/data07/myates/scripts/matlab/focus_site_boundaries
minx = min(data(:,1));
maxx = max(data(:,1));
hold on
plot([minx maxx],[onofre_range(1)*ones(1,2)],'r-','LineWidth',2)
plot([minx maxx],[onofre_range(2)*ones(1,2)],'r-','LineWidth',2)
plot([minx maxx],[torrey_range(1)*ones(1,2)],'r-','LineWidth',2)
plot([minx maxx],[torrey_range(2)*ones(1,2)],'r-','LineWidth',2)
axis([minx maxx 32.82 33.5])

text(0.16,32.892,'Torrey Pines')
text(0.16,33.341,'San Onofre')
