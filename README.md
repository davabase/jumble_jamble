# Jumble Jamble

Jumble Jamble is a game made in about 32 hours for the Miz Jame 1 game jam, you can view it on Itch here: https://davabase.itch.io/jumble-jamble

The game uses a free lighting asset called Fast Lights 2, you can find it here: https://marketplace.yoyogames.com/assets/9106/fast-lights-2

It's a simple physics based game but there's some interesting stuff in here.

If you want to learn how to manipulate texture coordinates to warp images, check out objects/Distortion/Draw_0.gml and shaders/shd_passthrough/ to see how vertex buffers can be used with a passthrough shader to  draw a warped image.

To see how sine waves can be used to produce simple and smooth animations, check out objects/SkullGod/Step_0.gml to see how I set the image_angle based on sine and a changing theta value.