shader_type sky;

const vec3 blue = vec3(0.114, 0.169, 0.325);
const vec3 purple = vec3(0.494, 0.145, 0.325);
const vec3 red = vec3(1, 0, 0.3002);

vec3 srgb_to_linear(vec3 srgb) {
    return pow(srgb, vec3(2.2));
}

vec3 discrete(float y) {
	vec3 color;
	
	if (y < 0.38) {
		color = srgb_to_linear(blue);
	} else if (y < 0.48) {
		color = srgb_to_linear(purple);
	} else {
		color = srgb_to_linear(red);
	}
	
	return color;
}

vec3 continuous(float y) {
    const float blend_width = 0.1;
    
    float blue_purple = smoothstep(0.38 - blend_width, 0.38 + blend_width, y);
    float purple_red = smoothstep(0.48 - blend_width, 0.48 + blend_width, y);
    
    vec3 color = mix(
        srgb_to_linear(blue),
        srgb_to_linear(purple),
        blue_purple
    );
    
    color = mix(
        color,
        srgb_to_linear(red),
        purple_red
    );
    
   	return color;
}

void sky() {
    float y = SKY_COORDS.y;

	COLOR = srgb_to_linear(blue);
    //COLOR = discrete(y);
    COLOR = continuous(y);
}