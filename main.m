clearvars
close all
clc
import color_index.*
import acquire_hist.*
import imshow_custom.*
import mean_shift.*

part = 3;

%% part 1
if(part == 1)
	% floor( x/256*8) +1 gives values  between 1-8 inclusive
	target = double(imread('CMPT412_SwainDatabase/Relevant_im4training/charmin.sqr.128.bmp'))/256;
	bigPic = double(imread('CMPT412_SwainDatabase/SwainCollageForBackprojectionTesting.bmp'))/256;
	
	needle = floor(target*8)+1;
	haystack = floor(bigPic*8)+1;
	
	%% getting the model histogram
	%image histogram inside color_index function
	M = acquire_hist(needle);
	
	%% calling functions
	result = color_index(needle,haystack, M);
	imshow_custom(bigPic,result);
	
	%% part 2
elseif (part == 2)
	%% importing files
	video = load('CMPT412_blackcup.mat');
	
	bigPic = double(video.blackcup)/256;
	haystack = floor(bigPic*8)+1;
	
	figure, imshow(bigPic(:,:,:,1));
	
	[x_input,y_input] = ginput(1);
	r=50;
	target = imcrop(bigPic(:,:,:,1),[x_input-r y_input-r 2*r 2*r]);	
	needle = floor(target*8)+1;
	
	%% getting the model histogram
	M = acquire_hist(needle);
	
	figure
	for i=1:size(haystack,4)
		a = haystack(:,:,:,i);
		result = color_index(needle,a, M);
		figure
		imshow_custom(bigPic(:,:,:,i), result);
		
	end
	
	%% part 3
elseif (part ==3)
	video = load('CMPT412_bluecup.mat');
	
	bigPic = double(video.bluecup)/256;
	haystack = floor(bigPic*8)+1;
	
% 	figure, 
	imshow(bigPic(:,:,:,1));
	
	[x_input,y_input] = ginput(1);
	r=60;
	target = imcrop(bigPic(:,:,:,1),[x_input-r y_input-r 2*r 2*r]);	
	needle = floor(target*8)+1;
	
	%% getting the color histogram
	M = acquire_hist(needle);
	I = acquire_hist(haystack(:,:,:,1));
	
	result = color_index(needle, haystack(:,:,:,1), M);
	prev_result = result;
	i=1;
% 	figure
	while i< size(haystack,4)
		a = haystack(:,:,:,i);
		result = mean_shift(needle, a, prev_result, M);
% 				close
		figure
		imshow_custom(bigPic(:,:,:,i), result);

		prev_result = result;
		i = i+1;
	end
	
	
else
	exit();
end
