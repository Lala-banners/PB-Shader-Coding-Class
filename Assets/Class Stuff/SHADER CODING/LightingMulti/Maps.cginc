#pragma vertex vert
#pragma fragment frag

#include "UnityCG.cginc"
#include "Lighting.cginc"
#include "AutoLight.cginc"

#define USE_LIGHTING

struct appdata
{
	float4 vertex : POSITION;
	float3 normal : NORMAL;
	float2 uv : TEXCOORD0;
};

struct v2f
{
	float4 vertex : SV_POSITION;
	float2 uv : TEXCOORD0;
	float3 normal : TEXCOORD1;
	float3 wPos : TEXCOORD2;
	//Gives world coords of the light (fade effect)
	LIGHTING_COORDS(3, 4) //No ;
};

sampler2D _MainTex;
float4 _MainTex_ST;
float4 _Color;
float _Gloss;
float _glowMag;
float _glowFeq;

v2f vert(appdata v)
{
	v2f o;
	o.vertex = UnityObjectToClipPos(v.vertex);
	o.uv = TRANSFORM_TEX(v.uv, _MainTex);
	o.normal = UnityObjectToWorldNormal(v.normal);
	o.wPos = mul(unity_ObjectToWorld, v.vertex);

	TRANSFER_VERTEX_TO_FRAGMENT(o);
	return o;
}

fixed4 frag(v2f i) : SV_Target
{
#ifdef USE_LIGHTING
	//diffuse lighting
	float3 N = normalize(i.normal);
	float3 L = _WorldSpaceLightPos0.xyz;//a direction 
	float attenuation = LIGHT_ATTENUATION(i);


	float3 lambert = saturate(dot(N, L));
	float3 diffuseLight = (attenuation * lambert) * _LightColor0.xyz;

	//Normalize Lighting
	float3 V = normalize(_WorldSpaceCameraPos - i.wPos);
	float3 H = normalize(L + V);

	//Specular
	float3 specularLight = saturate(dot(H,N));// * (lambert > 0);
	float specularExponent = exp2(_Gloss * 11) + 2;
	specularLight = pow(specularLight, specularExponent) * _Gloss; //specular exponent
	specularLight *= _LightColor0.xyz;


	return float4(diffuseLight * _Color + specularLight, 1);

#else
	#ifdef IS_IN_BASE_PASS
	return _Color;
	#else
	return 0;
	#endif
#endif

	//return float4(diffuseLight,1);
	// sample the texture
	//fixed4 col = tex2D(_MainTex, i.uv);
	//return col;
}