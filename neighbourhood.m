function[L,bf]=neighbourhood(face)
bf=BinaryFaceImage(face);
k=medfilt2(bf);
L=bwlabel(k,8);