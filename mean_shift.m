function result = mean_shift(needle, haystack, prev_location, M)

distance = 100;

%creates a black image
I = zeros(8,8,8);
%creates a histogram of main pic, just around the last known pic of object
for i = max(prev_location(1) - distance,1):min(prev_location(1) + distance,size(haystack,1))
	for j = max(prev_location(2) - distance,1):min(prev_location(2) + distance,size(haystack,2))
		cur_pix = haystack(i,j,:);
		I(cur_pix(1), cur_pix(2), cur_pix(3)) = I(cur_pix(1), cur_pix(2), cur_pix(3)) + 1;
	end
end

%ratio histogram
R = min(M./I,1);

%back projection to know where the object is currently
back_proj = zeros( size(haystack,1),size(haystack,2),size(haystack,3) );
for i = max(prev_location(1) - distance,1):min(prev_location(1) + distance,size(haystack,1))
	for j = max(prev_location(2) - distance,1):min(prev_location(2) + distance,size(haystack,2))
		cur_pix = haystack(i,j,:);
		back_proj(i,j,:) = R(cur_pix(1), cur_pix(2), cur_pix(3));
	end
end
back_proj = rgb2gray(back_proj);

r = min(size(needle,1), size(needle,2))/2;
w = 3*r;
% mask = zeros(w);
[y,x] = meshgrid(1:w);
mask = ((x-w/2).^2 + (y-w/2).^2 < r.^2);

loc = conv2(back_proj,mask,'same');
loc = loc/max(loc(:));
[r,c] = find(loc  == max(loc(:)));
result = [r,c];
end