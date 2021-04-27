Shader "Unlit/Lighting"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Gloss ("Gloss", float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        //LOD 100

        Pass
        {
            CGPROGRAM
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

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Gloss;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                o.normal = UnityObjectToWorldNormal (v.normal); //Change direction to world normal, not object
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

                float3 N = i.normal;

                // (a) direction
                //Face away from Z axis = B
                //Face Away from X axis = R
                //Face Away from Y axis = G
                //Between axis = extra colours
                float3 L = _WorldSpaceLightPos0.xyz;
                //Have lighting, as object faces away from light it gets darker
                //Clamp 01, dot gives lighting calculation and multiplying with light
                float3 diffuseLight = saturate(dot(N, L)) * _LightColor0.xyz;

                //Secular Lighting (a - b)
                float3 V = normalize(_WorldSpaceCameraPos - i.wPos); //Give position of camera minus world 
                float3 R = reflect(-L, N); //Reflection
                float specularLight = saturate(dot(V, R));
                specularLight = pow(specularLight, _Gloss); //Specular exponent

                //when move camera, colours change
                //return float4(V, 1);
                
                //Activate reflection
                //return float4(R, 1);

                //Activate eclipse mode
                return float4(specularLight.xxx, 1);

                //Activate normals
                //return float4(N, 1); 

                //When move objects, colours change
                return float4(diffuseLight, 1);
                
            }
            ENDCG
        }
    }
}
