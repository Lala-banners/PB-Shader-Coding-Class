Shader "Unlit/LightingMultiPass"
{
Properties
{
	//Add all properties from Lighting Shader
	_MainTex("Texture", 2D) = "white" {}
	_Gloss("Gloss", Range(0, 1)) = 1
	_Color("Color", Color) = (1, 1, 1, 1)
	_GlowMagnitude("glowMagnitude", Range(0, 1)) = 0.5
	_GlowFrequency("glowFrequency", Range(0, 1)) = 0.5
}
	SubShader
	{
		Tags { "RenderType" = "Opaque" }

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "Maps.cginc" //To use variable, it needs to be created before + above where it's being used.

			ENDCG
		}
	}
}
