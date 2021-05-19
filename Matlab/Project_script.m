%% Final project sensor fusion
% Task 2
clc, close all, clear all
[xhat, meas] = phone_filter();
% [xhat, meas] = filterTemplate();
% 
%%
clc
acc_data = meas.acc(:, ~any(isnan(meas.acc), 1));
gyr_data = meas.gyr(:, ~any(isnan(meas.gyr), 1));
mag_data = meas.mag(:, ~any(isnan(meas.mag), 1));
acc_mean = mean(acc_data, 2);
gyr_mean = mean(gyr_data, 2);
mag_mean = mean(mag_data, 2);

acc_cov = cov(acc_data');
gyr_cov = cov(gyr_data');
mag_cov = cov(mag_data');

k = linspace(acc_mean(1,:)-3*sqrt(acc_cov(1,1)),acc_mean(1,:)+3*sqrt(acc_cov(1,1)));
acc_pdf_x = normpdf(k,acc_mean(1,:), sqrt(acc_cov(1,1)))

figure(2)
subplot(3,3,1)
hold on
hist_acc = histogram(acc_data(1,:),'Normalization','pdf')
plot(k,acc_pdf_x)
hold off
subplot(3,3,2)
hist_acc = histogram(acc_data(2,:))
subplot(3,3,3)
hist_acc = histogram(acc_data(3,:))
subplot(3,3,4)
hist_gyr = histogram(gyr_data(1,:))
subplot(3,3,5)
hist_gyr = histogram(gyr_data(2,:))
subplot(3,3,6)
hist_gyr = histogram(gyr_data(3,:),'NumBins',9)
subplot(3,3,7)
hist_mag = histogram(mag_data(1,:))
subplot(3,3,8)
hist_mag = histogram(mag_data(2,:))
subplot(3,3,9)
hist_mag = histogram(mag_data(3,:))

figure(3)
subplot(3,1,1)
hold on
plot(acc_data(1,:))
plot(acc_data(2,:))
plot(acc_data(3,:))
hold off
xlim([0 length(acc_data)+10])
legend('x-axis','y-axis','z-axis')

subplot(3,1,2)
hold on
plot(gyr_data(1,:))
plot(gyr_data(2,:))
plot(gyr_data(3,:))
hold off
xlim([0 length(gyr_data)+10])
legend('x-axis','y-axis','z-axis')

subplot(3,1,3)
hold on
plot(mag_data(1,:))
plot(mag_data(2,:))
plot(mag_data(3,:))
hold off
xlim([0 length(mag_data)+10])
legend('x-axis','y-axis','z-axis')





