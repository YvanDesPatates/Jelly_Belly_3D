shader_type spatial;
render_mode ambient_light_disabled, shadows_disabled, unshaded;

uniform vec3 body_color : source_color;
uniform float acceleration = 20;


void vertex() {
	float defy = sin(UV.y * 10.0 * PI - TIME * acceleration) + 1.0 / 2.0;
	float defx = sin(UV.x * 10.0 * PI - TIME * acceleration) + 1.0 / 2.0;
	VERTEX.xz += NORMAL.xz * defy * 0.1 * UV.y * COLOR.x;
	VERTEX.zy += NORMAL.zy * defx * 0.05 * UV.y * COLOR.x;
}

void fragment() {
	ALBEDO = body_color;
}
