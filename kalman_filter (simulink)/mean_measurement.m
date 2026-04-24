%X = data{3}.Values.Data;

%time =data{3}.Values.Time;

load = raw_data{3}.Values.Data;

means = mean(load);

N = numel(load);

R_varience = 0;

for s = 1:N

 R_varience = R_varience + (load(s) - means)^2;

end

R_varience = R_varience / (N-1);

%g = 9.81;

%k = 27.2465;

%c = 0.0925;

%m = 0.264;

%plot(time , X);