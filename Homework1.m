myimage = imread("C:\Users\tiago\Documents\MATLAB\image.jpg");
grayimage = rgb2gray(myimage);
imshow(grayimage, []);

% Problem 1
logtransform = log(1 + im2double(myimage));
invlogtransform = exp(im2double(myimage)) - 1; 
figure("Name", "Log Transformation");
imshow(logtransform);
figure("Name", "Inverse Log Transformation");
imshow(invlogtransform);
figure("Name", "Power Law Transformation");
powerlawtransform = im2double(grayimage).^2;
imshow(powerlawtransform);

gammapoint3 = im2double(grayimage).^0.3;
gamma3 = im2double(grayimage).^3;
figure("Name", "Gamma = 0.3");
imshow(gammapoint3);
figure("Name", "Gamma = 3");
imshow(gamma3);

% Problem 2

bitplane8 = bitget(grayimage, 8);
bitplane7 = bitget(grayimage, 7);
bitplane6 = bitget(grayimage, 6);
bitplane5 = bitget(grayimage, 5);
% Highest four bits
highest4bits = bitplane8*(2^8) + bitplane7*(2^7) + bitplane6*(2^6) + bitplane5*(2^5);
highest2bits = bitplane8*(2^8) + bitplane7*(2^7);
figure("Name", "Highest 2bit planes");
imshow(highest2bits, []);
figure("Name", "Highest 4bit planes");
imshow(highest4bits, []);

% Problem 3
EH1 = histeq(grayimage);
figure("Name", "Histogram - Original");
imhist(grayimage);
figure("Name", "Equalized Histogram - Original");
imhist(EH1);
figure("Name", "Equalized Histogram - Original IMAGE");
imshow(EH1);

figure("Name", "Histogram - Gamma = 0.3");
imhist(gammapoint3);
EH2 = histeq(gammapoint3);
figure("Name", "Equalized Histogram - Gamma = 0.3");
imhist(EH2);
figure("Name", "Equalized Histogram - Gamma = 0.3 IMAGE");
imshow(EH2);

figure("Name", "Histogram - Gamma = 3");
imhist(gamma3);
EH3 = histeq(gamma3);
figure("Name", "Equalized Histogram - Gamma = 3");
imhist(EH3);
figure("Name", "Equalized Histogram - Gamma = 3 IMAGE");
imshow(EH3);


% Problem 5
figure("Name", "3-bit Histogram");
histogram( ...
    [1,2,4,7,3, ...
     2,4,7,3,1, ...
     5,6,2,1,1, ...
     4,7,1,1,1] ...
);

figure("Name", "3-bit Histogram Equalized")
histogram( ...
    [2,4,5,7,4, ...
     4,5,7,4,2, ...
     6,6,4,2,2, ...
     5,7,2,2,2] ...
);
