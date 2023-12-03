function sobelEdgeDetection(skinImage)
grayImage=rgb2gray(skinImage);
sobelEdge=edge(grayImage,'sobel');
