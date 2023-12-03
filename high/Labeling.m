function[L,bf]=neighbourhood(face)
bf=BinaryFaceImage(face);
k=medfeilt2(bf);
L=bwlabel(K,8);