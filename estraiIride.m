% basata sulla funzione createiristemplate.m di Libor Masek
function estraiIride(eyeimage_filename)

% path for writing diagnostic images
global DIAGPATH
DIAGPATH = 'diagnostics';

%normalisation parameters
radial_res = 20;
angular_res = 240;
% with these settings a 9600 bit iris template is
% created

eyeimage = imread(eyeimage_filename); 

savefile = [substr(eyeimage_filename,0,-4),'-houghpara.mat'];
if exist(savefile)
    % if this file has been processed before
    % then load the circle parameters and
    % noise information for that file.
    load(savefile);
    
else
    
    % if this file has not been processed before
    % then perform automatic segmentation and
    % save the results to a file
    
    [circleiris circlepupil imagewithnoise] = segmentiris(eyeimage);
    save(savefile,'circleiris','circlepupil','imagewithnoise');
    
end

% WRITE NOISE IMAGE
%

imagewithnoise2 = uint8(imagewithnoise);
imagewithcircles = uint8(eyeimage);

%get pixel coords for circle around iris
[x,y] = circlecoords([circleiris(2),circleiris(1)],circleiris(3),size(eyeimage));
ind2 = sub2ind(size(eyeimage),double(y),double(x)); 

%get pixel coords for circle around pupil
[xp,yp] = circlecoords([circlepupil(2),circlepupil(1)],circlepupil(3),size(eyeimage));
ind1 = sub2ind(size(eyeimage),double(yp),double(xp));


% Write noise regions
imagewithnoise2(ind2) = 255;
imagewithnoise2(ind1) = 255;
% Write circles overlayed
imagewithcircles(ind2) = 255;
imagewithcircles(ind1) = 255;
w = cd;
noisefile=[substr(eyeimage_filename,0,-4),'-noise.jpg'];
segmentedfile=[substr(eyeimage_filename,0,-4),'-segmented.jpg'];
cd(DIAGPATH);
imwrite(imagewithnoise2,noisefile,'jpg');
imwrite(imagewithcircles,segmentedfile,'jpg');
cd(w);

% perform normalisation

[polar_array noise_array] = normaliseiris(imagewithnoise, circleiris(2),...
    circleiris(1), circleiris(3), circlepupil(2), circlepupil(1), circlepupil(3),eyeimage_filename, radial_res, angular_res);


% WRITE NORMALISED PATTERN, AND NOISE PATTERN
w = cd;
polarfile=[substr(eyeimage_filename,0,-4),'-polar.jpg'];
polarnoisefile=[substr(eyeimage_filename,0,-4),'-polarnoise.jpg'];
cd(DIAGPATH);
imwrite(polar_array,polarfile,'jpg');
imwrite(noise_array,polarnoisefile,'jpg');
cd(w);
imwrite(polar_array,polarfile,'jpg');   %uso la funzione substr.m di Peter Acklam
