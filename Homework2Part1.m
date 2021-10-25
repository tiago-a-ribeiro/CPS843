% Problem 1
image = imread("C:\Users\tiago\Documents\MATLAB\image.jpg");

grey_image = rgb2gray(im2double(image));

robertsx = [+1 0; 0 -1];
robertsy = [0 +1; -1 0];
filterx = imfilter(grey_image, robertsx);
filtery = imfilter(grey_image, robertsy);

roberts_image = abs(filterx) + abs(filtery);
figure("Name", "Roberts"); imshow(roberts_image);

prewitts_image = edge(grey_image, "prewitt");
figure("Name", "Prewitts"); imshow(prewitts_image);

sobels_image = edge(grey_image, "sobel");
figure("Name", "Sobels"); imshow(sobels_image);

% Problem 3
blur_strength = 3;
blurred_image = imgaussfilt(image, blur_strength);
mask = image - blurred_image;

k=5;
highboost_imagek5 = image + k * mask;
k=1;
highboost_imagek1 = image + k * mask;

figure("Name", "Blurred Image"); imshow(blurred_image);
figure("Name", "Mask"); imshow(mask);
figure("Name", "Highboost k=5"); imshow(highboost_imagek5);
figure("Name", "Highboost k=1"); imshow(highboost_imagek1);


% Problem 4
figure("Name", "Greyscale Image"); imshow(grey_image);
noise_image = imnoise(grey_image, "gaussian", 0, 0.05);
figure("Name","Gaussian Intensity=0.05"); imshow(noise_image);

noise_image_2 = imnoise(grey_image, "gaussian", 0, 0.15);
figure("Name","Gaussian Intensity=0.15"); imshow(noise_image_2);

filtered_image = filter2(fspecial('average',7),noise_image);
filtered_image_2 = filter2(fspecial('average',10),noise_image_2);
figure("Name","Gaussian Filtered (Intensity=0.05)"); imshow(filtered_image);
figure("Name","Gaussian Filtered (Intensity=0.15)"); imshow(filtered_image_2);


%imshow(imgaussfilt(noise_image, 3));
