// This file assume SHADER_API_D3D11 is defined

#define INTRINSIC_BITFIELD_EXTRACT
#define BitFieldExtract __v_bfe_u32
#define INTRINSIC_BITFIELD_EXTRACT_SIGN_EXTEND
#define BitFieldExtractSignExtend __v_bfe_i32
#define INTRINSIC_BITFIELD_INSERT
#define BitFieldInsert __v_bfi_b32
#define INTRINSIC_WAVEREADFIRSTLANE
#define WaveReadFirstLane ReadFirstLane
#define INTRINSIC_MAD24
#define Mad24 mad24
#define INTRINSIC_MINMAX3
#define Min3 min3
#define Max3 max3
//#define INTRINSIC_CUBEMAP_FACE_ID // Must investigate why AMD reference implementation is different than ours

#define UNITY_UV_STARTS_AT_TOP 1
#define UNITY_REVERSED_Z 1
#define UNITY_NEAR_CLIP_VALUE (1.0)
// This value will not go through any matrix projection convertion
#define UNITY_RAW_FAR_CLIP_VALUE (0.0)
#define VERTEXID_SEMANTIC SV_VertexID
#define FRONT_FACE_SEMANTIC SV_IsFrontFace
#define FRONT_FACE_TYPE bool
#define IS_FRONT_VFACE(VAL, FRONT, BACK) ((VAL) ? (FRONT) : (BACK))

#define CBUFFER_START(name) cbuffer name {
#define CBUFFER_END };

// Initialize arbitrary structure with zero values.
// Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
#define ZERO_INITIALIZE(type, name) name = (type)0;
#define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }

// Texture util abstraction

#define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.GetLOD(samplerName, coord2)

// Texture abstraction

#define TEXTURE2D(textureName)                Texture2D textureName
#define TEXTURE2D_ARRAY(textureName)          Texture2DArray textureName
#define TEXTURECUBE(textureName)              TextureCube textureName
#define TEXTURECUBE_ARRAY(textureName)        TextureCubeArray textureName
#define TEXTURE3D(textureName)                Texture3D textureName

#define TEXTURE2D_SHADOW(textureName)         TEXTURE2D(textureName)
#define TEXTURE2D_ARRAY_SHADOW(textureName)   TEXTURE2D_ARRAY(textureName)
#define TEXTURECUBE_SHADOW(textureName)       TEXTURECUBE(textureName)
#define TEXTURECUBE_ARRAY_SHADOW(textureName) TEXTURECUBE_ARRAY(textureName)

#define RW_TEXTURE2D(type, textureName)       RW_Texture2D<type> textureName
#define RW_TEXTURE3D(type, textureName)       RW_Texture3D<type> textureName

#define SAMPLER(samplerName)                  SamplerState samplerName
#define SAMPLER_CMP(samplerName)              SamplerComparisonState samplerName

#define TEXTURE2D_ARGS(textureName, samplerName)                 TEXTURE2D(textureName),         SAMPLER(samplerName)
#define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)           TEXTURE2D_ARRAY(textureName),   SAMPLER(samplerName)
#define TEXTURECUBE_ARGS(textureName, samplerName)               TEXTURECUBE(textureName),       SAMPLER(samplerName)
#define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
#define TEXTURE3D_ARGS(textureName, samplerName)                 TEXTURE3D(textureName),         SAMPLER(samplerName)

#define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)          TEXTURE2D(textureName),         SAMPLER_CMP(samplerName)
#define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)    TEXTURE2D_ARRAY(textureName),   SAMPLER_CMP(samplerName)
#define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)        TEXTURECUBE(textureName),       SAMPLER_CMP(samplerName)
#define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)

#define TEXTURE2D_PARAM(textureName, samplerName)                textureName, samplerName
#define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)          textureName, samplerName
#define TEXTURECUBE_PARAM(textureName, samplerName)              textureName, samplerName
#define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)        textureName, samplerName
#define TEXTURE3D_PARAM(textureName, samplerName)                textureName, samplerName

#define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)         textureName, samplerName
#define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)   textureName, samplerName
#define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)       textureName, samplerName
#define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName) textureName, samplerName

#define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                           textureName.Sample(samplerName, coord2)
#define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                  textureName.SampleLevel(samplerName, coord2, lod)
#define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                textureName.SampleBias(samplerName, coord2, bias)
#define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, dpdx, dpdy)          textureName.SampleGrad(samplerName, coord2, dpdx, dpdy)
#define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)              textureName.Sample(samplerName, float3(coord2, index))
#define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)     textureName.SampleLevel(samplerName, float3(coord2, index), lod)
#define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)   textureName.SampleBias(samplerName, float3(coord2, index), bias)
#define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                         textureName.Sample(samplerName, coord3)
#define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                textureName.SampleLevel(samplerName, coord3, lod)
#define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)              textureName.SampleBias(samplerName, coord3, bias)
#define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)            textureName.Sample(samplerName, float4(coord3, index))
#define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)   textureName.SampleLevel(samplerName, float4(coord3, index), lod)
#define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias) textureName.SampleBias(samplerName, float4(coord3, index), bias)
#define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                           textureName.Sample(samplerName, coord3)
#define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod) 				 textureName.SampleLevel(samplerName, coord3, lod)

#define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                    textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
#define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)       textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
#define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                  textureName.SampleCmpLevelZero(samplerName, (coord3).xyz, (coord3).w)
#define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)     textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)

#define SAMPLE_DEPTH_TEXTURE(textureName, samplerName, coord2)          SAMPLE_TEXTURE2D(textureName, samplerName, coord2).r
#define SAMPLE_DEPTH_TEXTURE_LOD(textureName, samplerName, coord2, lod) SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod).r

#define LOAD_TEXTURE2D(textureName, unCoord2)                       textureName.Load(int3(unCoord2, 0))
#define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)              textureName.Load(int3(unCoord2, lod))
#define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)     textureName.Load(unCoord2, sampleIndex)
#define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)          textureName.Load(int4(unCoord2, index, 0))
#define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod) textureName.Load(int4(unCoord2, index, lod))
#define LOAD_TEXTURE3D(textureName, unCoord3)                       textureName.Load(int4(unCoord3, 0))
#define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)              textureName.Load(int4(unCoord3, lod))

#define PLATFORM_SUPPORT_GATHER
#define GATHER_TEXTURE2D(textureName, samplerName, coord2, offset)        textureName.Gather(samplerName, coord2, offset)
#define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)   textureName.Gather(samplerName, float3(coord2, index), offset)
#define GATHER_TEXTURECUBE(textureName, samplerName, coord3)              textureName.Gather(samplerName, coord3)
#define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index) textureName.Gather(samplerName, float4(coord3, index))

#define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2, offset)      textureName.GatherRed(samplerName, coord2, offset)
#define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2, offset)    textureName.GatherGreen(samplerName, coord2, offset)
#define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2, offset)     textureName.GatherBlue(samplerName, coord2, offset)