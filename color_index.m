function result = color_index(needle, haystack, M)
%% getting the image histogram
I = acquire_hist(haystack);

%% ratio hist
R = min(M./I,1);

%% backprojection
back_proj = zeros( size(haystack,1),size(haystack,2));
for i = 1:size(haystack,1)
	for j = 1:size(haystack,2)
		cur_pix = haystack(i,j,:);
		back_proj(i,j) = R(cur_pix(1), cur_pix(2), cur_pix(3));
	end
end

%% conv to find exact location
r = min(size(needle,1), size(needle,2))/2;
w = 3*r;
% mask = zeros(round(w));
[y,x] = meshgrid(1:w);
mask = ((x-w/2).^2 + (y-w/2).^2 < r.^2);

loc = conv2(back_proj,mask,'same');
loc = loc/max(loc(:));
% figure, imshow(loc);
[r,c] = find(loc  == max(loc(:)));
result = [r,c];
end