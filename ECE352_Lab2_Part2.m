load('C:\Users\Makenzie\Documents\Labs\ECE 352\Lab2\Assignment Narrative\blur_data.mat')

Y = blur_photo
colormap gray

row = zeros(1,300)
L = 18 
row(1:L-1) = ones(1,L-1)

column = zeros(1,300)
column(1) = 1

H = toeplitz(column,row)

X = Y/H

image(X)