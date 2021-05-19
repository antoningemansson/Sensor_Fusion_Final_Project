%% Final project sensor fusion
% Task 2
clc, close all, clear all
% [xhat, meas] = phone_filter();
[xhat, meas] = filterTemplate();
% 
%%
clc, clf
acc_data = meas.acc(:, ~any(isnan(meas.acc), 1));
gyr_data = meas.gyr(:, ~any(isnan(meas.gyr), 1));
mag_data = meas.mag(:, ~any(isnan(meas.mag), 1));
acc_mean = mean(acc_data, 2);
gyr_mean = mean(gyr_data, 2);
mag_mean = mean(mag_data, 2);

acc_cov = cov(acc_data');
gyr_cov = cov(gyr_data');
mag_cov = cov(mag_data');
% 
% k_x = linspace(acc_mean(1,:)-3*sqrt(acc_cov(1,1)),acc_mean(1,:)+3*sqrt(acc_cov(1,1)));
% k_y = linspace(acc_mean(2,:)-3*sqrt(acc_cov(2,2)),acc_mean(2,:)+3*sqrt(acc_cov(2,2)));
% k_z = linspace(acc_mean(3,:)-3*sqrt(acc_cov(3,3)),acc_mean(3,:)+3*sqrt(acc_cov(3,3)));
% pdf_x = normpdf(k_x,acc_mean(1,:), sqrt(acc_cov(1,1)));
% pdf_y = normpdf(k_y,acc_mean(2,:), sqrt(acc_cov(2,2)));
% pdf_z = normpdf(k_z,acc_mean(3,:), sqrt(acc_cov(3,3)));
% 
% figure(1)
% subplot(3,3,1)
% title('Accelerometer data, x-direction [m/s^2]')
% hold on
% hist_acc = histogram(acc_data(1,:),'Normalization','pdf','NumBins',17)
% plot(k_x,pdf_x,'linewidth',2)
% hold off
% subplot(3,3,2)
% title('Accelerometer data, y-direction [m/s^2]')
% hold on
% hist_acc = histogram(acc_data(2,:),'Normalization','pdf','NumBins',14)
% plot(k_y,pdf_y,'linewidth',2)
% hold off
% subplot(3,3,3)
% title('Accelerometer data, z-direction [m/s^2]')
% hold on
% hist_acc = histogram(acc_data(3,:),'Normalization','pdf','NumBins',30)
% plot(k_z,pdf_z,'linewidth',2)
% hold off
% 
% k_x = linspace(gyr_mean(1,:)-3*sqrt(gyr_cov(1,1)),gyr_mean(1,:)+3*sqrt(gyr_cov(1,1)));
% k_y = linspace(gyr_mean(2,:)-3*sqrt(gyr_cov(2,2)),gyr_mean(2,:)+3*sqrt(gyr_cov(2,2)));
% k_z = linspace(gyr_mean(3,:)-3*sqrt(gyr_cov(3,3)),gyr_mean(3,:)+3*sqrt(gyr_cov(3,3)));
% pdf_x = normpdf(k_x,gyr_mean(1,:), sqrt(gyr_cov(1,1)));
% pdf_y = normpdf(k_y,gyr_mean(2,:), sqrt(gyr_cov(2,2)));
% pdf_z = normpdf(k_z,gyr_mean(3,:), sqrt(gyr_cov(3,3)));
% 
% subplot(3,3,4)
% title('Gyroscope data, x-direction [rad/s]')
% hold on
% hist_acc = histogram(gyr_data(1,:),'Normalization','pdf','NumBins',15)
% plot(k_x,pdf_x,'linewidth',2) 
% hold off
% subplot(3,3,5)
% title('Gyroscope data, y-direction [rad/s]')
% hold on
% hist_acc = histogram(gyr_data(2,:),'Normalization','pdf','NumBins',9)
% plot(k_y,pdf_y,'linewidth',2)
% hold off
% subplot(3,3,6)
% title('Gyroscope data, z-direction [rad/s]')
% hold on
% hist_acc = histogram(gyr_data(3,:),'Normalization','pdf','NumBins',6)
% plot(k_z,pdf_z,'linewidth',2)
% hold off
% 
% 
% k_x = linspace(mag_mean(1,:)-3*sqrt(mag_cov(1,1)),mag_mean(1,:)+3*sqrt(mag_cov(1,1)));
% k_y = linspace(mag_mean(2,:)-3*sqrt(mag_cov(2,2)),mag_mean(2,:)+3*sqrt(mag_cov(2,2)));
% k_z = linspace(mag_mean(3,:)-3*sqrt(mag_cov(3,3)),mag_mean(3,:)+3*sqrt(mag_cov(3,3)));
% pdf_x = normpdf(k_x,mag_mean(1,:), sqrt(mag_cov(1,1)));
% pdf_y = normpdf(k_y,mag_mean(2,:), sqrt(mag_cov(2,2)));
% pdf_z = normpdf(k_z,mag_mean(3,:), sqrt(mag_cov(3,3)));
% 
% subplot(3,3,7)
% title('Magnetometer data, x-direction [\muT]')
% hold on
% hist_acc = histogram(mag_data(1,:),'Normalization','pdf','NumBins',25)
% plot(k_x,pdf_x,'linewidth',2) 
% hold off
% subplot(3,3,8)
% title('Magnetometer data, y-direction [\muT]')
% hold on
% hist_acc = histogram(mag_data(2,:),'Normalization','pdf','NumBins',23)
% plot(k_y,pdf_y,'linewidth',2)
% hold off
% subplot(3,3,9)
% title('Magnetometer data, z-direction [\muT]')
% hold on
% hist_acc = histogram(mag_data(3,:),'Normalization','pdf','NumBins',15)
% plot(k_z,pdf_z,'linewidth',2)
% hold off

figure(2)
subplot(3,1,1)
hold on
plot(acc_data(1,:))
plot(acc_data(2,:))
plot(acc_data(3,:))
hold off
xlim([0 length(acc_data)+10])
title('Accelerometer data')
xlabel('Time')
ylabel('acceleratiom [m/s^2]')
legend('x-axis','y-axis','z-axis')

subplot(3,1,2)
hold on
plot(gyr_data(1,:))
plot(gyr_data(2,:))
plot(gyr_data(3,:))
hold off
title('Gyroscope data')
xlabel('Time')
ylabel('angular velocity [rad/s]')
xlim([0 length(gyr_data)+10])
legend('x-axis','y-axis','z-axis')

subplot(3,1,3)
hold on
plot(mag_data(1,:))
plot(mag_data(2,:))
plot(mag_data(3,:))
hold off
title('Magnetometer data')
xlabel('Time')
ylabel('Magnetic Field [\muT]')
xlim([0 length(mag_data)+10])
legend('x-axis','y-axis','z-axis')

%% Task 11

euler_est = 180/pi*q2euler(xhat.x);
euler_google = 180/pi*q2euler(meas.orient);


figure(3)
subplot(3,1,1)
hold on
plot(euler_est(1,:))
plot(euler_google(1,:))
hold off
% xlim([0 length(acc_data)+10])
legend('OWN','Google')

subplot(3,1,2)
hold on
plot(euler_est(2,:))
plot(euler_google(2,:))
hold off
% xlim([0 length(gyr_data)+10])
legend('OWN','Google')

subplot(3,1,3)
hold on
plot(euler_est(3,:))
plot(euler_google(3,:))
hold off
% xlim([0 length(mag_data)+10])
legend('OWN','Google')


