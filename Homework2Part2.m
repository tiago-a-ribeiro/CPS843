image = imread("C:\Users\tiago\Documents\MATLAB\low_light_image.jpg");
% Step 1 - Enhance Low Light Image using Dehazing Algorithm
inv = imcomplement(image);
figure("Name","Inverted image"); imshow(inv);

inv_reducedhaze = imreducehaze(inverted);
figure("Name","Reduced Haze image"); imshow(inv_reducedhaze);

enhanced = imcomplement(inv_reducedhaze);
figure("Name","Enhanced image"); imshow(enhanced);

% Step 2 - Improve Results Further Using imreducehaze Optional Parameters
inv_reducedhaze = imreducehaze(inv, 'Method','approx','ContrastEnhancement','boost');
imp = imcomplement(inv_reducedhaze);
figure("Name", "Improved results"); imshow(imp);

% Step 3 - Another Example of Improving Poorly Lit Image
inv = imcomplement(image);
inv_reducedhaze = imreducehaze(inv,'ContrastEnhancement','none');
result = imcomplement(inv_reducedhaze);
figure; montage({image, result});

% Step 4 - Reduce Color Distortion by Using Different Color Space
lab = rgb2lab(image);

inverted_lab = imcomplement(lab(:,:,1) ./ 100);
enhanced_lab = imcomplement(imreducehaze(inverted_lab,'ContrastEnhancement','none'));
sat_lab(:,:,1) = enhanced_lab .* 100;
sat_lab(:,:,2:3) = lab(:,:,2:3) * 2;

final = lab2rgb(sat_lab);
figure; montage({image, final});

% Step 5 - Improve Results Using Denoising
new_result = imguidedfilter(result);
montage({result, new_result});

% Step 6 - Estimate Illumination Map
inv = imcomplement(image);
[Binv,Tinv] = imreducehaze(inv,'Method','approxdcp','ContrastEnhancement','none');
illuminated = imcomplement(Tinv);
figure("Name","Illumination Map"); imshow(illuminated); colormap("hot");
