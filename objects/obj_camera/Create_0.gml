camera = camera_create();

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1,0);
//x1 = clamp(x, 512, room_width-512);
//y1 = clamp(y, 384, room_height-384);
//var vm = matrix_build_lookat(x1, y1, -10, x, y, 0, 0, 1,0);
var pm = matrix_build_projection_ortho(800, 600, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = global.current_player;

xTo = x;
yTo = y;