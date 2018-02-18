function imshow_custom(collage, result)

imshow(collage)
hold on
angel = 0:0.1:2*pi;
x_cir = result(2) + 20*cos(angel);
y_cir = result(1) + 20*sin(angel);
plot(x_cir, y_cir, 'Color', 'g', 'LineWidth', 2);
hold off

end