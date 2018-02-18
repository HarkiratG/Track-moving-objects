function hist = acquire_hist(image)

hist = zeros(8,8,8);
for i = 1:size(image,1)
	for j = 1:size(image,2)
		cur_pix = image(i,j,:);
		hist(cur_pix(1), cur_pix(2), cur_pix(3)) = hist(cur_pix(1), cur_pix(2), cur_pix(3)) + 1;
	end
end

end