myimage = imread("C:\Users\tiago\Documents\MATLAB\image.jpg");
grayimage = rgb2gray(myimage);
imshow(grayimage, []);

% Problem 1
logtransform = log(1 + im2double(myimage)); 
figure("Name", "Log Transformation");
imshow(logtransform);
figure("Name", "Power Law Transformation");
powerlawtransform = im2double(myimage).^2;
imshow(powerlawtransform);

gammapoint3 = im2double(grayimage).^0.3;
gamma3 = im2double(grayimage).^3;
figure("Name", "Gamma = 0.3");
imshow(gammapoint3);
figure("Name", "Gamma = 3");
imshow(gamma3);

% Problem 2
bitplane1 = bitget(grayimage, 1);
bitplane2 = bitget(grayimage, 2);
bitplane3 = bitget(grayimage, 3);
bitplane4 = bitget(grayimage, 4);
bitplane5 = bitget(grayimage, 5);
bitplane6 = bitget(grayimage, 6);
bitplane7 = bitget(grayimage, 7);
bitplane8 = bitget(grayimage, 8);
figure("Name", "Bit plane 1");
imshow(bitplane1, []);
figure("Name", "Bit plane 2");
imshow(bitplane2, []);
figure("Name", "Bit plane 3");
imshow(bitplane3, []);
figure("Name", "Bit plane 4");
imshow(bitplane4, []);
figure("Name", "Bit plane 5");
imshow(bitplane5, []);
figure("Name", "Bit plane 6");
imshow(bitplane6, []);
figure("Name", "Bit plane 7");
imshow(bitplane7, []);
figure("Name", "Bit plane 8");
imshow(bitplane8, []);

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
x=[0,1,2,3,4,5,6,7];
y=[0, 0.35, 0.15, 0.1, 0.15, 0.05, 0.05, 0.15];
xticks([0 1 2 3 4 5 6 7]);
plot(x,y, 'o');

figure("Name", "3-bit Histogram Equalized")
x=[0,1,2,3,4,5,6,7];
y=[0, 0, 0.35, 0, 0.25, 0.15, 0.1, 0.15];
xticks([0 1 2 3 4 5 6 7]);
plot(x,y, 'o');
