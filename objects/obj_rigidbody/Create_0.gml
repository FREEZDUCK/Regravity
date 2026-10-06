//Command.cmove_and 쓰기 위한 필수 변수들
velocity = {x: 0, y: 0}
coll_list = [layer_tilemap_get_id("coll_tile"), obj_player, obj_rigidbody, layer_tilemap_get_id("kill_tile")]
impulse = {x: 0, y: 0}
mass = 1

bounce = {x : 0, y : 0}

damp = 0.98
g = global.G

freeze = true
_prev_freeze = freeze
is_touching = false
freeze_layer = layer_get_id("freeze_rigid")
default_layer = layer_get_id("entity")
