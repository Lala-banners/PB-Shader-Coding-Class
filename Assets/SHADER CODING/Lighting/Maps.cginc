//LightingMultiPass shader will call this

#pragma vertex vert
#pragma fragment frag
// TAKE OFF FOG STUFF AND LOD
//#pragma multi_compile_fog

#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

struct appdata
{
	float4 vertex : POSITION;
	float3 normal : NORMAL; //Get normal
	float2 uv : TEXCOORD0;
};

struct v2f
{
	//UNITY_FOG_COORDS(1)
	float4 vertex : SV_POSITION;
	float2 uv : TEXCOORD0;
	float3 normal : TEXCOORD1;
	float3 wPos  :  TEXCOORD2;
};

//DECLARE STUFF
sampler2D _MainTex;
float4 _MainTex_ST;
float4 _Color;
float _Gloss;
float _GlowMagnitude;
float _GlowFrequency;


v2f vert(appdata v)
{
	v2f o;
	o.vertex = UnityObjectToClipPos(v.vertex);
	o.uv = TRANSFORM_TEX(v.uv, _MainTex);
	o.normal = UnityObjectToWorldNormal(v.normal); //Change direction to world normal, not object
	//UNITY_TRANSFER_FOG(o,o.vertex);
	o.wPos = mul(unity_ObjectToWorld, v.vertex); //World position of each vertex
	return o;
}

fixed4 frag(v2f i) : SV_Target
{
	// REMOVED
	//fixed4 col = tex2D(_MainTex, i.uv);
	// apply fog - NO FOG
	//UNITY_APPLY_FOG(i.fogCoord, col);
	// REMOVED

	//DIFFUSE LIGHT
	float3 N = normalize(i.normal);
	//Face away from Z axis = B
	//Face Away from X axis = R
	//Face Away from Y axis = G
	//Between axis = extra colours
	float3 L = _WorldSpaceLightPos0.xyz; // (a) direction
	float3 lambert = saturate(dot(N, L));
	float3 diffuseLight = lambert * _LightColor0.xyz; //Have lighting, as object faces away from light it gets darker

	//SPECULAR LIGHTING
	float3 V = normalize(_WorldSpaceCameraPos - i.wPos); //Give position of camera minus world 
	//float3 R = reflect(-L, N); //Reflection
	float3 H = normalize(L + V);
	float3 specularLight = saturate(dot(H, N)); //* (lambert > 0);
	float specularExponent = exp2(_Gloss * 11) + 2;
	specularLight = pow(specularLight, specularExponent) * _Gloss; //Specular exponent
	specularLight *= _LightColor0.xyz; //To make specular light have colour

	//return float4(V, 1); //when move camera, colours change
	//return float4(R, 1); //Activate reflection
	//return float4(diffuseLight + specularLight.xxx, 1); //Activate reflection light thing

	//FRESNAL EFFECT
	float fresnel = (1 - dot(V, N)) * (cos(_Time.y * 4)) * _GlowMagnitude + _GlowFrequency;
	//return fresnel;

	//Return Half vector
	return float4(diffuseLight * _Color + specularLight + fresnel, 1);

	//return float4(N, 1); //Activate normals
	//return float4(diffuseLight, 1); //When move objects, colours change
}