//Orginal from https://www.shadertoy.com/view/7tcSRS


precision highp float;

layout(location=1)uniform float iTime;

#define hue(v)  ( .6 + .6 * cos( 6.3*(v)  + vec4(0,23,21,0)  ) )

vec2 rotate(vec2 v, float a) {
	float s = sin(a);
	float c = cos(a);
	mat2 m = mat2(c, s, -s, c);
	return m * v;
}

vec4 fragment(vec2 uv, vec2 fragCoord) {
    uv = (fragCoord.xy - resolution.xy * 0.5) / resolution.x;
          
    float t = iTime*2.0;
    
    uv = rotate(uv,t*0.4);
    
    vec3 rd = vec3(0.);
    
    for(float i=0.; i< 12.;i+=.8){
    
        float tt = t + sqrt(100. - i)*8.5; //seperate dots        
        vec2 m = vec2(cos(tt), sin(2. * tt) / 3.5)*.3;//increase size
        
        float ift = i*.0015;
        float d = smoothstep(.06 - ift, .00 - ift,  length(uv + m));
        
        rd = rd + d * hue(-tt*.33).rgb;       
    }  
    return vec4(vec3(rd), 1.);
}
