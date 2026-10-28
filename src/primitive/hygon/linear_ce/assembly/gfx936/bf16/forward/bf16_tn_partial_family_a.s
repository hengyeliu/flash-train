

/******************************************/
/* Function Prefix                        */
/******************************************/



/******************************************/
/* Begin Kernel                           */
/******************************************/

// Component.Signature.SignatureCOV3
.amdgcn_target "amdgcn-amd-amdhsa--gfx936"
.text
	.protected hcu_linear_ce_forward_bf16_tn_family_a
	.globl hcu_linear_ce_forward_bf16_tn_family_a
	.p2align 8
	.type hcu_linear_ce_forward_bf16_tn_family_a,@function
	.section .rodata,#alloc
	.p2align 6
	.amdhsa_kernel hcu_linear_ce_forward_bf16_tn_family_a
	  .amdhsa_user_sgpr_kernarg_segment_ptr 1
	  .amdhsa_next_free_vgpr 255 // vgprs
	  .amdhsa_next_free_sgpr 100 // sgprs
	  .amdhsa_group_segment_fixed_size 65536 // lds bytes
	  .amdhsa_private_segment_fixed_size 0
	  .amdhsa_system_sgpr_workgroup_id_x 1
	  .amdhsa_system_sgpr_workgroup_id_y 1
	  .amdhsa_system_sgpr_workgroup_id_z 1
	  .amdhsa_system_vgpr_workitem_id 0
	.end_amdhsa_kernel
.text

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 16 x 8 */
/* SubGroup= 16 x 32 */
/* VectorWidth=8 */
/* GlobalLoadVectorWidthA=8, GlobalLoadVectorWidthB=8 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=0 */
.amdgpu_metadata
---
amdhsa.version:
  - 1
  - 0
amdhsa.kernels:
  - .name: hcu_linear_ce_forward_bf16_tn_family_a
    .symbol: 'hcu_linear_ce_forward_bf16_tn_family_a.kd'
    .language:                   OpenCL C
    .language_version:
      - 2
      - 0
    .args:
      - .name:            sizeC
        .size:            8
        .offset:          0
        .value_kind:      by_value
        .value_type:      u64
      - .name:            sizeA
        .size:            8
        .offset:          8
        .value_kind:      by_value
        .value_type:      u64
      - .name:            sizeB
        .size:            8
        .offset:          16
        .value_kind:      by_value
        .value_type:      u64
      - .name:            D
        .size:            8
        .offset:          24
        .value_kind:      global_buffer
        .value_type:      struct
        .address_space:   generic
      - .name:            C
        .size:            8
        .offset:          32
        .value_kind:      global_buffer
        .value_type:      struct
        .address_space:   generic
      - .name:            A
        .size:            8
        .offset:          40
        .value_kind:      global_buffer
        .value_type:      struct
        .address_space:   generic
      - .name:            B
        .size:            8
        .offset:          48
        .value_kind:      global_buffer
        .value_type:      struct
        .address_space:   generic
      - .name:            alpha
        .size:            4
        .offset:          56
        .value_kind:      by_value
        .value_type:      f32
      - .name:            beta
        .size:            4
        .offset:          60
        .value_kind:      by_value
        .value_type:      f32
      - .name:            strideD0
        .size:            4
        .offset:          64
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideD1
        .size:            4
        .offset:          68
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC0
        .size:            4
        .offset:          72
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC1
        .size:            4
        .offset:          76
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA0
        .size:            4
        .offset:          80
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA1
        .size:            4
        .offset:          84
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB0
        .size:            4
        .offset:          88
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB1
        .size:            4
        .offset:          92
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree0
        .size:            4
        .offset:          96
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree1
        .size:            4
        .offset:          100
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree2
        .size:            4
        .offset:          104
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesSum0
        .size:            4
        .offset:          108
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OrigStaggerUIter
        .size:            4
        .offset:          112
        .value_kind:      by_value
        .value_type:      i32
      - .name:            NumWorkGroups0
        .size:            4
        .offset:          116
        .value_kind:      by_value
        .value_type:      u32
      - .name:            NumWorkGroups1
        .size:            4
        .offset:          120
        .value_kind:      by_value
        .value_type:      u32
      - .name:            NumFullBlocks
        .size:            4
        .offset:          124
        .value_kind:      by_value
        .value_type:      u32
      - .name:            WgmRemainder1
        .size:            4
        .offset:          128
        .value_kind:      by_value
        .value_type:      u32
      - .name:            MagicNumberWgmRemainder1
        .size:            4
        .offset:          132
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OffsetD
        .size:            4
        .offset:          136
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OffsetC
        .size:            4
        .offset:          140
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OffsetA
        .size:            4
        .offset:          144
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OffsetB
        .size:            4
        .offset:          148
        .value_kind:      by_value
        .value_type:      u32
      - .name:            padding
        .size:            4
        .offset:          152
        .value_kind:      by_value
        .value_type:      u32
    .group_segment_fixed_size:   65536
    .kernarg_segment_align:      8
    .kernarg_segment_size:       160
    .max_flat_workgroup_size:    768
    .private_segment_fixed_size: 0
    .sgpr_count:                 100
    .sgpr_spill_count:           0
    .vgpr_count:                 255
    .vgpr_spill_count:           0
    .wavefront_size:             64
...
.end_amdgpu_metadata
hcu_linear_ce_forward_bf16_tn_family_a:

/******************************************/
/* Asm syntax workarounds                 */
/******************************************/
.macro _v_add_co_u32 dst:req, cc:req, src0:req, src1:req, dpp=
   v_add_co_u32 \dst, \cc, \src0, \src1 \dpp
.endm

.macro _v_add_u32 dst:req, src0:req, src1:req, dpp=
   v_add_u32 \dst, \src0, \src1 \dpp
.endm

.macro _v_add_i32 dst:req, src0:req, src1:req, dpp=
   v_add_i32 \dst, \src0, \src1 \dpp
.endm

.macro _v_addc_co_u32 dst:req, ccOut:req, src0:req, ccIn:req, src1:req, dpp=
   v_addc_co_u32 \dst, \ccOut, \src0, \ccIn, \src1 \dpp
.endm

.macro _v_sub_co_u32 dst:req, cc:req, src0:req, src1:req, dpp=
   v_sub_co_u32 \dst, \cc, \src0, \src1 \dpp
.endm

.macro _v_sub_u32 dst:req, src0:req, src1:req, dpp=
   v_sub_u32 \dst, \src0, \src1 \dpp
.endm

.macro _v_sub_i32 dst:req, src0:req, src1:req, dpp=
   v_sub_i32 \dst, \src0, \src1 \dpp
.endm

.macro _v_add_lshl_u32 dst:req, src0:req, src1:req, shiftCnt:req
    v_add_lshl_u32 \dst, \src0, \src1, \shiftCnt
.endm

.macro _v_lshl_add_u32 dst:req, src0:req, src1:req, shiftCnt:req
    v_lshl_add_u32 \dst, \src0, \src1, \shiftCnt
.endm

.macro _v_lshl_or_b32 dst:req, src0:req, shiftCnt:req, src1:req
    v_lshl_or_b32 \dst, \src0, \shiftCnt, \src1
.endm

.macro _v_cmpx_lt_i16 dst, src0, src1=
   v_cmpx_lt_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_lt_i32 dst, src0, src1=
   v_cmpx_lt_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_lt_i64 dst, src0, src1=
   v_cmpx_lt_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_lt_u16 dst, src0, src1=
   v_cmpx_lt_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_lt_u32 dst, src0, src1=
   v_cmpx_lt_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_lt_u64 dst, src0, src1=
   v_cmpx_lt_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_eq_i16 dst, src0, src1=
   v_cmpx_eq_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_eq_i32 dst, src0, src1=
   v_cmpx_eq_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_eq_i64 dst, src0, src1=
   v_cmpx_eq_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_eq_u16 dst, src0, src1=
   v_cmpx_eq_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_eq_u32 dst, src0, src1=
   v_cmpx_eq_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_eq_u64 dst, src0, src1=
   v_cmpx_eq_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_le_i16 dst, src0, src1=
   v_cmpx_le_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_le_i32 dst, src0, src1=
   v_cmpx_le_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_le_i64 dst, src0, src1=
   v_cmpx_le_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_le_u16 dst, src0, src1=
   v_cmpx_le_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_le_u32 dst, src0, src1=
   v_cmpx_le_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_le_u64 dst, src0, src1=
   v_cmpx_le_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_gt_i16 dst, src0, src1=
   v_cmpx_gt_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_gt_i32 dst, src0, src1=
   v_cmpx_gt_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_gt_i64 dst, src0, src1=
   v_cmpx_gt_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_gt_u16 dst, src0, src1=
   v_cmpx_gt_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_gt_u32 dst, src0, src1=
   v_cmpx_gt_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_gt_u64 dst, src0, src1=
   v_cmpx_gt_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_ne_i16 dst, src0, src1=
   v_cmpx_ne_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_ne_i32 dst, src0, src1=
   v_cmpx_ne_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_ne_i64 dst, src0, src1=
   v_cmpx_ne_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_ne_u16 dst, src0, src1=
   v_cmpx_ne_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_ne_u32 dst, src0, src1=
   v_cmpx_ne_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_ne_u64 dst, src0, src1=
   v_cmpx_ne_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_lg_i16 dst, src0, src1=
   v_cmpx_lg_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_lg_i32 dst, src0, src1=
   v_cmpx_lg_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_lg_i64 dst, src0, src1=
   v_cmpx_lg_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_lg_u16 dst, src0, src1=
   v_cmpx_lg_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_lg_u32 dst, src0, src1=
   v_cmpx_lg_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_lg_u64 dst, src0, src1=
   v_cmpx_lg_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_ge_i16 dst, src0, src1=
   v_cmpx_ge_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_ge_i32 dst, src0, src1=
   v_cmpx_ge_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_ge_i64 dst, src0, src1=
   v_cmpx_ge_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_ge_u16 dst, src0, src1=
   v_cmpx_ge_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_ge_u32 dst, src0, src1=
   v_cmpx_ge_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_ge_u64 dst, src0, src1=
   v_cmpx_ge_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_o_i16 dst, src0, src1=
   v_cmpx_o_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_o_i32 dst, src0, src1=
   v_cmpx_o_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_o_i64 dst, src0, src1=
   v_cmpx_o_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_o_u16 dst, src0, src1=
   v_cmpx_o_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_o_u32 dst, src0, src1=
   v_cmpx_o_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_o_u64 dst, src0, src1=
   v_cmpx_o_u64 \dst, \src0, \src1
.endm

.macro _v_cmpx_u_i16 dst, src0, src1=
   v_cmpx_u_i16 \dst, \src0, \src1
.endm

.macro _v_cmpx_u_i32 dst, src0, src1=
   v_cmpx_u_i32 \dst, \src0, \src1
.endm

.macro _v_cmpx_u_i64 dst, src0, src1=
   v_cmpx_u_i64 \dst, \src0, \src1
.endm

.macro _v_cmpx_u_u16 dst, src0, src1=
   v_cmpx_u_u16 \dst, \src0, \src1
.endm

.macro _v_cmpx_u_u32 dst, src0, src1=
   v_cmpx_u_u32 \dst, \src0, \src1
.endm

.macro _v_cmpx_u_u64 dst, src0, src1=
   v_cmpx_u_u64 \dst, \src0, \src1
.endm
.macro _v_mac_f32 c:req, a:req, b:req
    v_mac_f32 \c, \a, \b
.endmacro

/******************************************/
/* Magic div and mod functions            */
/******************************************/
.macro V_MAGIC_DIV dstIdx:req, dividend:req, magicNumber:req, magicShift:req, magicA:req
    v_mul_hi_u32 v[\dstIdx+1], \dividend, \magicNumber
    v_mul_lo_u32 v[\dstIdx+0], \dividend, \magicA
    _v_add_u32 v[\dstIdx+0], v[\dstIdx+0], v[\dstIdx+1]
    v_lshrrev_b32 v[\dstIdx+0], \magicShift, v[\dstIdx+0]
.endm

/******************************************/
/* VGPR Assignments                       */
/******************************************/
/* ValuC range: [0-128), ,  */
.set vgprValuC, 0
/* ValuA/B   Xn=PLR buffer idx,  In=InnerUnroll idx */
.set vgprValuA_X0_I0, 128
.set vgprValuB_X0_I0, 192
.set vgprValuB_X1_I0, 208
.set vgprGlobalReadOffsetA, 224
.set vgprGlobalReadOffsetB, 232
.set vgprLocalWriteAddrA, 240
.set vgprLocalWriteAddrB, 241
.set vgprLocalReadAddrA, 242
.set vgprLocalReadAddrA_ori, 243
.set vgprLocalReadAddrASwap, 244
.set vgprLocalReadAddrASwap_ori, 245
.set vgprSerial,246
.set vgprSerial_forLdsWrapOptA, 247
.set vgprG2LA, 128
.set vgprG2LB, 160
.set vgprLocalReadAddrB, 248
.set vgprLocalReadAddrASwap1, 249
.set vgprGlobalReadOffsetB1, 250
.set vgprLocalReadAddrA_forLdsWrapTailLoop, 247
/* Num VGPR=218 */
/* Num AccVGPR=0 */

/******************************************/
/* SGPR Assignments                       */
/******************************************/
.set sgprKernArgAddress, 0
.set sgprWorkGroup0, 2
.set sgprWorkGroup1, 3
.set sgprWorkGroup2, 4
.set sgprLoopCounterL, 5
.set sgprOrigLoopCounter, 6
.set sgprSrdA, 8
.set sgprSrdB, 12
.set sgprSrdD, 16
.set sgprSrdC, 20
.set sgprTensor2dSizeA, 24
.set sgprTensor2dSizeB, 26
.set sgprAddressD, 28
.set sgprAddressC, 30
.set sgprAddressA, 32
.set sgprAddressB, 34
.set sgprAlpha, 36
.set sgprBeta, 37
.set sgprStridesD, 38
.set sgprStridesC, 40
.set sgprStridesA, 42
.set sgprStridesB, 44
.set sgprSizesFree, 46
.set sgprSizesSum, 49
.set sgprOrigStaggerUIter, 50
.set sgprNumWorkGroups0, 51
.set sgprNumWorkGroups1, 52
.set sgprNumFullBlocks, 53
.set sgprWgmRemainder1, 54
.set sgprMagicNumberWgmRemainder1, 55
.set sgprOffsetD, 56
.set sgprOffsetC, 57
.set sgprOffsetA, 58
.set sgprOffsetB, 59
.set sgprShadowLimitA, 56
.set sgprShadowLimitB, 58
.set sgprGlobalReadIncsA, 7
.set sgprGlobalReadIncsB, 50
.set sgprLocalWriteAddrA, 60
.set sgprLocalWriteAddrB, 61
.set sgprMask, 72
.set sgprWaveiD, 73
.set sgprStrideSwizzle, 74
.set sgprStructNum, 75
.set sgprStructBit, 76
.set sgprStructBit1, 77
.set sgprStrideStruct, 78
.set sgprOffsetStruct, 79
.set sgprLocalWriteAddrA_ori, 80
.set sgprLoopforPf, 81
.set sgprShadowLimitB_forTailLoop, 82
.set sgprShadowLimitA_forTailLoop, 88
.set sgprSrdA_forTailLoop, 84

/* max SGPR=100 */

/* Size Assignments */
.set sgprSizeI, sgprSizesFree+0
.set sgprSizeJ, sgprSizesFree+1
.set sgprSizeK, sgprSizesFree+2
.set sgprSizeL, sgprSizesSum+0

/* Stride Assignments */
.set constStrideD0I, 1
.set sgprStrideD1J, sgprStridesD+0
.set sgprStrideDK, sgprStridesD+1
.set constStrideC0I, 1
.set sgprStrideC1J, sgprStridesC+0
.set sgprStrideCK, sgprStridesC+1
.set constStrideAL, 1
.set sgprStrideA0I, sgprStridesA+0
.set sgprStrideAK, sgprStridesA+1
.set constStrideBL, 1
.set sgprStrideB1J, sgprStridesB+0
.set sgprStrideBK, sgprStridesB+1
.set sgprStrideoffC, sgprSrdA
.set sgprStrideoffD, sgprAddressD
.set sgprEdgeCheck, sgprAddressB

.set MT0, 256
.set MT1, 256
.set DepthU, 64
.set GSU, 1
.set BpeA, 2
.set BpeALog2, 1
.set BpeB, 2
.set BpeBLog2, 1
/* Number of elements to shift-left SRD */
.set SrdShiftLeftA, 8
.set SrdShiftLeftB, 8
/* 4GB limit - set offsets to -1 to exceed this and clamp */
.set BufferLimit, 0xfffffffe
.set BufferOOB, 0xfffffffe

/******************************************/
/* Bits 127:96 of SRD.                    */
/* hex: 0x00020000                        */
/* dst_sel_x (3b): 0                      */
/* dst_sel_y (3b): 0                      */
/* dst_sel_z (3b): 0                      */
/* dst_sel_w (3b): 0                      */
/* num_format (3b): 0                     */
/* data_format (4b): 4                    */
/* user_vm_enable (1b): 0                 */
/* user_vm_mode (1b): 0                   */
/* index_stride (2b): 0                   */
/* add_tid_enable (1b): 0                 */
/* _unusedA (3b): 0                       */
/* nv (1b): 0                             */
/* _unusedB (2b): 0                       */
/* type (2b): 0                           */
/******************************************/
.set Srd127_96, 0x00020000

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr:req vgprOffsetL:req vgprOffset0I:req vgprTmp:req
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideA0I], v[\vgprOffset0I] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate K lower
_v_add_u32 v[\vgprAddr+0], 0x8, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr:req vgprOffsetL:req vgprOffset1J:req vgprTmp:req
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideB1J], v[\vgprOffset1J] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate K lower
_v_add_u32 v[\vgprAddr+0], 0x8, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm

.macro GLOBAL_STRUCT_OFFSET_B vgprAddr:req vgprOffset:req vgprIndex:req //
v_mul_lo_u32 v[\vgprAddr+0], s[sgprOffsetStruct], v[\vgprIndex] //
_v_add_u32 v[\vgprAddr+0], v[\vgprAddr+0], v[\vgprOffset] //
_v_add_u32 v[\vgprAddr+0], 0x8, v[\vgprAddr+0]     //
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  //
.endm
.macro GLOBAL_STRUCT_INDEX_B vgprAddr:req vgprIndex:req //
v_mul_lo_u32 v[\vgprAddr+0], s[sgprStrideStruct], v[\vgprIndex] //
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B_TailLoop vgprAddr:req vgprOffsetL:req vgprOffset1J:req vgprTmp:req
v_mul_lo_u32 v[\vgprTmp+0], s[sgprStrideB1J], v[\vgprOffset1J] // mul d1 lower
_v_add_co_u32 v[\vgprAddr+0], vcc, v[\vgprOffsetL], v[\vgprTmp+0] // accumulate K lower
_v_add_u32 v[\vgprAddr+0], 0x8, v[\vgprAddr+0]     // add prepad for pointer shift
v_lshlrev_b32 v[\vgprAddr+0], 0x1, v[\vgprAddr+0]  // offset *= bytes/element
.endm


/******************************************/
/* Dynamic Scalar Divide: vQuotient=vDividend/vDivisor; vRemainder=vDividend%vDivisor; */
/******************************************/
.macro DYNAMIC_VECTOR_DIVIDE vQuotient vRemainder vDividend vDivisor vTmp0 vTmp1 sTmp
v_cvt_f32_u32 v[\vQuotient], v[\vDivisor]          //
v_rcp_f32 v[\vQuotient], v[\vQuotient]             //
v_mul_f32 v[\vQuotient], 0x4f800000, v[\vQuotient] //
v_cvt_u32_f32 v[\vQuotient], v[\vQuotient]         //
v_mul_lo_u32 v[\vRemainder], v[\vDivisor], v[\vQuotient] //
v_mul_hi_u32 v[\vTmp0], v[\vDivisor], v[\vQuotient] //
_v_sub_co_u32 v[\vTmp1], vcc, 0x0, v[\vRemainder]  //
v_cmp_ne_i32 s[\sTmp:\sTmp+1], 0x0, v[\vTmp0]      //
v_cndmask_b32 v[\vRemainder], v[\vTmp1], v[\vRemainder], s[\sTmp:\sTmp+1] //
v_mul_hi_u32 v[\vRemainder], v[\vRemainder], v[\vQuotient] //
_v_sub_co_u32 v[\vTmp0], vcc, v[\vQuotient], v[\vRemainder] //
_v_add_co_u32 v[\vQuotient], vcc, v[\vQuotient], v[\vRemainder] //
v_cndmask_b32 v[\vQuotient], v[\vQuotient], v[\vTmp0], s[\sTmp:\sTmp+1] //
v_mul_hi_u32 v[\vQuotient], v[\vQuotient], v[\vDividend] //
v_mul_lo_u32 v[\vRemainder], v[\vQuotient], v[\vDivisor] //
_v_sub_co_u32 v[\vTmp0], vcc, v[\vDividend], v[\vRemainder] //
v_cmp_ge_u32 s[\sTmp:\sTmp+1], v[\vDividend], v[\vRemainder] //
_v_add_co_u32 v[\vRemainder], vcc, 0x1, v[\vQuotient] //
_v_add_co_u32 v[\vTmp1], vcc, -1, v[\vQuotient]    //
v_cmp_le_u32 vcc, v[\vDivisor], v[\vTmp0]          //
s_and_b64 vcc, s[\sTmp:\sTmp+1], vcc               //
v_cndmask_b32 v[\vQuotient], v[\vQuotient], v[\vRemainder], vcc //
v_cndmask_b32 v[\vQuotient], v[\vTmp1], v[\vQuotient], s[\sTmp:\sTmp+1] //
v_cmp_ne_i32 vcc, 0x0, v[\vDivisor]                //
v_cndmask_b32 v[\vQuotient], -1, v[\vQuotient], vcc // final result
v_mul_lo_u32 v[\vRemainder], v[\vQuotient], v[\vDivisor] //
_v_sub_co_u32 v[\vRemainder], vcc, v[\vDividend], v[\vRemainder] // final result
.endm

/******************************************/
/* 16x8 thread-tile                       */
/******************************************/
.macro MAC_16x8_X0
// Component.MAC.FMA_F16_HPA_MAD_MIX
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0:vgprValuC+3], v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+0:vgprValuC+3]
s_setprio 1 // Raise priority while processing macs
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4:vgprValuC+7], v[vgprValuA_X0_I0+2:vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+4:vgprValuC+7]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8:vgprValuC+11], v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+8:vgprValuC+11]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12:vgprValuC+15], v[vgprValuA_X0_I0+6:vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+12:vgprValuC+15]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16:vgprValuC+19], v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+16:vgprValuC+19]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20:vgprValuC+23], v[vgprValuA_X0_I0+10:vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+20:vgprValuC+23]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24:vgprValuC+27], v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+24:vgprValuC+27]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28:vgprValuC+31], v[vgprValuA_X0_I0+14:vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprValuC+28:vgprValuC+31]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32:vgprValuC+35], v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+32:vgprValuC+35]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36:vgprValuC+39], v[vgprValuA_X0_I0+2:vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+36:vgprValuC+39]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40:vgprValuC+43], v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+40:vgprValuC+43]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44:vgprValuC+47], v[vgprValuA_X0_I0+6:vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+44:vgprValuC+47]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48:vgprValuC+51], v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+48:vgprValuC+51]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52:vgprValuC+55], v[vgprValuA_X0_I0+10:vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+52:vgprValuC+55]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56:vgprValuC+59], v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+56:vgprValuC+59]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60:vgprValuC+63], v[vgprValuA_X0_I0+14:vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprValuC+60:vgprValuC+63]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64:vgprValuC+67], v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+64:vgprValuC+67]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68:vgprValuC+71], v[vgprValuA_X0_I0+2:vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+68:vgprValuC+71]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72:vgprValuC+75], v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+72:vgprValuC+75]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76:vgprValuC+79], v[vgprValuA_X0_I0+6:vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+76:vgprValuC+79]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80:vgprValuC+83], v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+80:vgprValuC+83]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84:vgprValuC+87], v[vgprValuA_X0_I0+10:vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+84:vgprValuC+87]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88:vgprValuC+91], v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+88:vgprValuC+91]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92:vgprValuC+95], v[vgprValuA_X0_I0+14:vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprValuC+92:vgprValuC+95]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96:vgprValuC+99], v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+96:vgprValuC+99]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100:vgprValuC+103], v[vgprValuA_X0_I0+2:vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+100:vgprValuC+103]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104:vgprValuC+107], v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+104:vgprValuC+107]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108:vgprValuC+111], v[vgprValuA_X0_I0+6:vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+108:vgprValuC+111]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112:vgprValuC+115], v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+112:vgprValuC+115]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116:vgprValuC+119], v[vgprValuA_X0_I0+10:vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+116:vgprValuC+119]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120:vgprValuC+123], v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+120:vgprValuC+123]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124:vgprValuC+127], v[vgprValuA_X0_I0+14:vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprValuC+124:vgprValuC+127]
s_setprio 0 // Reset priority after macs
.endm


.macro MAC_32x4x2_X0_I0
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
s_setprio 1 // Raise priority while processing macs
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X0_I0+0: vgprValuB_X0_I0+1], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X0_I0+8: vgprValuB_X0_I0+9], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X0_I0+2: vgprValuB_X0_I0+3], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X0_I0+10: vgprValuB_X0_I0+11], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
s_setprio 0 // Reset priority after macs
.endm

.macro MAC_32x4x2_X0_I1
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
s_setprio 1 // Raise priority while processing macs
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X0_I0+4: vgprValuB_X0_I0+5], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X0_I0+12: vgprValuB_X0_I0+13], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X0_I0+6: vgprValuB_X0_I0+7], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X0_I0+14: vgprValuB_X0_I0+15], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
s_setprio 0 // Reset priority after macs
.endm
.macro MAC_32x4x2_X1_I0
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
s_setprio 1 // Raise priority while processing macs
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X1_I0+0: vgprValuB_X1_I0+1], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X1_I0+8: vgprValuB_X1_I0+9], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X1_I0+2: vgprValuB_X1_I0+3], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X1_I0+10: vgprValuB_X1_I0+11], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
s_setprio 0 // Reset priority after macs
.endm
.macro MAC_32x4x2_X1_I1
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
s_setprio 1 // Raise priority while processing macs
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X1_I0+4: vgprValuB_X1_I0+5], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+0: vgprValuA_X0_I0+1], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+4: vgprValuA_X0_I0+5], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+8: vgprValuA_X0_I0+9], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+12: vgprValuA_X0_I0+13], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+16: vgprValuA_X0_I0+17], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+20: vgprValuA_X0_I0+21], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+24: vgprValuA_X0_I0+25], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+28: vgprValuA_X0_I0+29], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+32: vgprValuA_X0_I0+33], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+36: vgprValuA_X0_I0+37], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+40: vgprValuA_X0_I0+41], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+44: vgprValuA_X0_I0+45], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+48: vgprValuA_X0_I0+49], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+52: vgprValuA_X0_I0+53], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+56: vgprValuA_X0_I0+57], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+60: vgprValuA_X0_I0+61], v[vgprValuB_X1_I0+12: vgprValuB_X1_I0+13], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+0: vgprValuC+0+1: vgprValuC+0+2: vgprValuC+0+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+4: vgprValuC+4+1: vgprValuC+4+2: vgprValuC+4+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+8: vgprValuC+8+1: vgprValuC+8+2: vgprValuC+8+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+12: vgprValuC+12+1: vgprValuC+12+2: vgprValuC+12+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+16: vgprValuC+16+1: vgprValuC+16+2: vgprValuC+16+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+20: vgprValuC+20+1: vgprValuC+20+2: vgprValuC+20+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+24: vgprValuC+24+1: vgprValuC+24+2: vgprValuC+24+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+28: vgprValuC+28+1: vgprValuC+28+2: vgprValuC+28+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+32: vgprValuC+32+1: vgprValuC+32+2: vgprValuC+32+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+36: vgprValuC+36+1: vgprValuC+36+2: vgprValuC+36+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+40: vgprValuC+40+1: vgprValuC+40+2: vgprValuC+40+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+44: vgprValuC+44+1: vgprValuC+44+2: vgprValuC+44+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+48: vgprValuC+48+1: vgprValuC+48+2: vgprValuC+48+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+52: vgprValuC+52+1: vgprValuC+52+2: vgprValuC+52+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+56: vgprValuC+56+1: vgprValuC+56+2: vgprValuC+56+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X1_I0+6: vgprValuB_X1_I0+7], v[vgprValuC+60: vgprValuC+60+1: vgprValuC+60+2: vgprValuC+60+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3], v[vgprValuA_X0_I0+2: vgprValuA_X0_I0+3], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+64: vgprValuC+64+1: vgprValuC+64+2: vgprValuC+64+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3], v[vgprValuA_X0_I0+6: vgprValuA_X0_I0+7], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+68: vgprValuC+68+1: vgprValuC+68+2: vgprValuC+68+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3], v[vgprValuA_X0_I0+10: vgprValuA_X0_I0+11], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+72: vgprValuC+72+1: vgprValuC+72+2: vgprValuC+72+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3], v[vgprValuA_X0_I0+14: vgprValuA_X0_I0+15], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+76: vgprValuC+76+1: vgprValuC+76+2: vgprValuC+76+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3], v[vgprValuA_X0_I0+18: vgprValuA_X0_I0+19], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+80: vgprValuC+80+1: vgprValuC+80+2: vgprValuC+80+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3], v[vgprValuA_X0_I0+22: vgprValuA_X0_I0+23], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+84: vgprValuC+84+1: vgprValuC+84+2: vgprValuC+84+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3], v[vgprValuA_X0_I0+26: vgprValuA_X0_I0+27], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+88: vgprValuC+88+1: vgprValuC+88+2: vgprValuC+88+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3], v[vgprValuA_X0_I0+30: vgprValuA_X0_I0+31], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+92: vgprValuC+92+1: vgprValuC+92+2: vgprValuC+92+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3], v[vgprValuA_X0_I0+34: vgprValuA_X0_I0+35], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+96: vgprValuC+96+1: vgprValuC+96+2: vgprValuC+96+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3], v[vgprValuA_X0_I0+38: vgprValuA_X0_I0+39], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+100: vgprValuC+100+1: vgprValuC+100+2: vgprValuC+100+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3], v[vgprValuA_X0_I0+42: vgprValuA_X0_I0+43], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+104: vgprValuC+104+1: vgprValuC+104+2: vgprValuC+104+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3], v[vgprValuA_X0_I0+46: vgprValuA_X0_I0+47], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+108: vgprValuC+108+1: vgprValuC+108+2: vgprValuC+108+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3], v[vgprValuA_X0_I0+50: vgprValuA_X0_I0+51], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+112: vgprValuC+112+1: vgprValuC+112+2: vgprValuC+112+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3], v[vgprValuA_X0_I0+54: vgprValuA_X0_I0+55], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+116: vgprValuC+116+1: vgprValuC+116+2: vgprValuC+116+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3], v[vgprValuA_X0_I0+58: vgprValuA_X0_I0+59], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+120: vgprValuC+120+1: vgprValuC+120+2: vgprValuC+120+3]
v_mmac_f32_16x16x16_bf16 v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3], v[vgprValuA_X0_I0+62: vgprValuA_X0_I0+63], v[vgprValuB_X1_I0+14: vgprValuB_X1_I0+15], v[vgprValuC+124: vgprValuC+124+1: vgprValuC+124+2: vgprValuC+124+3]
s_setprio 0 // Reset priority after macs
.endm


.macro FP32_TO_BF16 vgprValue:req
	v_cmp_u_f32 s[80:81], v[\vgprValue], v[\vgprValue] // check Nan
	v_bfe_u32 v249, v[\vgprValue], 16, 1               // Non-Nan case: store lsb of bf16
	v_add3_u32 v249, v[\vgprValue], v249, v251           // Non-Nan case: add lsb and the increment for rounding
	v_cndmask_b32 v[\vgprValue], v249, v250, s[80:81]   //
	v_lshrrev_b32 v[\vgprValue], 16, v[\vgprValue]   // convert C to bf16
.endm


/******************************************/
/* Allocate Resources                     */
/******************************************/

s_mov_b32 m0, 0x10000                              // LDS clamp at 65536 bytes
v_mov_b32 v[vgprSerial], v0                        // thread serial id

/* Load Kernel Args */
s_load_dwordx16 s[24:39], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x8 //
s_load_dwordx16 s[40:55], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x48 //
s_load_dwordx4 s[56:59], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x88 //
s_waitcnt lgkmcnt(0)                               // wait for 152 bytes of kern args
s_lshl_b32 s[sgprOffsetD], s[sgprOffsetD], 0x1     // elements offset to bytes offset
s_add_u32 s[sgprAddressD+0], s[sgprAddressD+0], s[sgprOffsetD] // add offset to buffer address
s_addc_u32 s[sgprAddressD+1], s[sgprAddressD+1], 0 // add offset to buffer address
s_lshl_b32 s[sgprOffsetC], s[sgprOffsetC], 0x1     // elements offset to bytes offset
s_add_u32 s[sgprAddressC+0], s[sgprAddressC+0], s[sgprOffsetC] // add offset to buffer address
s_addc_u32 s[sgprAddressC+1], s[sgprAddressC+1], 0 // add offset to buffer address
s_lshl_b32 s[sgprOffsetA], s[sgprOffsetA], 0x1     // elements offset to bytes offset
s_add_u32 s[sgprAddressA+0], s[sgprAddressA+0], s[sgprOffsetA] // add offset to buffer address
s_addc_u32 s[sgprAddressA+1], s[sgprAddressA+1], 0 // add offset to buffer address
s_lshl_b32 s[sgprOffsetB], s[sgprOffsetB], 0x1     // elements offset to bytes offset
s_add_u32 s[sgprAddressB+0], s[sgprAddressB+0], s[sgprOffsetB] // add offset to buffer address
s_addc_u32 s[sgprAddressB+1], s[sgprAddressB+1], 0 // add offset to buffer address

.set OffsetD, UNDEF
.set OffsetC, UNDEF
.set OffsetA, UNDEF
.set OffsetB, UNDEF

/* Short circuit condition if Alpha == 0, then sumDims=0 */
v_cmp_eq_f32 vcc, s[sgprAlpha], 0.0                // Alpha == 0.0f ?
s_cbranch_vccz label_AlphaNonZero                  // branch if alpha != 0
s_mov_b32 s[sgprSizesSum+0], 0x0                   // Set summation dim=0 if Alpha == 0
label_AlphaNonZero:

v_lshrrev_b32 v[vgprValuA_X0_I0], 6, v[vgprSerial]
v_readfirstlane_b32 s[sgprWaveiD], v[vgprValuA_X0_I0]
s_mov_b32 s[sgprMask], 0x10000

/******************************************/
/* Local Read Addresses                   */
/******************************************/


/* local read addresses: tile assignments a/b */

v_and_b32 v0, 63, v[vgprSerial]                    // v0 = v[vgprSerial] % 64
v_lshrrev_b32 v4, 6, v[vgprSerial]                 // v4 = v[vgprSerial] / 64
v_and_b32 v5, 15, v0                               // v5 = v0 % 15
v_lshrrev_b32 v3, 4, v0                            // v3 = v0 / 16


/* local read addresses: final offsets a */

v_and_b32 v6, 15, v0
v_lshrrev_b32 v7, 4,v0

v_and_b32 v8, 3, v6
v_lshrrev_b32 v9, 2, v6

v_lshlrev_b32 v11, 4, v8
v_lshlrev_b32 v8, 9, v8
v_lshlrev_b32 v9, 6, v9

v_lshlrev_b32 v7, 3, v7

v_add_co_u32 v7, vcc, v7, v8
v_add_co_u32 v7, vcc, v7, v9
v_add_co_u32 v7, vcc, v7, v11

v_lshlrev_b32 v[vgprLocalReadAddrA], 1, v7
v_sub_co_u32  v[vgprLocalReadAddrA_forLdsWrapTailLoop], vcc, v7, v11
v_lshlrev_b32 v[vgprLocalReadAddrA_forLdsWrapTailLoop], 1, v[vgprLocalReadAddrA_forLdsWrapTailLoop]

v_cmp_eq_u32 s[64:65], v0, 47
v_cmp_eq_u32 s[66:67], v0, 63
s_or_b64 s[64:65], s[64:65], s[66:67]

v_mov_b32 v8, 0x200
v_cndmask_b32 v8, 0, v8, s[64:65]

v_sub_i32 v9, v7, v8

v_lshlrev_b32 v[vgprLocalReadAddrASwap], 1, v9


v_cmp_eq_u32 s[64:65], v0, 45
v_cmp_eq_u32 s[66:67], v0, 61
s_or_b64 s[68:69], s[64:65], s[66:67]

v_and_b32 v6, 15, v0
v_cmp_eq_u32 s[64:65], v6, 15
v_cmp_eq_u32 s[66:67], v6, 14
s_or_b64 s[64:65], s[64:65], s[66:67]

s_or_b64 s[64:65], s[68:69], s[64:65]

v_mov_b32 v8, 0x200

v_cndmask_b32 v8, 0, v8, s[64:65]

v_sub_i32 v7, v7, v8

v_lshlrev_b32 v[vgprLocalReadAddrASwap1], 1, v7

/* local read addresses: final offsets b */


/* local read addresses: declare addresses a */

/* N/A */


/* local read addresses: declare addresses b */

v_mov_b32 v[vgprLocalReadAddrA_ori], v[vgprLocalReadAddrA]
v_mov_b32 v[vgprLocalReadAddrASwap_ori], v[vgprLocalReadAddrASwap]

/******************************************/
/* Begin setupNewTile, isPap=False         */
/******************************************/


/* global read addresses: work-group */
/* global read addresses: work-group */
s_mov_b32 s65, 0x10000001L                         // magic number for WGM==8
s_mul_hi_u32 s63, s[sgprWorkGroup1], s65           // s_magic mul
s_mul_i32 s62, s[sgprWorkGroup1], s65              // s_magic mul
s_lshr_b64 s[62:63], s[62:63], 31                  // sMagicDiv
s_mul_i32 s63, s62, 8                              // quotient * non-magic divisor
s_sub_u32 s63, s[sgprWorkGroup1], s63              // WorkGroup1=remainder
s_mul_i32 s63, s63, s[sgprNumWorkGroups0]          // (wg1 % WGM)*nwg0
s_add_u32 s63, s63, s[sgprWorkGroup0]              // wgSerial = wg0 + (wg1 % WGM)*nwg0
s_cmp_ge_u32 s62, s[sgprNumFullBlocks]             // blockId >= numFullBlocks ?
s_cmov_b32 s65, s[sgprMagicNumberWgmRemainder1]    //
s_cselect_b32 s64, s[sgprWgmRemainder1], 8         //
s_mul_hi_u32 s3, s63, s65                          // s_magic mul
s_mul_i32 s2, s63, s65                             // s_magic mul
s_lshr_b64 s[2:3], s[2:3], 31                      // sMagicDiv
s_mul_i32 s[sgprWorkGroup1], s[sgprWorkGroup0], s64 // quotient * non-magic divisor
s_sub_u32 s[sgprWorkGroup1], s63, s[sgprWorkGroup1] // WorkGroup1=remainder
s_mul_i32 s62, s62, 8                              // blockId * WGM
s_add_u32 s[sgprWorkGroup1], s[sgprWorkGroup1], s62 // wg1 += blockId * WGM

/* graWorkGroup mapping */

/* global read addresses: tile offset assignment a */

/* LVCA = 4 */
/* v0 = (local)groA-tile = serial/LVCA (note (wgA*MTA) will be added to SRD) */
/* v1 = groA-unroll = serial%LVCA */
v_and_b32 v6, 255, v[vgprSerial]
v_lshrrev_b32 v0, 6, v6                  // v0 = v[vgprSerial] / 64
v_and_b32 v1, 63, v6                     // v1 = v[vgprSerial] % 64
/* gro-unroll *= glvw */

v_and_b32 v2, 7, v1
v_lshrrev_b32 v3, 3, v1

v_lshlrev_b32 v1, 3, v2

v_lshlrev_b32 v3, 2, v3
v_add_co_u32 v0, vcc, v0, v3

/* global read addresses: tile offset assignment b */

/* LVCB = 4 */
/* v2 = (local)groB-tile = serial/LVCB (note (wgB*MTB) will be added to SRD) */
/* v3 = groB-unroll = serial%LVCB */

v_and_b32 v4, 63, v[vgprSerial]
v_lshrrev_b32 v5, 6, v[vgprSerial]

v_lshrrev_b32 v3, 4, v4                  // v2 = v[vgprSerial] / 16
v_and_b32 v2, 15, v4                     // v3 = v[vgprSerial] % 16
/* gro-unroll *= glvw */
v_lshlrev_b32 v3, 0x3, v3                          // v3 = v3 * 8

v_lshlrev_b32 v5, 5, v5
v_add_co_u32 v2, vcc, v2, v5

/* global read addresses: unroll assignment a */

/* v1 */


/* global read addresses: unroll assignment b */

/* v3 */


/* global read addresses: other free assignments */

/* s[sgprWorkGroup2] */


/* global read addresses: tile offsets a */

v_mov_b32 v4, v0                                   // groA0I_0
_v_add_co_u32 v5, vcc, 32, v4                     // groA0I_1 += LSPA
_v_add_co_u32 v11, vcc, 32, v5                     // groA0I_1 += LSPA
_v_add_co_u32 v12, vcc, 32, v11                     // groA0I_1 += LSPA
_v_add_co_u32 v13, vcc, 32, v12                     // groA0I_1 += LSPA
_v_add_co_u32 v14, vcc, 32, v13                     // groA0I_1 += LSPA
_v_add_co_u32 v15, vcc, 32, v14                     // groA0I_1 += LSPA
_v_add_co_u32 v16, vcc, 32, v15                     // groA0I_1 += LSPA

/* global read addresses: tile offsets b */

v_mov_b32 v6, v2                                  // groB1J_0
_v_add_co_u32 v7, vcc, 16, v6                     // groB1J_1 += LSPB

/* global read addresses: unroll offsets a */

v_mov_b32 v8, v1                                   // groAL_0


/* global read addresses: unroll offsets b */

v_mov_b32 v9, v3                                  // groBL_0
_v_add_co_u32 v18, vcc, 32, v9                    // groBL_1 + LSCB


/* global read addresses: final offsets a */

GLOBAL_OFFSET_A vgprGlobalReadOffsetA+0,  8,  4, 10 // gROA_0_0_0_0
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+1,  8,  5, 10 // gROA_0_0_1_0
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+2,  8,  11, 10 // gROA_0_0_0_0
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+3,  8,  12, 10 // gROA_0_0_1_0
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+4,  8,  13, 10 // gROA_0_0_0_0
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+5,  8,  14, 10 // gROA_0_0_1_0
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+6,  8,  15, 10 // gROA_0_0_0_0
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+7,  8,  16, 10 // gROA_0_0_1_0

GLOBAL_OFFSET_B_TailLoop vgprGlobalReadOffsetB1+0,  9,  6, 10 // gROB_0_0_0_0
GLOBAL_OFFSET_B_TailLoop vgprGlobalReadOffsetB1+1,  18, 6, 10 // gROB_0_0_1_0
GLOBAL_OFFSET_B_TailLoop vgprGlobalReadOffsetB1+2,  9,  7, 10 // gROB_0_0_0_0
GLOBAL_OFFSET_B_TailLoop vgprGlobalReadOffsetB1+3,  18, 7, 10 // gROB_0_0_1_0


/* global read addresses: final offsets b */
// s_mov_b32 s[sgprStructBit], 12
// s_lshl_b32 s[sgprStrideSwizzle], 0x1, s[sgprStructBit]

s_mov_b32 s[sgprStructBit], 0
s_cmp_ge_u32 s[sgprStrideB1J], 256
s_cmov_b32 s[sgprStructBit], 8

s_cmp_ge_u32 s[sgprStrideB1J], 512
s_cmov_b32 s[sgprStructBit], 9

s_cmp_ge_u32 s[sgprStrideB1J], 1024
s_cmov_b32 s[sgprStructBit], 10

s_cmp_ge_u32 s[sgprStrideB1J], 2048
s_cmov_b32 s[sgprStructBit], 11

s_cmp_ge_u32 s[sgprStrideB1J], 4096
s_cmov_b32 s[sgprStructBit], 12

s_lshl_b32 s[sgprStrideSwizzle], 0x1, s[sgprStructBit]

s_cmp_lt_u32 s[sgprStrideB1J], s[sgprStrideSwizzle]                 // LINE7491
s_cbranch_scc1 Skip_supply_offset1B                //
s_lshr_b32 s[sgprStrideStruct], s[sgprStrideB1J], s[sgprStructBit] //
s_lshl_b32 s[sgprOffsetStruct], s[sgprStrideStruct], s[sgprStructBit] //
s_sub_u32 s[sgprOffsetStruct], s[sgprStrideB1J], s[sgprOffsetStruct] //
s_branch Skip_supply_offset2B                      //
Skip_supply_offset1B:                              //
s_mov_b32 s[sgprStrideStruct], 1                   //
s_mov_b32 s[sgprOffsetStruct], 0
Skip_supply_offset2B:                              //
GLOBAL_STRUCT_INDEX_B vgprGlobalReadOffsetB+0, 6
GLOBAL_STRUCT_OFFSET_B vgprGlobalReadOffsetB+1, 9, 6
GLOBAL_STRUCT_INDEX_B vgprGlobalReadOffsetB+2, 6
GLOBAL_STRUCT_OFFSET_B vgprGlobalReadOffsetB+3, 18, 6
GLOBAL_STRUCT_INDEX_B vgprGlobalReadOffsetB+4, 7
GLOBAL_STRUCT_OFFSET_B vgprGlobalReadOffsetB+5, 9, 7
GLOBAL_STRUCT_INDEX_B vgprGlobalReadOffsetB+6, 7
GLOBAL_STRUCT_OFFSET_B vgprGlobalReadOffsetB+7, 18, 7


//GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0,  9,  6, 10 // gROB_0_0_0_0
//GLOBAL_OFFSET_B vgprGlobalReadOffsetB+1,  18,  6, 10 // gROB_0_0_1_0
//GLOBAL_OFFSET_B vgprGlobalReadOffsetB+2,  9,  7, 10 // gROB_0_0_0_0
//GLOBAL_OFFSET_B vgprGlobalReadOffsetB+3,  18,  7, 10 // gROB_0_0_1_0

/***********************forTailLoop*************************/
s_mul_hi_u32 s65, s[sgprWorkGroup1], 256           // WorkGroup[01] * MT
s_mul_i32 s64, s[sgprWorkGroup1], 256              // WorkGroup[01] * MT
s_mul_hi_u32 s65, s64, s[sgprStrideB1J]            // tlu=0, scaled tile-offset by stride
s_mul_i32 s64, s64, s[sgprStrideB1J]               // tlu=0, scaled tile-offset by stride
s_sub_u32 s[sgprShadowLimitB_forTailLoop+0], s[sgprTensor2dSizeB], s64 // sub tileStart
s_subb_u32 s[sgprShadowLimitB_forTailLoop+1], s[sgprTensor2dSizeB+1], s65 // sub tileStart
s_lshl_b64 s[sgprShadowLimitB_forTailLoop:sgprShadowLimitB_forTailLoop+1], s[sgprShadowLimitB_forTailLoop:sgprShadowLimitB_forTailLoop+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB_forTailLoop+0], s[sgprShadowLimitB_forTailLoop+0], 16 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB_forTailLoop+1], s[sgprShadowLimitB_forTailLoop+1], 0 // extend limit for pre-pad

s_lshr_b32 s[sgprLoopCounterL], s[sgprSizesSum+0], 6  // s[sgprLoopCounterL] = s[sgprSizesSum+0] / 64
s_mov_b32 s[sgprGlobalReadIncsB+0], DepthU*BpeB       // incrB (unrollIdx)
s_mul_i32 s[sgprGlobalReadIncsB+0], s[sgprGlobalReadIncsB+0], s[sgprLoopCounterL]

s_sub_u32 s[sgprShadowLimitB_forTailLoop+0], s[sgprShadowLimitB_forTailLoop+0], s[sgprGlobalReadIncsB+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB_forTailLoop+1], s[sgprShadowLimitB_forTailLoop+1], 0 // limit -= inc)


/* global read addresses: addresses a */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s65, s[sgprWorkGroup0], 256           // WorkGroup[01] * MT
s_mul_i32 s64, s[sgprWorkGroup0], 256              // WorkGroup[01] * MT
s_mul_hi_u32 s65, s64, s[sgprStrideA0I]            // tlu=0, scaled tile-offset by stride
s_mul_i32 s64, s64, s[sgprStrideA0I]               // tlu=0, scaled tile-offset by stride
s_sub_u32 s[sgprShadowLimitA+0], s[sgprTensor2dSizeA], s64 // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s[sgprTensor2dSizeA+1], s65 // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 16 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s63, s[sgprStrideAK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s62, s[sgprStrideAK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s64, s64, s62                            // accum wg term to tilestart
s_addc_u32 s65, s65, s63                           // accum wg term to tilestart
s_lshl_b64 s[64:65], s[64:65], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s64    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s65   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdA+0], s[sgprSrdA+0], 16         // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD

s_mov_b64 s[sgprSrdA_forTailLoop+0:sgprSrdA_forTailLoop+1], s[sgprSrdA+0:sgprSrdA+1]
s_mov_b64 s[sgprSrdA_forTailLoop+2:sgprSrdA_forTailLoop+3], s[sgprSrdA+2:sgprSrdA+3]
s_mov_b64 s[sgprShadowLimitA_forTailLoop+0:sgprShadowLimitA_forTailLoop+1], s[sgprShadowLimitA+0:sgprShadowLimitA+1]

s_mov_b32 s[sgprGlobalReadIncsA+0], DepthU*BpeA       // incrB (unrollIdx)
s_mul_i32 s[sgprGlobalReadIncsA+0], s[sgprGlobalReadIncsA+0], s[sgprLoopCounterL]

s_add_u32 s[sgprSrdA_forTailLoop+0], s[sgprSrdA_forTailLoop+0], s[sgprGlobalReadIncsA+0] //
s_addc_u32 s[sgprSrdA_forTailLoop+1], s[sgprSrdA_forTailLoop+1], 0         //
s_sub_u32 s[sgprShadowLimitA_forTailLoop+0], s[sgprShadowLimitA_forTailLoop+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA_forTailLoop+1], s[sgprShadowLimitA_forTailLoop+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA_forTailLoop+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA_forTailLoop+2], s[sgprShadowLimitA_forTailLoop+0]    // Move shadow to real if we are within 2^32


/* global read addresses: addresses b */

/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s65, s[sgprWorkGroup1], 256           // WorkGroup[01] * MT
s_mul_i32 s64, s[sgprWorkGroup1], 256              // WorkGroup[01] * MT

s_cmp_lt_u32 s[sgprStrideB1J], s[sgprStrideSwizzle]                 // LINE8036
s_cbranch_scc1 Skip_fix_strideB1                   //
s_lshr_b32 s[sgprStrideStruct], s[sgprStrideB1J], s[sgprStructBit] //
s_sub_u32 s[sgprShadowLimitB+0], s[sgprSizeJ], s64 //
s_subb_u32 s[sgprShadowLimitB+1], 0, s65           //
s_mul_hi_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+0], s[sgprStrideStruct] //
s_mul_i32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprStrideStruct] //
s_branch Skip_fix_strideB2                         //
Skip_fix_strideB1:                                 //
s_lshr_b32 s[sgprStrideStruct], s[sgprStrideB1J], 0xd //
s_sub_u32 s[sgprShadowLimitB+0], s[sgprSizeJ], s64 //
s_subb_u32 s[sgprShadowLimitB+1], 0, s65           //
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprStrideStruct] //
Skip_fix_strideB2:
//s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 16 // extend limit for pre-pad
//s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad

s_mul_hi_u32 s65, s64, s[sgprStrideB1J]            // tlu=0, scaled tile-offset by stride
s_mul_i32 s64, s64, s[sgprStrideB1J]               // tlu=0, scaled tile-offset by stride
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32

s_mul_hi_u32 s63, s[sgprStrideBK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s62, s[sgprStrideBK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s64, s64, s62                            // accum wg term to tilestart
s_addc_u32 s65, s65, s63                           // accum wg term to tilestart
s_lshl_b64 s[64:65], s[64:65], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s64    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s65   // SRD base = Address+ tileStart1
s_sub_u32 s[sgprSrdB+0], s[sgprSrdB+0], 16         // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // pre-pad to make room for possible pointer shift
s_mov_b32 s[sgprSrdB+3], Srd127_96                 // Set bits 127_96 in SRD


s_add_u32 s[sgprStructBit1], 17, s[sgprStructBit]
s_cmp_lt_u32 s[sgprStrideB1J], s[sgprStrideSwizzle]
s_cbranch_scc1 skip_fix_set
s_mov_b32 s[sgprStructNum], 1                      //
s_lshl_b32 s[sgprStructNum], s[sgprStructNum], s[sgprStructBit1] //
s_branch skip_fix_set2
skip_fix_set:
s_lshr_b32 s[sgprStrideStruct], s[sgprStrideB1J], 0xd
s_lshl_b32 s[sgprStructNum], s[sgprStrideB1J], 0x1
s_lshr_b32 s[sgprStructNum],s[sgprStructNum],s[sgprStrideStruct]
s_lshl_b32 s[sgprStructNum], s[sgprStructNum], 0x10
skip_fix_set2:
s_or_b32 s[sgprStructNum], s[sgprStructNum], 0x40000000 //
s_mov_b32 s90, s[sgprStructNum]                    //
s_or_b32 s[sgprSrdB+1], s[sgprSrdB+1], s90         // struct buffer,


/* global read addresses: increments a */

s_mov_b32 s[sgprGlobalReadIncsA+0], DepthU*BpeA    // incrA (unrollIdx)


/* global read addresses: increments b */

s_mov_b32 s[sgprGlobalReadIncsB+0], DepthU*BpeB    // incrB (unrollIdx)


/******************************************/
/* Local Write Addresses                  */
/******************************************/

/* lwaTileAssignmentA = v0 */

/* lwaTileAssignmentB = v2 */

/* lwaUnrollAssignmentA = v1 */

/* lwaUnrollAssignmentB = v3 */


/* local write addresses: first offset a */
v_and_b32 v4, 255, v[vgprSerial]
v_and_b32 v1, 7, v4
v_lshrrev_b32 v0, 3, v4
v_lshlrev_b32 v1, 3, v1

v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x40, v0     // lwAL**(MTA + PAD)
_v_add_lshl_u32 v[vgprLocalWriteAddrA], v1, v[vgprLocalWriteAddrA], 0x1 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe
v_readfirstlane_b32 s[sgprLocalWriteAddrA], v[vgprLocalWriteAddrA] // Copy lds write address VGPR to SGPR

s_and_b32 s90, 3, s[sgprWaveiD]                    //
s_lshl_b32 s90, s90, 17                            //
s_or_b32 s[sgprLocalWriteAddrA], s[sgprLocalWriteAddrA], s90 //

s_mov_b32 s[sgprLocalWriteAddrA_ori], s[sgprLocalWriteAddrA]  //

/* local write addresses: first offset b */

/* declare loop num iterations */


s_lshr_b32 s[sgprLoopCounterL], s[sgprSizesSum+0], 6 // s[sgprLoopCounterL] = s[sgprSizesSum+0] / 64
s_mov_b32 s[sgprOrigLoopCounter], s[sgprLoopCounterL] // copy loop counter

/* local read addresses: init pointers a */


/* localReadInitPointers */

/* local read addresses: init pointers b */


/* localReadInitPointers */


/* prefetch: global -> local */

s_cmp_eq_u32 s[sgprLoopCounterL], 0                // at last iteration?
s_cbranch_scc1 ShadowInitStart_9                   // skip to ShadowInitStart iter b/c numIter==0

s_cmp_le_i32 s[sgprWaveiD], 7                      //
s_cbranch_scc1 MmacWave                            //
s_mov_b32 s[sgprLoopforPf], 0                      //
Prefetch_Begin:                                    //

s_mov_b32 m0, s[sgprLocalWriteAddrA]            // m0 <- LDS write address
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_0_0
s_add_u32 m0, m0, 0x1000                             // Move LDS write address to next line
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+1], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_1_0
s_add_u32 m0, m0, 0x1000                             // Move LDS write address to next line
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+2], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_1_0
s_add_u32 m0, m0, 0x1000                             // Move LDS write address to next line
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+3], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_1_0
s_add_u32 m0, m0, 0x1000                             // Move LDS write address to next line
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+4], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_1_0
s_add_u32 m0, m0, 0x1000                             // Move LDS write address to next line
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+5], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_1_0
s_add_u32 m0, m0, 0x1000                             // Move LDS write address to next line
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+6], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_1_0
s_add_u32 m0, m0, 0x1000                            // Move LDS write address to next line
buffer_load_dwordx4 v[vgprGlobalReadOffsetA+7], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0,  lds // G -> Reg 0_0_1_0

s_barrier

s_add_u32 s[sgprLoopforPf], s[sgprLoopforPf], 1    //

s_add_u32 s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA+0] //
s_addc_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         //
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

s_add_u32 s[sgprLocalWriteAddrA], 0x8000, s[sgprLocalWriteAddrA] //
s_and_b32 s90, s[sgprLocalWriteAddrA], 0x1ffff     //
s_cmp_ge_u32 s90, s[sgprMask]                   //
s_cmov_b32 s[sgprLocalWriteAddrA], s[sgprLocalWriteAddrA_ori] //
s_cmp_lt_i32 s[sgprLoopforPf], 1                   //
s_cbranch_scc1 SkipBarrier                         //
s_waitcnt vmcnt(0)                                 //
s_barrier                                          //
SkipBarrier:                                       //
s_cmp_lt_i32 s[sgprLoopforPf], s[sgprLoopCounterL] //
s_cbranch_scc1 Prefetch_Begin                      //
s_waitcnt vmcnt(0)                                 //
s_barrier                                          //
s_endpgm


MmacWave:


/******************************************/
/* End setupNewTile, isPap=False             */
/******************************************/

ShadowInitStart_9: //

s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0xfffffffe                //
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0xfffffffe                //
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in post-loop SRD


s_mul_i32 s64, MT1, s[sgprWorkGroup1]              // <- wg1*MT1
s_mul_hi_u32 s63, s64, s[sgprStrideC1J]            // CScale s64 by Stride
s_mul_i32 s62, s64, s[sgprStrideC1J]               // CScale s64 by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s62        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s63       // add hi to SRD
s_mul_hi_u32 s63, s64, s[sgprStrideD1J]            // Scale s64 by Stride
s_mul_i32 s62, s64, s[sgprStrideD1J]               // Scale s64 by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s62        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s63       // add hi to SRD

s_mul_hi_u32 s63, s[sgprWorkGroup2], s[sgprStrideCK] // CScale s[sgprWorkGroup2] by Stride
s_mul_i32 s62, s[sgprWorkGroup2], s[sgprStrideCK]  // CScale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s62        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s63       // add hi to SRD
s_mul_hi_u32 s63, s[sgprWorkGroup2], s[sgprStrideDK] // Scale s[sgprWorkGroup2] by Stride
s_mul_i32 s62, s[sgprWorkGroup2], s[sgprStrideDK]  // Scale s[sgprWorkGroup2] by Stride
s_lshl_b64 s[62:63], s[62:63], 1                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s62        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s63       // add hi to SRD



/* initC: remove C-tile 0-128 from pool */

/* initC: remove AB-tile 128-176 from pool */
v_mov_b32 v[vgprValuC+0], 0x0                      // initC
v_mov_b32 v[vgprValuC+1], 0x0                      // initC
v_mov_b32 v[vgprValuC+2], 0x0                      // initC
v_mov_b32 v[vgprValuC+3], 0x0                      // initC
v_mov_b32 v[vgprValuC+4], 0x0                      // initC
v_mov_b32 v[vgprValuC+5], 0x0                      // initC
v_mov_b32 v[vgprValuC+6], 0x0                      // initC
v_mov_b32 v[vgprValuC+7], 0x0                      // initC
v_mov_b32 v[vgprValuC+8], 0x0                      // initC
v_mov_b32 v[vgprValuC+9], 0x0                      // initC
v_mov_b32 v[vgprValuC+10], 0x0                     // initC
v_mov_b32 v[vgprValuC+11], 0x0                     // initC
v_mov_b32 v[vgprValuC+12], 0x0                     // initC
v_mov_b32 v[vgprValuC+13], 0x0                     // initC
v_mov_b32 v[vgprValuC+14], 0x0                     // initC
v_mov_b32 v[vgprValuC+15], 0x0                     // initC
v_mov_b32 v[vgprValuC+16], 0x0                     // initC
v_mov_b32 v[vgprValuC+17], 0x0                     // initC
v_mov_b32 v[vgprValuC+18], 0x0                     // initC
v_mov_b32 v[vgprValuC+19], 0x0                     // initC
v_mov_b32 v[vgprValuC+20], 0x0                     // initC
v_mov_b32 v[vgprValuC+21], 0x0                     // initC
v_mov_b32 v[vgprValuC+22], 0x0                     // initC
v_mov_b32 v[vgprValuC+23], 0x0                     // initC
v_mov_b32 v[vgprValuC+24], 0x0                     // initC
v_mov_b32 v[vgprValuC+25], 0x0                     // initC
v_mov_b32 v[vgprValuC+26], 0x0                     // initC
v_mov_b32 v[vgprValuC+27], 0x0                     // initC
v_mov_b32 v[vgprValuC+28], 0x0                     // initC
v_mov_b32 v[vgprValuC+29], 0x0                     // initC
v_mov_b32 v[vgprValuC+30], 0x0                     // initC
v_mov_b32 v[vgprValuC+31], 0x0                     // initC
v_mov_b32 v[vgprValuC+32], 0x0                     // initC
v_mov_b32 v[vgprValuC+33], 0x0                     // initC
v_mov_b32 v[vgprValuC+34], 0x0                     // initC
v_mov_b32 v[vgprValuC+35], 0x0                     // initC
v_mov_b32 v[vgprValuC+36], 0x0                     // initC
v_mov_b32 v[vgprValuC+37], 0x0                     // initC
v_mov_b32 v[vgprValuC+38], 0x0                     // initC
v_mov_b32 v[vgprValuC+39], 0x0                     // initC
v_mov_b32 v[vgprValuC+40], 0x0                     // initC
v_mov_b32 v[vgprValuC+41], 0x0                     // initC
v_mov_b32 v[vgprValuC+42], 0x0                     // initC
v_mov_b32 v[vgprValuC+43], 0x0                     // initC
v_mov_b32 v[vgprValuC+44], 0x0                     // initC
v_mov_b32 v[vgprValuC+45], 0x0                     // initC
v_mov_b32 v[vgprValuC+46], 0x0                     // initC
v_mov_b32 v[vgprValuC+47], 0x0                     // initC
v_mov_b32 v[vgprValuC+48], 0x0                     // initC
v_mov_b32 v[vgprValuC+49], 0x0                     // initC
v_mov_b32 v[vgprValuC+50], 0x0                     // initC
v_mov_b32 v[vgprValuC+51], 0x0                     // initC
v_mov_b32 v[vgprValuC+52], 0x0                     // initC
v_mov_b32 v[vgprValuC+53], 0x0                     // initC
v_mov_b32 v[vgprValuC+54], 0x0                     // initC
v_mov_b32 v[vgprValuC+55], 0x0                     // initC
v_mov_b32 v[vgprValuC+56], 0x0                     // initC
v_mov_b32 v[vgprValuC+57], 0x0                     // initC
v_mov_b32 v[vgprValuC+58], 0x0                     // initC
v_mov_b32 v[vgprValuC+59], 0x0                     // initC
v_mov_b32 v[vgprValuC+60], 0x0                     // initC
v_mov_b32 v[vgprValuC+61], 0x0                     // initC
v_mov_b32 v[vgprValuC+62], 0x0                     // initC
v_mov_b32 v[vgprValuC+63], 0x0                     // initC
v_mov_b32 v[vgprValuC+64], 0x0                     // initC
v_mov_b32 v[vgprValuC+65], 0x0                     // initC
v_mov_b32 v[vgprValuC+66], 0x0                     // initC
v_mov_b32 v[vgprValuC+67], 0x0                     // initC
v_mov_b32 v[vgprValuC+68], 0x0                     // initC
v_mov_b32 v[vgprValuC+69], 0x0                     // initC
v_mov_b32 v[vgprValuC+70], 0x0                     // initC
v_mov_b32 v[vgprValuC+71], 0x0                     // initC
v_mov_b32 v[vgprValuC+72], 0x0                     // initC
v_mov_b32 v[vgprValuC+73], 0x0                     // initC
v_mov_b32 v[vgprValuC+74], 0x0                     // initC
v_mov_b32 v[vgprValuC+75], 0x0                     // initC
v_mov_b32 v[vgprValuC+76], 0x0                     // initC
v_mov_b32 v[vgprValuC+77], 0x0                     // initC
v_mov_b32 v[vgprValuC+78], 0x0                     // initC
v_mov_b32 v[vgprValuC+79], 0x0                     // initC
v_mov_b32 v[vgprValuC+80], 0x0                     // initC
v_mov_b32 v[vgprValuC+81], 0x0                     // initC
v_mov_b32 v[vgprValuC+82], 0x0                     // initC
v_mov_b32 v[vgprValuC+83], 0x0                     // initC
v_mov_b32 v[vgprValuC+84], 0x0                     // initC
v_mov_b32 v[vgprValuC+85], 0x0                     // initC
v_mov_b32 v[vgprValuC+86], 0x0                     // initC
v_mov_b32 v[vgprValuC+87], 0x0                     // initC
v_mov_b32 v[vgprValuC+88], 0x0                     // initC
v_mov_b32 v[vgprValuC+89], 0x0                     // initC
v_mov_b32 v[vgprValuC+90], 0x0                     // initC
v_mov_b32 v[vgprValuC+91], 0x0                     // initC
v_mov_b32 v[vgprValuC+92], 0x0                     // initC
v_mov_b32 v[vgprValuC+93], 0x0                     // initC
v_mov_b32 v[vgprValuC+94], 0x0                     // initC
v_mov_b32 v[vgprValuC+95], 0x0                     // initC
v_mov_b32 v[vgprValuC+96], 0x0                     // initC
v_mov_b32 v[vgprValuC+97], 0x0                     // initC
v_mov_b32 v[vgprValuC+98], 0x0                     // initC
v_mov_b32 v[vgprValuC+99], 0x0                     // initC
v_mov_b32 v[vgprValuC+100], 0x0                    // initC
v_mov_b32 v[vgprValuC+101], 0x0                    // initC
v_mov_b32 v[vgprValuC+102], 0x0                    // initC
v_mov_b32 v[vgprValuC+103], 0x0                    // initC
v_mov_b32 v[vgprValuC+104], 0x0                    // initC
v_mov_b32 v[vgprValuC+105], 0x0                    // initC
v_mov_b32 v[vgprValuC+106], 0x0                    // initC
v_mov_b32 v[vgprValuC+107], 0x0                    // initC
v_mov_b32 v[vgprValuC+108], 0x0                    // initC
v_mov_b32 v[vgprValuC+109], 0x0                    // initC
v_mov_b32 v[vgprValuC+110], 0x0                    // initC
v_mov_b32 v[vgprValuC+111], 0x0                    // initC
v_mov_b32 v[vgprValuC+112], 0x0                    // initC
v_mov_b32 v[vgprValuC+113], 0x0                    // initC
v_mov_b32 v[vgprValuC+114], 0x0                    // initC
v_mov_b32 v[vgprValuC+115], 0x0                    // initC
v_mov_b32 v[vgprValuC+116], 0x0                    // initC
v_mov_b32 v[vgprValuC+117], 0x0                    // initC
v_mov_b32 v[vgprValuC+118], 0x0                    // initC
v_mov_b32 v[vgprValuC+119], 0x0                    // initC
v_mov_b32 v[vgprValuC+120], 0x0                    // initC
v_mov_b32 v[vgprValuC+121], 0x0                    // initC
v_mov_b32 v[vgprValuC+122], 0x0                    // initC
v_mov_b32 v[vgprValuC+123], 0x0                    // initC
v_mov_b32 v[vgprValuC+124], 0x0                    // initC
v_mov_b32 v[vgprValuC+125], 0x0                    // initC
v_mov_b32 v[vgprValuC+126], 0x0                    // initC
v_mov_b32 v[vgprValuC+127], 0x0                    // initC

s_cmp_eq_u32 s[sgprLoopCounterL], 0                // at last iteration?

/* after InitC, skip to end of prefetch last iter if numIter==0 */
s_cbranch_scc0 label_NoBranch_10                   // Only branch on scc1
s_getpc_B64 s[62:63]                               // addr of next instr
s_add_u32 s64, PrefetchGlobalLastIterEnd_4, 0x4    // target branch offset
s_add_u32 s62, s62, s64                            // add target branch offset
s_addc_u32 s63, 0, s63                             // add high and carry
s_setpc_b64 s[62:63]                               // branch to PrefetchGlobalLastIterEnd_4
label_NoBranch_10:

buffer_load_dwordx4 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+3], v[vgprGlobalReadOffsetB+0:vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+7], v[vgprGlobalReadOffsetB+2:vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+8:vgprValuB_X0_I0+11], v[vgprGlobalReadOffsetB+4:vgprGlobalReadOffsetB+5], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+12:vgprValuB_X0_I0+15], v[vgprGlobalReadOffsetB+6:vgprGlobalReadOffsetB+7], s[sgprSrdB:sgprSrdB+3], 0,idxen  offen offset:0

s_barrier
s_waitcnt vmcnt(0)                                 // lgkmcnt=-1 vmcnt=08wait for global read

s_barrier //



s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)

s_cmp_le_i32  s[sgprLoopCounterL], 1
s_cmov_b32 s[sgprSrdB+2], 0
s_cmov_b32 s[sgprGlobalReadIncsB+0], 0


/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/

openLoopL_11:

s_cmp_le_u32 s[sgprLoopCounterL], 0x0              // LoopCounterL < EndCounter
s_cbranch_scc1 LoopEndL_2                          // do not enter LoopL

s_and_b32 s90, 7, s[sgprWaveiD]
s_cmp_ge_u32 s90, 4
s_cbranch_scc1 LoopBeginL_2

LoopBeginL_1:


/******************************************/
/* Unrolled Loop 1/2 - Begin              */
/******************************************/

label_0012: // LoopCopy1


/* Begin Each Unroll: Check VGPR.checkin for INT8 LW */

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap] offset:0x200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x1000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap] offset:0x1200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0x2000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap] offset:0x2200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0x3000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap] offset:0x3200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0x4000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap] offset:0x4200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0x5000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap] offset:0x5200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0x6000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap] offset:0x6200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0x7000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap] offset:0x7200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_waitcnt lgkmcnt(0)
MAC_32x4x2_X0_I0
s_barrier

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0x40 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap1] offset:0x240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x1040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap1] offset:0x1240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0x2040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap1] offset:0x2240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0x3040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap1] offset:0x3240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
buffer_load_dwordx4 v[vgprValuB_X1_I0+0:vgprValuB_X1_I0+3], v[vgprGlobalReadOffsetB+0:vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X1_I0+4:vgprValuB_X1_I0+7], v[vgprGlobalReadOffsetB+2:vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X1_I0+8:vgprValuB_X1_I0+11], v[vgprGlobalReadOffsetB+4:vgprGlobalReadOffsetB+5], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X1_I0+12:vgprValuB_X1_I0+15], v[vgprGlobalReadOffsetB+6:vgprGlobalReadOffsetB+7], s[sgprSrdB:sgprSrdB+3], 0,idxen  offen offset:0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0x4040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap1] offset:0x4240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0x5040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap1] offset:0x5240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0x6040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap1] offset:0x6240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0x7040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap1] offset:0x7240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_cmp_le_i32  s[sgprLoopCounterL], 2
s_cmov_b32 s[sgprSrdB+2], 0
s_cmov_b32 s[sgprGlobalReadIncsB+0], 0
s_waitcnt lgkmcnt(0)
MAC_32x4x2_X0_I1
s_barrier

s_waitcnt vmcnt(0)


/******************************************/
/* Unrolled Loop - End 1/2                */
/******************************************/


/* closeLoop loopL finalLoop=0 tailLoop=0 */
s_sub_u32 s[sgprLoopCounterL], s[sgprLoopCounterL], 1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounterL], 0x0              // counterL==1
s_cbranch_scc1 LoopEndL_oddexit_3                  // exit LoopL


/******************************************/
/* Unrolled Loop 2/2 - Begin              */
/******************************************/

label_0013: // LoopCopy2


/* Begin Each Unroll: Check VGPR.checkin for INT8 LW */

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0x8000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap] offset:0x8200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x9000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap] offset:0x9200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0xa000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap] offset:0xa200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0xb000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap] offset:0xb200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0xc000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap] offset:0xc200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0xd000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap] offset:0xd200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0xe000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap] offset:0xe200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0xf000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap] offset:0xf200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_waitcnt lgkmcnt(0)
MAC_32x4x2_X1_I0
s_barrier

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0x8040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap1] offset:0x8240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x9040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap1] offset:0x9240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0xa040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap1] offset:0xa240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0xb040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap1] offset:0xb240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
buffer_load_dwordx4 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+3], v[vgprGlobalReadOffsetB+0:vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+7], v[vgprGlobalReadOffsetB+2:vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+8:vgprValuB_X0_I0+11], v[vgprGlobalReadOffsetB+4:vgprGlobalReadOffsetB+5], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+12:vgprValuB_X0_I0+15], v[vgprGlobalReadOffsetB+6:vgprGlobalReadOffsetB+7], s[sgprSrdB:sgprSrdB+3], 0,idxen  offen offset:0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0xc040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap1] offset:0xc240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0xd040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap1] offset:0xd240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0xe040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap1] offset:0xe240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0xf040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap1] offset:0xf240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_cmp_le_i32  s[sgprLoopCounterL], 2
s_cmov_b32 s[sgprSrdB+2], 0
s_cmov_b32 s[sgprGlobalReadIncsB+0], 0
s_waitcnt lgkmcnt(0)
MAC_32x4x2_X1_I1
s_barrier

s_waitcnt vmcnt(0)

/******************************************/
/* Unrolled Loop - End 2/2 (final)        */
/******************************************/


/* closeLoop loopL finalLoop=1 tailLoop=0 */
s_sub_u32 s[sgprLoopCounterL], s[sgprLoopCounterL], 1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounterL], 0x0              // counterL==1
s_cbranch_scc0 LoopBeginL_1                        // restart LoopL
s_branch LoopEndL_2                                // exit unroll loopL (and skip oddexit)
/////////////////////////////////////////////////////
//////////////////////////////////////////////////////
LoopBeginL_2:

/******************************************/
/* Unrolled Loop 1/2 - Begin              */
/******************************************/

label_00121: // LoopCopy1


/* Begin Each Unroll: Check VGPR.checkin for INT8 LW */

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap] offset:0x200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x1000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap] offset:0x1200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0x2000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap] offset:0x2200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0x3000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap] offset:0x3200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0x4000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap] offset:0x4200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0x5000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap] offset:0x5200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0x6000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap] offset:0x6200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0x7000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap] offset:0x7200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_waitcnt lgkmcnt(0)
s_barrier
MAC_32x4x2_X0_I0

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0x40 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap1] offset:0x240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x1040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap1] offset:0x1240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0x2040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap1] offset:0x2240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0x3040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap1] offset:0x3240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
buffer_load_dwordx4 v[vgprValuB_X1_I0+0:vgprValuB_X1_I0+3], v[vgprGlobalReadOffsetB+0:vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X1_I0+4:vgprValuB_X1_I0+7], v[vgprGlobalReadOffsetB+2:vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X1_I0+8:vgprValuB_X1_I0+11], v[vgprGlobalReadOffsetB+4:vgprGlobalReadOffsetB+5], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X1_I0+12:vgprValuB_X1_I0+15], v[vgprGlobalReadOffsetB+6:vgprGlobalReadOffsetB+7], s[sgprSrdB:sgprSrdB+3], 0,idxen  offen offset:0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0x4040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap1] offset:0x4240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0x5040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap1] offset:0x5240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0x6040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap1] offset:0x6240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0x7040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap1] offset:0x7240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_cmp_le_i32  s[sgprLoopCounterL], 2
s_cmov_b32 s[sgprSrdB+2], 0
s_cmov_b32 s[sgprGlobalReadIncsB+0], 0
s_waitcnt lgkmcnt(0)
s_barrier
MAC_32x4x2_X0_I1

s_waitcnt vmcnt(0)


/******************************************/
/* Unrolled Loop - End 1/2                */
/******************************************/


/* closeLoop loopL finalLoop=0 tailLoop=0 */
s_sub_u32 s[sgprLoopCounterL], s[sgprLoopCounterL], 1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounterL], 0x0              // counterL==1
s_cbranch_scc1 LoopEndL_oddexit_3                  // exit LoopL


/******************************************/
/* Unrolled Loop 2/2 - Begin              */
/******************************************/

label_00131: // LoopCopy2


/* Begin Each Unroll: Check VGPR.checkin for INT8 LW */

/* Begin Each Unroll: Check VGPR.checkin for INT8 LW */

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0x8000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap] offset:0x8200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x9000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap] offset:0x9200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0xa000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap] offset:0xa200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0xb000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap] offset:0xb200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0xc000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap] offset:0xc200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0xd000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap] offset:0xd200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0xe000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap] offset:0xe200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0xf000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap] offset:0xf200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_waitcnt lgkmcnt(0)
s_barrier

MAC_32x4x2_X1_I0

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA] offset:0x8040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrASwap1] offset:0x8240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA] offset:0x9040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrASwap1] offset:0x9240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA] offset:0xa040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrASwap1] offset:0xa240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA] offset:0xb040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrASwap1] offset:0xb240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
buffer_load_dwordx4 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+3], v[vgprGlobalReadOffsetB+0:vgprGlobalReadOffsetB+1], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+7], v[vgprGlobalReadOffsetB+2:vgprGlobalReadOffsetB+3], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+8:vgprValuB_X0_I0+11], v[vgprGlobalReadOffsetB+4:vgprGlobalReadOffsetB+5], s[sgprSrdB:sgprSrdB+3], 0,idxen offen offset:0
buffer_load_dwordx4 v[vgprValuB_X0_I0+12:vgprValuB_X0_I0+15], v[vgprGlobalReadOffsetB+6:vgprGlobalReadOffsetB+7], s[sgprSrdB:sgprSrdB+3], 0,idxen  offen offset:0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA] offset:0xc040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrASwap1] offset:0xc240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA] offset:0xd040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrASwap1] offset:0xd240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA] offset:0xe040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrASwap1] offset:0xe240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA] offset:0xf040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrASwap1] offset:0xf240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32  s[sgprSrdB+1], s[sgprSrdB+1], 0        // gra SRD += inc(upper)
s_cmp_le_i32  s[sgprLoopCounterL], 2
s_cmov_b32 s[sgprSrdB+2], 0
s_cmov_b32 s[sgprGlobalReadIncsB+0], 0
s_waitcnt lgkmcnt(0)
s_barrier

MAC_32x4x2_X1_I1

s_waitcnt vmcnt(0)

/******************************************/
/* Unrolled Loop - End 2/2 (final)        */
/******************************************/


/* closeLoop loopL finalLoop=1 tailLoop=0 */
s_sub_u32 s[sgprLoopCounterL], s[sgprLoopCounterL], 1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounterL], 0x0              // counterL==1
s_cbranch_scc0 LoopBeginL_2                        // restart LoopL


LoopEndL_oddexit_3: // unroll loop odditer exit

LoopEndL_2:


/* Before NLL: Check VGPR.checkin for INT8 LW */


/******************************************/
/* Opt. NoLoadLoop Without PAP - Begin         */
/******************************************/

s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 OptNLL_End_14                       // Branch if Beta is not zero


s_cmp_eq_u32 s[sgprAlpha], 1.0                     // alpha == 1.0?
s_cbranch_scc0 OptNLL_End_14                       // branch if alpha != 1

s_and_b32 s63, 63, s[sgprSizesSum+0]               // s63 = s[sgprSizesSum+0] % 32
s_cmp_eq_u32 s63, 0x0                              // numIterL == 0
s_cbranch_scc0 OptNLL_End_14                       // skip if tail loop required

s_and_b32 s62, 255, s[sgprSizeI]                   // s62 = s[sgprSizeI] % 256
s_add_u32 s64, -0x1, s[sgprNumWorkGroups0]         //
s_cmp_ge_u32 s[sgprWorkGroup0], s64                // wg0 >= nwg0-1 ?
s_cselect_b32 s62, s62, 0                          // set rMT0
s_cmpk_gt_u32 s62, 0x0                             // rMT0 > 0
s_cbranch_scc1 OptNLL_End_14                       // jump if edges required
s_and_b32 s62, 255, s[sgprSizeJ]                   // s62 = s[sgprSizeJ] % 256
s_add_u32 s64, -0x1, s[sgprNumWorkGroups1]         //
s_cmp_ge_u32 s[sgprWorkGroup1], s64                // wg1 >= nwg1-1
s_cselect_b32 s62, s62, 0                          // set rMT1
s_cmpk_gt_u32 s62, 0x0                             // rMT1 > 0
s_cbranch_scc1 OptNLL_End_14_flag                       // jump if edges required



/* Stores for OptNLL */
Summation_End_OptNLL_15:
/* linked_family2256_PARTIAL_PRODUCER_BEGIN
 * Runtime N/D/V are supplied through the existing Tensile kernarg.
 * D is the compact workspace and C is the int64 target vector.
 */
v_mov_b32 v250, 0x7fff0000 // canonical BF16 NaN payload
v_mov_b32 v251, 0x7fff     // BF16 round-to-nearest-even bias
FP32_TO_BF16 0
v_lshlrev_b32 v0, 16, v0
FP32_TO_BF16 1
v_lshlrev_b32 v1, 16, v1
FP32_TO_BF16 2
v_lshlrev_b32 v2, 16, v2
FP32_TO_BF16 3
v_lshlrev_b32 v3, 16, v3
FP32_TO_BF16 4
v_lshlrev_b32 v4, 16, v4
FP32_TO_BF16 5
v_lshlrev_b32 v5, 16, v5
FP32_TO_BF16 6
v_lshlrev_b32 v6, 16, v6
FP32_TO_BF16 7
v_lshlrev_b32 v7, 16, v7
FP32_TO_BF16 8
v_lshlrev_b32 v8, 16, v8
FP32_TO_BF16 9
v_lshlrev_b32 v9, 16, v9
FP32_TO_BF16 10
v_lshlrev_b32 v10, 16, v10
FP32_TO_BF16 11
v_lshlrev_b32 v11, 16, v11
FP32_TO_BF16 12
v_lshlrev_b32 v12, 16, v12
FP32_TO_BF16 13
v_lshlrev_b32 v13, 16, v13
FP32_TO_BF16 14
v_lshlrev_b32 v14, 16, v14
FP32_TO_BF16 15
v_lshlrev_b32 v15, 16, v15
FP32_TO_BF16 16
v_lshlrev_b32 v16, 16, v16
FP32_TO_BF16 17
v_lshlrev_b32 v17, 16, v17
FP32_TO_BF16 18
v_lshlrev_b32 v18, 16, v18
FP32_TO_BF16 19
v_lshlrev_b32 v19, 16, v19
FP32_TO_BF16 20
v_lshlrev_b32 v20, 16, v20
FP32_TO_BF16 21
v_lshlrev_b32 v21, 16, v21
FP32_TO_BF16 22
v_lshlrev_b32 v22, 16, v22
FP32_TO_BF16 23
v_lshlrev_b32 v23, 16, v23
FP32_TO_BF16 24
v_lshlrev_b32 v24, 16, v24
FP32_TO_BF16 25
v_lshlrev_b32 v25, 16, v25
FP32_TO_BF16 26
v_lshlrev_b32 v26, 16, v26
FP32_TO_BF16 27
v_lshlrev_b32 v27, 16, v27
FP32_TO_BF16 28
v_lshlrev_b32 v28, 16, v28
FP32_TO_BF16 29
v_lshlrev_b32 v29, 16, v29
FP32_TO_BF16 30
v_lshlrev_b32 v30, 16, v30
FP32_TO_BF16 31
v_lshlrev_b32 v31, 16, v31
FP32_TO_BF16 32
v_lshlrev_b32 v32, 16, v32
FP32_TO_BF16 33
v_lshlrev_b32 v33, 16, v33
FP32_TO_BF16 34
v_lshlrev_b32 v34, 16, v34
FP32_TO_BF16 35
v_lshlrev_b32 v35, 16, v35
FP32_TO_BF16 36
v_lshlrev_b32 v36, 16, v36
FP32_TO_BF16 37
v_lshlrev_b32 v37, 16, v37
FP32_TO_BF16 38
v_lshlrev_b32 v38, 16, v38
FP32_TO_BF16 39
v_lshlrev_b32 v39, 16, v39
FP32_TO_BF16 40
v_lshlrev_b32 v40, 16, v40
FP32_TO_BF16 41
v_lshlrev_b32 v41, 16, v41
FP32_TO_BF16 42
v_lshlrev_b32 v42, 16, v42
FP32_TO_BF16 43
v_lshlrev_b32 v43, 16, v43
FP32_TO_BF16 44
v_lshlrev_b32 v44, 16, v44
FP32_TO_BF16 45
v_lshlrev_b32 v45, 16, v45
FP32_TO_BF16 46
v_lshlrev_b32 v46, 16, v46
FP32_TO_BF16 47
v_lshlrev_b32 v47, 16, v47
FP32_TO_BF16 48
v_lshlrev_b32 v48, 16, v48
FP32_TO_BF16 49
v_lshlrev_b32 v49, 16, v49
FP32_TO_BF16 50
v_lshlrev_b32 v50, 16, v50
FP32_TO_BF16 51
v_lshlrev_b32 v51, 16, v51
FP32_TO_BF16 52
v_lshlrev_b32 v52, 16, v52
FP32_TO_BF16 53
v_lshlrev_b32 v53, 16, v53
FP32_TO_BF16 54
v_lshlrev_b32 v54, 16, v54
FP32_TO_BF16 55
v_lshlrev_b32 v55, 16, v55
FP32_TO_BF16 56
v_lshlrev_b32 v56, 16, v56
FP32_TO_BF16 57
v_lshlrev_b32 v57, 16, v57
FP32_TO_BF16 58
v_lshlrev_b32 v58, 16, v58
FP32_TO_BF16 59
v_lshlrev_b32 v59, 16, v59
FP32_TO_BF16 60
v_lshlrev_b32 v60, 16, v60
FP32_TO_BF16 61
v_lshlrev_b32 v61, 16, v61
FP32_TO_BF16 62
v_lshlrev_b32 v62, 16, v62
FP32_TO_BF16 63
v_lshlrev_b32 v63, 16, v63
FP32_TO_BF16 64
v_lshlrev_b32 v64, 16, v64
FP32_TO_BF16 65
v_lshlrev_b32 v65, 16, v65
FP32_TO_BF16 66
v_lshlrev_b32 v66, 16, v66
FP32_TO_BF16 67
v_lshlrev_b32 v67, 16, v67
FP32_TO_BF16 68
v_lshlrev_b32 v68, 16, v68
FP32_TO_BF16 69
v_lshlrev_b32 v69, 16, v69
FP32_TO_BF16 70
v_lshlrev_b32 v70, 16, v70
FP32_TO_BF16 71
v_lshlrev_b32 v71, 16, v71
FP32_TO_BF16 72
v_lshlrev_b32 v72, 16, v72
FP32_TO_BF16 73
v_lshlrev_b32 v73, 16, v73
FP32_TO_BF16 74
v_lshlrev_b32 v74, 16, v74
FP32_TO_BF16 75
v_lshlrev_b32 v75, 16, v75
FP32_TO_BF16 76
v_lshlrev_b32 v76, 16, v76
FP32_TO_BF16 77
v_lshlrev_b32 v77, 16, v77
FP32_TO_BF16 78
v_lshlrev_b32 v78, 16, v78
FP32_TO_BF16 79
v_lshlrev_b32 v79, 16, v79
FP32_TO_BF16 80
v_lshlrev_b32 v80, 16, v80
FP32_TO_BF16 81
v_lshlrev_b32 v81, 16, v81
FP32_TO_BF16 82
v_lshlrev_b32 v82, 16, v82
FP32_TO_BF16 83
v_lshlrev_b32 v83, 16, v83
FP32_TO_BF16 84
v_lshlrev_b32 v84, 16, v84
FP32_TO_BF16 85
v_lshlrev_b32 v85, 16, v85
FP32_TO_BF16 86
v_lshlrev_b32 v86, 16, v86
FP32_TO_BF16 87
v_lshlrev_b32 v87, 16, v87
FP32_TO_BF16 88
v_lshlrev_b32 v88, 16, v88
FP32_TO_BF16 89
v_lshlrev_b32 v89, 16, v89
FP32_TO_BF16 90
v_lshlrev_b32 v90, 16, v90
FP32_TO_BF16 91
v_lshlrev_b32 v91, 16, v91
FP32_TO_BF16 92
v_lshlrev_b32 v92, 16, v92
FP32_TO_BF16 93
v_lshlrev_b32 v93, 16, v93
FP32_TO_BF16 94
v_lshlrev_b32 v94, 16, v94
FP32_TO_BF16 95
v_lshlrev_b32 v95, 16, v95
FP32_TO_BF16 96
v_lshlrev_b32 v96, 16, v96
FP32_TO_BF16 97
v_lshlrev_b32 v97, 16, v97
FP32_TO_BF16 98
v_lshlrev_b32 v98, 16, v98
FP32_TO_BF16 99
v_lshlrev_b32 v99, 16, v99
FP32_TO_BF16 100
v_lshlrev_b32 v100, 16, v100
FP32_TO_BF16 101
v_lshlrev_b32 v101, 16, v101
FP32_TO_BF16 102
v_lshlrev_b32 v102, 16, v102
FP32_TO_BF16 103
v_lshlrev_b32 v103, 16, v103
FP32_TO_BF16 104
v_lshlrev_b32 v104, 16, v104
FP32_TO_BF16 105
v_lshlrev_b32 v105, 16, v105
FP32_TO_BF16 106
v_lshlrev_b32 v106, 16, v106
FP32_TO_BF16 107
v_lshlrev_b32 v107, 16, v107
FP32_TO_BF16 108
v_lshlrev_b32 v108, 16, v108
FP32_TO_BF16 109
v_lshlrev_b32 v109, 16, v109
FP32_TO_BF16 110
v_lshlrev_b32 v110, 16, v110
FP32_TO_BF16 111
v_lshlrev_b32 v111, 16, v111
FP32_TO_BF16 112
v_lshlrev_b32 v112, 16, v112
FP32_TO_BF16 113
v_lshlrev_b32 v113, 16, v113
FP32_TO_BF16 114
v_lshlrev_b32 v114, 16, v114
FP32_TO_BF16 115
v_lshlrev_b32 v115, 16, v115
FP32_TO_BF16 116
v_lshlrev_b32 v116, 16, v116
FP32_TO_BF16 117
v_lshlrev_b32 v117, 16, v117
FP32_TO_BF16 118
v_lshlrev_b32 v118, 16, v118
FP32_TO_BF16 119
v_lshlrev_b32 v119, 16, v119
FP32_TO_BF16 120
v_lshlrev_b32 v120, 16, v120
FP32_TO_BF16 121
v_lshlrev_b32 v121, 16, v121
FP32_TO_BF16 122
v_lshlrev_b32 v122, 16, v122
FP32_TO_BF16 123
v_lshlrev_b32 v123, 16, v123
FP32_TO_BF16 124
v_lshlrev_b32 v124, 16, v124
FP32_TO_BF16 125
v_lshlrev_b32 v125, 16, v125
FP32_TO_BF16 126
v_lshlrev_b32 v126, 16, v126
FP32_TO_BF16 127
v_lshlrev_b32 v127, 16, v127
// v144 is global token byte offset in FP32 planes.
v_lshrrev_b32 v144, 6, v[vgprSerial]
v_lshlrev_b32 v144, 7, v144
v_and_b32 v145, 15, v[vgprSerial]
v_and_b32 v147, 63, v[vgprSerial]
v_lshrrev_b32 v147, 4, v147
v_lshlrev_b32 v147, 2, v147
_v_add_co_u32 v144, vcc, v144, v147
s_lshl_b32 s59, s[sgprWorkGroup1], 10
_v_add_co_u32 v144, vcc, s59, v144
v_lshlrev_b32 v146, 1, v144 // int64 target byte offset
s_mul_i32 s58, s[sgprWorkGroup0], s[sgprSizeJ] // q * N
s_lshl_b32 s58, s58, 2 // q * N * sizeof(float)
s_mul_i32 s56, s[sgprNumWorkGroups0], s[sgprSizeJ] // vocab tiles * N
s_lshl_b32 s54, s56, 2 // max plane bytes
s_lshl_b32 s56, s56, 3 // target plane offset after max and sum
s_add_u32 s54, s58, s54 // sum plane offset for this vocab tile
s_lshl_b32 s60, s[sgprWorkGroup0], 8 // q * 256 vocab base
s_mov_b32 s61, 256
buffer_load_dword v152, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0
buffer_load_dword v153, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:32
buffer_load_dword v154, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:64
buffer_load_dword v155, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:96
buffer_load_dword v156, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:128
buffer_load_dword v157, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:160
buffer_load_dword v158, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:192
buffer_load_dword v159, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:224
// Local and row-wide maxima for eight token positions.
v_mov_b32 v128, v0
v_max_f32 v128, v128, v4
v_max_f32 v128, v128, v8
v_max_f32 v128, v128, v12
v_max_f32 v128, v128, v16
v_max_f32 v128, v128, v20
v_max_f32 v128, v128, v24
v_max_f32 v128, v128, v28
v_max_f32 v128, v128, v32
v_max_f32 v128, v128, v36
v_max_f32 v128, v128, v40
v_max_f32 v128, v128, v44
v_max_f32 v128, v128, v48
v_max_f32 v128, v128, v52
v_max_f32 v128, v128, v56
v_max_f32 v128, v128, v60
v_mov_b32_e32 v151, v128
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v128, v128, v151
v_mov_b32_e32 v151, v128
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v128, v128, v151
v_mov_b32_e32 v150, v128
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v128, v128, v151
v_mov_b32_e32 v150, v128
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v128, v128, v151
v_mov_b32 v129, v1
v_max_f32 v129, v129, v5
v_max_f32 v129, v129, v9
v_max_f32 v129, v129, v13
v_max_f32 v129, v129, v17
v_max_f32 v129, v129, v21
v_max_f32 v129, v129, v25
v_max_f32 v129, v129, v29
v_max_f32 v129, v129, v33
v_max_f32 v129, v129, v37
v_max_f32 v129, v129, v41
v_max_f32 v129, v129, v45
v_max_f32 v129, v129, v49
v_max_f32 v129, v129, v53
v_max_f32 v129, v129, v57
v_max_f32 v129, v129, v61
v_mov_b32_e32 v151, v129
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v129, v129, v151
v_mov_b32_e32 v151, v129
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v129, v129, v151
v_mov_b32_e32 v150, v129
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v129, v129, v151
v_mov_b32_e32 v150, v129
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v129, v129, v151
v_mov_b32 v130, v2
v_max_f32 v130, v130, v6
v_max_f32 v130, v130, v10
v_max_f32 v130, v130, v14
v_max_f32 v130, v130, v18
v_max_f32 v130, v130, v22
v_max_f32 v130, v130, v26
v_max_f32 v130, v130, v30
v_max_f32 v130, v130, v34
v_max_f32 v130, v130, v38
v_max_f32 v130, v130, v42
v_max_f32 v130, v130, v46
v_max_f32 v130, v130, v50
v_max_f32 v130, v130, v54
v_max_f32 v130, v130, v58
v_max_f32 v130, v130, v62
v_mov_b32_e32 v151, v130
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v130, v130, v151
v_mov_b32_e32 v151, v130
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v130, v130, v151
v_mov_b32_e32 v150, v130
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v130, v130, v151
v_mov_b32_e32 v150, v130
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v130, v130, v151
v_mov_b32 v131, v3
v_max_f32 v131, v131, v7
v_max_f32 v131, v131, v11
v_max_f32 v131, v131, v15
v_max_f32 v131, v131, v19
v_max_f32 v131, v131, v23
v_max_f32 v131, v131, v27
v_max_f32 v131, v131, v31
v_max_f32 v131, v131, v35
v_max_f32 v131, v131, v39
v_max_f32 v131, v131, v43
v_max_f32 v131, v131, v47
v_max_f32 v131, v131, v51
v_max_f32 v131, v131, v55
v_max_f32 v131, v131, v59
v_max_f32 v131, v131, v63
v_mov_b32_e32 v151, v131
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v131, v131, v151
v_mov_b32_e32 v151, v131
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v131, v131, v151
v_mov_b32_e32 v150, v131
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v131, v131, v151
v_mov_b32_e32 v150, v131
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v131, v131, v151
v_mov_b32 v132, v64
v_max_f32 v132, v132, v68
v_max_f32 v132, v132, v72
v_max_f32 v132, v132, v76
v_max_f32 v132, v132, v80
v_max_f32 v132, v132, v84
v_max_f32 v132, v132, v88
v_max_f32 v132, v132, v92
v_max_f32 v132, v132, v96
v_max_f32 v132, v132, v100
v_max_f32 v132, v132, v104
v_max_f32 v132, v132, v108
v_max_f32 v132, v132, v112
v_max_f32 v132, v132, v116
v_max_f32 v132, v132, v120
v_max_f32 v132, v132, v124
v_mov_b32_e32 v151, v132
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v132, v132, v151
v_mov_b32_e32 v151, v132
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v132, v132, v151
v_mov_b32_e32 v150, v132
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v132, v132, v151
v_mov_b32_e32 v150, v132
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v132, v132, v151
v_mov_b32 v133, v65
v_max_f32 v133, v133, v69
v_max_f32 v133, v133, v73
v_max_f32 v133, v133, v77
v_max_f32 v133, v133, v81
v_max_f32 v133, v133, v85
v_max_f32 v133, v133, v89
v_max_f32 v133, v133, v93
v_max_f32 v133, v133, v97
v_max_f32 v133, v133, v101
v_max_f32 v133, v133, v105
v_max_f32 v133, v133, v109
v_max_f32 v133, v133, v113
v_max_f32 v133, v133, v117
v_max_f32 v133, v133, v121
v_max_f32 v133, v133, v125
v_mov_b32_e32 v151, v133
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v133, v133, v151
v_mov_b32_e32 v151, v133
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v133, v133, v151
v_mov_b32_e32 v150, v133
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v133, v133, v151
v_mov_b32_e32 v150, v133
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v133, v133, v151
v_mov_b32 v134, v66
v_max_f32 v134, v134, v70
v_max_f32 v134, v134, v74
v_max_f32 v134, v134, v78
v_max_f32 v134, v134, v82
v_max_f32 v134, v134, v86
v_max_f32 v134, v134, v90
v_max_f32 v134, v134, v94
v_max_f32 v134, v134, v98
v_max_f32 v134, v134, v102
v_max_f32 v134, v134, v106
v_max_f32 v134, v134, v110
v_max_f32 v134, v134, v114
v_max_f32 v134, v134, v118
v_max_f32 v134, v134, v122
v_max_f32 v134, v134, v126
v_mov_b32_e32 v151, v134
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v134, v134, v151
v_mov_b32_e32 v151, v134
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v134, v134, v151
v_mov_b32_e32 v150, v134
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v134, v134, v151
v_mov_b32_e32 v150, v134
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v134, v134, v151
v_mov_b32 v135, v67
v_max_f32 v135, v135, v71
v_max_f32 v135, v135, v75
v_max_f32 v135, v135, v79
v_max_f32 v135, v135, v83
v_max_f32 v135, v135, v87
v_max_f32 v135, v135, v91
v_max_f32 v135, v135, v95
v_max_f32 v135, v135, v99
v_max_f32 v135, v135, v103
v_max_f32 v135, v135, v107
v_max_f32 v135, v135, v111
v_max_f32 v135, v135, v115
v_max_f32 v135, v135, v119
v_max_f32 v135, v135, v123
v_max_f32 v135, v135, v127
v_mov_b32_e32 v151, v135
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v135, v135, v151
v_mov_b32_e32 v151, v135
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_max_f32_e32 v135, v135, v151
v_mov_b32_e32 v150, v135
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_max_f32_e32 v135, v135, v151
v_mov_b32_e32 v150, v135
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_max_f32_e32 v135, v135, v151
// Stable local exp2 sums, followed by the same 16-lane reduction.
v_mov_b32 v136, 0
v_sub_f32 v151, v0, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v4, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v8, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v12, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v16, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v20, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v24, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v28, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v32, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v36, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v40, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v44, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v48, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v52, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v56, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_sub_f32 v151, v60, v128
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v136, v136, v151
v_mov_b32_e32 v151, v136
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v136, v136, v151
v_mov_b32_e32 v151, v136
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v136, v136, v151
v_mov_b32_e32 v150, v136
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v136, v136, v151
v_mov_b32_e32 v150, v136
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v136, v136, v151
v_mov_b32 v137, 0
v_sub_f32 v151, v1, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v5, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v9, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v13, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v17, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v21, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v25, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v29, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v33, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v37, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v41, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v45, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v49, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v53, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v57, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_sub_f32 v151, v61, v129
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v137, v137, v151
v_mov_b32_e32 v151, v137
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v137, v137, v151
v_mov_b32_e32 v151, v137
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v137, v137, v151
v_mov_b32_e32 v150, v137
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v137, v137, v151
v_mov_b32_e32 v150, v137
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v137, v137, v151
v_mov_b32 v138, 0
v_sub_f32 v151, v2, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v6, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v10, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v14, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v18, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v22, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v26, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v30, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v34, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v38, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v42, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v46, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v50, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v54, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v58, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_sub_f32 v151, v62, v130
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v138, v138, v151
v_mov_b32_e32 v151, v138
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v138, v138, v151
v_mov_b32_e32 v151, v138
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v138, v138, v151
v_mov_b32_e32 v150, v138
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v138, v138, v151
v_mov_b32_e32 v150, v138
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v138, v138, v151
v_mov_b32 v139, 0
v_sub_f32 v151, v3, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v7, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v11, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v15, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v19, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v23, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v27, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v31, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v35, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v39, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v43, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v47, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v51, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v55, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v59, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_sub_f32 v151, v63, v131
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v139, v139, v151
v_mov_b32_e32 v151, v139
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v139, v139, v151
v_mov_b32_e32 v151, v139
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v139, v139, v151
v_mov_b32_e32 v150, v139
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v139, v139, v151
v_mov_b32_e32 v150, v139
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v139, v139, v151
v_mov_b32 v140, 0
v_sub_f32 v151, v64, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v68, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v72, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v76, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v80, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v84, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v88, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v92, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v96, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v100, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v104, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v108, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v112, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v116, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v120, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_sub_f32 v151, v124, v132
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v140, v140, v151
v_mov_b32_e32 v151, v140
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v140, v140, v151
v_mov_b32_e32 v151, v140
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v140, v140, v151
v_mov_b32_e32 v150, v140
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v140, v140, v151
v_mov_b32_e32 v150, v140
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v140, v140, v151
v_mov_b32 v141, 0
v_sub_f32 v151, v65, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v69, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v73, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v77, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v81, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v85, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v89, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v93, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v97, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v101, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v105, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v109, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v113, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v117, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v121, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_sub_f32 v151, v125, v133
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v141, v141, v151
v_mov_b32_e32 v151, v141
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v141, v141, v151
v_mov_b32_e32 v151, v141
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v141, v141, v151
v_mov_b32_e32 v150, v141
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v141, v141, v151
v_mov_b32_e32 v150, v141
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v141, v141, v151
v_mov_b32 v142, 0
v_sub_f32 v151, v66, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v70, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v74, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v78, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v82, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v86, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v90, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v94, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v98, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v102, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v106, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v110, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v114, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v118, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v122, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_sub_f32 v151, v126, v134
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v142, v142, v151
v_mov_b32_e32 v151, v142
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v142, v142, v151
v_mov_b32_e32 v151, v142
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v142, v142, v151
v_mov_b32_e32 v150, v142
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v142, v142, v151
v_mov_b32_e32 v150, v142
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v142, v142, v151
v_mov_b32 v143, 0
v_sub_f32 v151, v67, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v71, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v75, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v79, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v83, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v87, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v91, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v95, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v99, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v103, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v107, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v111, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v115, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v119, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v123, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_sub_f32 v151, v127, v135
v_mul_f32 v151, 0x3fb8aa3b, v151
s_nop 0 // gfx936 VALU-to-quarter-rate-SPF dependency
v_exp_f32 v151, v151
v_add_f32 v143, v143, v151
v_mov_b32_e32 v151, v143
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[1,0,3,2] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v143, v143, v151
v_mov_b32_e32 v151, v143
s_nop 1
v_mov_b32_dpp v151, v151 quad_perm:[2,3,0,1] row_mask:0xf bank_mask:0xf
v_add_f32_e32 v143, v143, v151
v_mov_b32_e32 v150, v143
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:4 row_mask:0xf bank_mask:0xa
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:4 row_mask:0xf bank_mask:0x5
v_add_f32_e32 v143, v143, v151
v_mov_b32_e32 v150, v143
v_mov_b32_e32 v151, v150
s_nop 1
v_mov_b32_dpp v151, v151 row_shr:8 row_mask:0xf bank_mask:0xc
s_nop 1
v_mov_b32_dpp v151, v150 row_shl:8 row_mask:0xf bank_mask:0x3
v_add_f32_e32 v143, v143, v151
s_waitcnt vmcnt(0)
// One lane per 16-lane row writes max/sum partials.
v_cmp_eq_u32 s[80:81], v145, 0
s_and_saveexec_b64 s[82:83], s[80:81]
buffer_store_dword v128, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:0
buffer_store_dword v136, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:0
buffer_store_dword v129, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:16
buffer_store_dword v137, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:16
buffer_store_dword v130, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:32
buffer_store_dword v138, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:32
buffer_store_dword v131, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:48
buffer_store_dword v139, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:48
buffer_store_dword v132, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:64
buffer_store_dword v140, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:64
buffer_store_dword v133, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:80
buffer_store_dword v141, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:80
buffer_store_dword v134, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:96
buffer_store_dword v142, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:96
buffer_store_dword v135, v144, s[sgprSrdD:sgprSrdD+3], s58, offen, offset:112
buffer_store_dword v143, v144, s[sgprSrdD:sgprSrdD+3], s54, offen, offset:112
s_mov_b64 exec, s[82:83]
// Exactly one matching lane/tile writes each non-ignored target logit.
v_sub_u32 v147, v152, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v0
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v4, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v8, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v12, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v16, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v20, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v24, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v28, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v32, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v36, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v40, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v44, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v48, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v52, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v56, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v60, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:0
s_mov_b64 exec, s[84:85]
v_sub_u32 v147, v153, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v1
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v5, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v9, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v13, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v17, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v21, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v25, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v29, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v33, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v37, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v41, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v45, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v49, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v53, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v57, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v61, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:16
s_mov_b64 exec, s[84:85]
v_sub_u32 v147, v154, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v2
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v6, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v10, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v14, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v18, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v22, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v26, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v30, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v34, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v38, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v42, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v46, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v50, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v54, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v58, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v62, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:32
s_mov_b64 exec, s[84:85]
v_sub_u32 v147, v155, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v3
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v7, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v11, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v15, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v19, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v23, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v27, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v31, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v35, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v39, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v43, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v47, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v51, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v55, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v59, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v63, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:48
s_mov_b64 exec, s[84:85]
v_sub_u32 v147, v156, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v64
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v68, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v72, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v76, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v80, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v84, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v88, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v92, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v96, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v100, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v104, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v108, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v112, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v116, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v120, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v124, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:64
s_mov_b64 exec, s[84:85]
v_sub_u32 v147, v157, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v65
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v69, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v73, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v77, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v81, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v85, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v89, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v93, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v97, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v101, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v105, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v109, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v113, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v117, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v121, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v125, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:80
s_mov_b64 exec, s[84:85]
v_sub_u32 v147, v158, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v66
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v70, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v74, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v78, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v82, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v86, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v90, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v94, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v98, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v102, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v106, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v110, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v114, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v118, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v122, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v126, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:96
s_mov_b64 exec, s[84:85]
v_sub_u32 v147, v159, s60
v_and_b32 v148, 15, v147
v_lshrrev_b32 v149, 4, v147
v_mov_b32 v150, v67
v_cmp_eq_u32 s[80:81], v149, 1
v_cndmask_b32 v150, v150, v71, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 2
v_cndmask_b32 v150, v150, v75, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 3
v_cndmask_b32 v150, v150, v79, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 4
v_cndmask_b32 v150, v150, v83, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 5
v_cndmask_b32 v150, v150, v87, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 6
v_cndmask_b32 v150, v150, v91, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 7
v_cndmask_b32 v150, v150, v95, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 8
v_cndmask_b32 v150, v150, v99, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 9
v_cndmask_b32 v150, v150, v103, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 10
v_cndmask_b32 v150, v150, v107, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 11
v_cndmask_b32 v150, v150, v111, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 12
v_cndmask_b32 v150, v150, v115, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 13
v_cndmask_b32 v150, v150, v119, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 14
v_cndmask_b32 v150, v150, v123, s[80:81]
v_cmp_eq_u32 s[80:81], v149, 15
v_cndmask_b32 v150, v150, v127, s[80:81]
v_cmp_eq_u32 s[80:81], v145, v148
v_cmp_lt_u32 s[82:83], v147, s61
s_and_b64 s[80:81], s[80:81], s[82:83]
s_and_saveexec_b64 s[84:85], s[80:81]
buffer_store_dword v150, v144, s[sgprSrdD:sgprSrdD+3], s56, offen, offset:112
s_mov_b64 exec, s[84:85]
s_waitcnt vmcnt(0)
/* linked_family2256_PARTIAL_PRODUCER_END */
s_endpgm
OptNLL_End_14_flag:
/* not-LocalSplitU: global write indices */

/* computeStoreVgprs */
v_and_b32 v128, 63, v[vgprSerial]                  // v0 = v[vgprSerial] & 63
v_lshrrev_b32 v129, 6, v[vgprSerial]               // v4 = v[vgprSerial] / 64
v_and_b32 v132, 15, v128                           // v5 = v0 & 15
v_lshrrev_b32 v133, 4, v128                        // v3 = v0 / 16
v_and_b32 v134, 0, v129                            // v4&1
s_mov_b32 s54, 32                                 //
v_mul_lo_u32 v134, s54, v134                       //
v_lshlrev_b32 v128, 0, v132                        // ((v[vgprSerial]&63)&15)*2
_v_add_co_u32 v128, vcc, v128, v134                // row
v_lshrrev_b32 v134, 0, v129                        // v4>>1
s_mov_b32 s54, 32                                  //
v_mul_lo_u32 v134, s54, v134                       //
v_lshlrev_b32 v129, 0, v133                        // ((v[vgprSerial]&63)&15)*2
_v_add_co_u32 v129, vcc, v129, v134                // col
s_mul_i32 s[sgprStrideoffC+0], 8, s[sgprStridesC]  //
s_mul_i32 s[sgprStrideoffC+1], 16, s[sgprStridesC] //
s_mul_i32 s[sgprStrideoffC+2], 24, s[sgprStridesC] //
s_mul_i32 s[sgprStrideoffD+0], 8, s[sgprStridesD]  //
s_mul_i32 s[sgprStrideoffD+1], 16, s[sgprStridesD] //
s_mul_i32 s[sgprStrideoffD+2], 24, s[sgprStridesD] //
v_mul_lo_u32 v130, v129, s[sgprStrideC1J]          // rowStart vgpr
v_mul_lo_u32 v131, v129, s[sgprStrideD1J]          // rowStart vgpr

s_mul_i32 s54, 0x100, s[sgprWorkGroup0]            // s54 = wg0*MT0
_v_add_co_u32 v128, vcc, s54, v128                 // coord0 = tid0*VW + wg0*MT0
s_mul_i32 s56, 0x100, s[sgprWorkGroup1]            // <- wg1*MT1
_v_add_co_u32 v129, vcc, s56, v129                 // coord1 = tid1*VW + wg1*MT1

v_mov_b32 v250, 0x7fff0000                         // fp32 Nan
v_mov_b32 v251, 0x7fff                             // rounding bias for bfloat16

//N=0
_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cmp_lt_u32 s[60:61], v129, s[sgprSizeJ]          // coord1 < size1

s_mov_b64 exec,s[60:61]
FP32_TO_BF16 vgprValuC+0     // convert C to bf16
buffer_store_short v0, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+4     // convert C to bf16
buffer_store_short v4, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+8     // convert C to bf16
buffer_store_short v8, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+12     // convert C to bf16
buffer_store_short v12, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+16     // convert C to bf16
buffer_store_short v16, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+20     // convert C to bf16
buffer_store_short v20, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+24     // convert C to bf16
buffer_store_short v24, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+28     // convert C to bf16
buffer_store_short v28, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+32     // convert C to bf16
buffer_store_short v32, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+36     // convert C to bf16
buffer_store_short v36, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+40     // convert C to bf16
buffer_store_short v40, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+44     // convert C to bf16
buffer_store_short v44, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+48     // convert C to bf16
buffer_store_short v48, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+52     // convert C to bf16
buffer_store_short v52, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+56     // convert C to bf16
buffer_store_short v56, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+60     // convert C to bf16
buffer_store_short v60, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

v_add_co_u32 v134, vcc, s[sgprStrideoffD+0], v134  // add 4* loop offset
v_add_u32 v133, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1

s_mov_b64 exec,s[62:63]
FP32_TO_BF16 vgprValuC+1     // convert C to bf16
buffer_store_short v1, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+5     // convert C to bf16
buffer_store_short v5, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+9     // convert C to bf16
buffer_store_short v9, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+13     // convert C to bf16
buffer_store_short v13, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+17     // convert C to bf16
buffer_store_short v17, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+21     // convert C to bf16
buffer_store_short v21, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+25     // convert C to bf16
buffer_store_short v25, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+29     // convert C to bf16
buffer_store_short v29, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+33     // convert C to bf16
buffer_store_short v33, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+37     // convert C to bf16
buffer_store_short v37, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+41     // convert C to bf16
buffer_store_short v41, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+45     // convert C to bf16
buffer_store_short v45, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+49     // convert C to bf16
buffer_store_short v49, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+53     // convert C to bf16
buffer_store_short v53, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+57     // convert C to bf16
buffer_store_short v57, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+61     // convert C to bf16
buffer_store_short v61, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprStrideoffD+1], v134  // add 4* loop offset
v_add_u32 v133, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1

s_mov_b64 exec,s[64:65]
FP32_TO_BF16 vgprValuC+2     // convert C to bf16
buffer_store_short v2, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+6     // convert C to bf16
buffer_store_short v6, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+10     // convert C to bf16
buffer_store_short v10, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+14     // convert C to bf16
buffer_store_short v14, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+18     // convert C to bf16
buffer_store_short v18, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+22     // convert C to bf16
buffer_store_short v22, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+26     // convert C to bf16
buffer_store_short v26, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+30     // convert C to bf16
buffer_store_short v30, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+34     // convert C to bf16
buffer_store_short v34, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+38     // convert C to bf16
buffer_store_short v38, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+42     // convert C to bf16
buffer_store_short v42, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+46     // convert C to bf16
buffer_store_short v46, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+50     // convert C to bf16
buffer_store_short v50, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+54     // convert C to bf16
buffer_store_short v54, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+58     // convert C to bf16
buffer_store_short v58, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+62     // convert C to bf16
buffer_store_short v62, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprStrideoffD+2], v134  // add 4* loop offset
v_add_u32 v133, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1

s_mov_b64 exec,s[66:67]
FP32_TO_BF16 vgprValuC+3     // convert C to bf16
buffer_store_short v3, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+7     // convert C to bf16
buffer_store_short v7, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+11     // convert C to bf16
buffer_store_short v11, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+15     // convert C to bf16
buffer_store_short v15, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+19     // convert C to bf16
buffer_store_short v19, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+23     // convert C to bf16
buffer_store_short v23, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+27     // convert C to bf16
buffer_store_short v27, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+31     // convert C to bf16
buffer_store_short v31, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+35     // convert C to bf16
buffer_store_short v35, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+39     // convert C to bf16
buffer_store_short v39, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+43     // convert C to bf16
buffer_store_short v43, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+47     // convert C to bf16
buffer_store_short v47, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+51     // convert C to bf16
buffer_store_short v51, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+55     // convert C to bf16
buffer_store_short v55, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+59     // convert C to bf16
buffer_store_short v59, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+63     // convert C to bf16
buffer_store_short v63, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

_v_add_lshl_u32 v134, v131, v128, 0x1              //
s_mul_i32 s54, s[sgprStrideD1J], 32                // scale StrideD *= numRows(16) * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s54       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)


v_add_u32 v133, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_mov_b64 exec,s[68:69]
FP32_TO_BF16 vgprValuC+64     // convert C to bf16
buffer_store_short v64, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+68     // convert C to bf16
buffer_store_short v68, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+72     // convert C to bf16
buffer_store_short v72, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+76     // convert C to bf16
buffer_store_short v76, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+80     // convert C to bf16
buffer_store_short v80, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+84     // convert C to bf16
buffer_store_short v84, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+88     // convert C to bf16
buffer_store_short v88, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+92     // convert C to bf16
buffer_store_short v92, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+96     // convert C to bf16
buffer_store_short v96, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+100     // convert C to bf16
buffer_store_short v100, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+104     // convert C to bf16
buffer_store_short v104, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+108     // convert C to bf16
buffer_store_short v108, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+112     // convert C to bf16
buffer_store_short v112, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+116     // convert C to bf16
buffer_store_short v116, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+120     // convert C to bf16
buffer_store_short v120, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+124     // convert C to bf16
buffer_store_short v124, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprStrideoffD+0], v134  // add 4* loop offset
v_add_u32 v133, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1

s_mov_b64 exec,s[70:71]
FP32_TO_BF16 vgprValuC+65     // convert C to bf16
buffer_store_short v65, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+69     // convert C to bf16
buffer_store_short v69, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+73     // convert C to bf16
buffer_store_short v73, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+77     // convert C to bf16
buffer_store_short v77, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+81     // convert C to bf16
buffer_store_short v81, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+85     // convert C to bf16
buffer_store_short v85, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+89     // convert C to bf16
buffer_store_short v89, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+93     // convert C to bf16
buffer_store_short v93, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+97     // convert C to bf16
buffer_store_short v97, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+101     // convert C to bf16
buffer_store_short v101, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+105     // convert C to bf16
buffer_store_short v105, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+109     // convert C to bf16
buffer_store_short v109, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+113     // convert C to bf16
buffer_store_short v113, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+117     // convert C to bf16
buffer_store_short v117, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+121     // convert C to bf16
buffer_store_short v121, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+125     // convert C to bf16
buffer_store_short v125, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprStrideoffD+1], v134  // add 4* loop offset
v_add_u32 v133, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1

s_mov_b64 exec,s[72:73]
FP32_TO_BF16 vgprValuC+66     // convert C to bf16
buffer_store_short v66, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+70     // convert C to bf16
buffer_store_short v70, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+74     // convert C to bf16
buffer_store_short v74, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+78     // convert C to bf16
buffer_store_short v78, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+82     // convert C to bf16
buffer_store_short v82, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+86     // convert C to bf16
buffer_store_short v86, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+90     // convert C to bf16
buffer_store_short v90, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+94     // convert C to bf16
buffer_store_short v94, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+98     // convert C to bf16
buffer_store_short v98, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+102     // convert C to bf16
buffer_store_short v102, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+106     // convert C to bf16
buffer_store_short v106, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+110     // convert C to bf16
buffer_store_short v110, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+114     // convert C to bf16
buffer_store_short v114, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+118     // convert C to bf16
buffer_store_short v118, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+122     // convert C to bf16
buffer_store_short v122, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+126     // convert C to bf16
buffer_store_short v126, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprStrideoffD+2], v134  // add 4* loop offset
v_add_u32 v133, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1

s_mov_b64 exec,s[74:75]
FP32_TO_BF16 vgprValuC+67     // convert C to bf16
buffer_store_short v67, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+71     // convert C to bf16
buffer_store_short v71, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x20 // store D
FP32_TO_BF16 vgprValuC+75     // convert C to bf16
buffer_store_short v75, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x40 // store D
FP32_TO_BF16 vgprValuC+79     // convert C to bf16
buffer_store_short v79, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x60 // store D
FP32_TO_BF16 vgprValuC+83     // convert C to bf16
buffer_store_short v83, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x80 // store D
FP32_TO_BF16 vgprValuC+87     // convert C to bf16
buffer_store_short v87, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xa0 // store D
FP32_TO_BF16 vgprValuC+91     // convert C to bf16
buffer_store_short v91, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xc0 // store D
FP32_TO_BF16 vgprValuC+95     // convert C to bf16
buffer_store_short v95, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0xe0 // store D
FP32_TO_BF16 vgprValuC+99     // convert C to bf16
buffer_store_short v99, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x100 // store D
FP32_TO_BF16 vgprValuC+103     // convert C to bf16
buffer_store_short v103, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x120 // store D
FP32_TO_BF16 vgprValuC+107     // convert C to bf16
buffer_store_short v107, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x140 // store D
FP32_TO_BF16 vgprValuC+111     // convert C to bf16
buffer_store_short v111, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x160 // store D
FP32_TO_BF16 vgprValuC+115     // convert C to bf16
buffer_store_short v115, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x180 // store D
FP32_TO_BF16 vgprValuC+119     // convert C to bf16
buffer_store_short v119, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1a0 // store D
FP32_TO_BF16 vgprValuC+123     // convert C to bf16
buffer_store_short v123, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1c0 // store D
FP32_TO_BF16 vgprValuC+127     // convert C to bf16
buffer_store_short v127, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0x1e0 // store D
s_mov_b64 exec, 0xFFFFFFFFFFFFFFFF

s_endpgm

OptNLL_End_14:


/******************************************/
/* Ord. NoLoadLoop - Begin                */
/******************************************/

PrefetchGlobalLastIterEnd_4:


/******************************************/
/* Tail Loop                              */
/******************************************/
s_cmp_le_i32 s[sgprWaveiD], 7
s_cbranch_scc0 label_0039

s_barrier

s_cmp_eq_u32 s[sgprShadowLimitB_forTailLoop+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB_forTailLoop+0]    // Move shadow to real if we are within 2^32

s_mov_b64 s[sgprSrdA+0:sgprSrdA+1], s[sgprSrdA_forTailLoop+0:sgprSrdA_forTailLoop+1]
s_mov_b64 s[sgprSrdA+2:sgprSrdA+3], s[sgprSrdA_forTailLoop+2:sgprSrdA_forTailLoop+3]

/* local write reset offsets a */



/* local write reset offsets b */



//numIterL = (((sizeL % LOCAL_DEPTHU) + LOCAL_SPLITU - 1) / LOCAL_SPLITU)
s_and_b32 s[sgprLoopCounterL], 63, s[sgprSizesSum+0] // s[sgprLoopCounterL] = s[sgprSizesSum+0] % 64
s_cmp_eq_u32 s[sgprLoopCounterL], 0x0              // numIterL == 0
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment
s_cbranch_scc1 SkipTailLoopL_7                     // skip to end of tail loop b/c numIter==0

s_and_b32  s64, 7, s[sgprWaveiD]
s_lshr_b32 s64, s64, 2                             //
s_lshl_b32 s64, s64, 8                             //

s_mul_i32  s65, s64, 64
s_mul_i32  s64, s64, s[sgprStrideA0I]

v_add_co_u32 v[vgprGlobalReadOffsetA+0], vcc, s64, v[vgprGlobalReadOffsetA+0]
v_add_co_u32 v[vgprGlobalReadOffsetA+1], vcc, s64, v[vgprGlobalReadOffsetA+1]
v_add_co_u32 v[vgprGlobalReadOffsetA+2], vcc, s64, v[vgprGlobalReadOffsetA+2]
v_add_co_u32 v[vgprGlobalReadOffsetA+3], vcc, s64, v[vgprGlobalReadOffsetA+3]

v_add_co_u32 v[vgprLocalWriteAddrA], vcc, s65, v[vgprLocalWriteAddrA]


v_and_b32 v[vgprG2LA+0], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+0], 3, v[vgprG2LA+0]      //
v_add_co_u32 v[vgprG2LA+0], vcc, 0, v[vgprG2LA+0]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+0], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+0], vcc, 0, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v[vgprG2LA+0], -0x1, v[vgprG2LA+0], s[64:65] //
v_and_b32 v201, v[vgprSerial], 7                   //
v_lshlrev_b32 v201, 3, v201                        //
v_add_co_u32 v201, vcc, 1, v201                    //
v_cmp_lt_u32 s[64:65], v201, s[sgprLoopCounterL]   //
v_add_co_u32 v201, vcc, 2, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v201, -0x1, v201, s[64:65]           //
v_and_b32 v[vgprG2LA+1], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+1], 3, v[vgprG2LA+1]      //
v_add_co_u32 v[vgprG2LA+1], vcc, 2, v[vgprG2LA+1]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+1], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+1], vcc, 4, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v[vgprG2LA+1], -0x1, v[vgprG2LA+1], s[64:65] //
v_and_b32 v202, v[vgprSerial], 7                   //
v_lshlrev_b32 v202, 3, v202                        //
v_add_co_u32 v202, vcc, 3, v202                    //
v_cmp_lt_u32 s[64:65], v202, s[sgprLoopCounterL]   //
v_add_co_u32 v202, vcc, 6, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v202, -0x1, v202, s[64:65]           //
v_and_b32 v[vgprG2LA+2], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+2], 3, v[vgprG2LA+2]      //
v_add_co_u32 v[vgprG2LA+2], vcc, 4, v[vgprG2LA+2]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+2], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+2], vcc, 8, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v[vgprG2LA+2], -0x1, v[vgprG2LA+2], s[64:65] //
v_and_b32 v203, v[vgprSerial], 7                   //
v_lshlrev_b32 v203, 3, v203                        //
v_add_co_u32 v203, vcc, 5, v203                    //
v_cmp_lt_u32 s[64:65], v203, s[sgprLoopCounterL]   //
v_add_co_u32 v203, vcc, 10, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v203, -0x1, v203, s[64:65]           //
v_and_b32 v[vgprG2LA+3], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+3], 3, v[vgprG2LA+3]      //
v_add_co_u32 v[vgprG2LA+3], vcc, 6, v[vgprG2LA+3]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+3], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+3], vcc, 12, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v[vgprG2LA+3], -0x1, v[vgprG2LA+3], s[64:65] //
v_and_b32 v204, v[vgprSerial], 7                   //
v_lshlrev_b32 v204, 3, v204                        //
v_add_co_u32 v204, vcc, 7, v204                    //
v_cmp_lt_u32 s[64:65], v204, s[sgprLoopCounterL]   //
v_add_co_u32 v204, vcc, 14, v[vgprGlobalReadOffsetA+0] //
v_cndmask_b32 v204, -0x1, v204, s[64:65]           //

v_and_b32 v[vgprG2LA+4], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+4], 3, v[vgprG2LA+4]      //
v_add_co_u32 v[vgprG2LA+4], vcc, 0, v[vgprG2LA+4]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+4], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+4], vcc, 0, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v[vgprG2LA+4], -0x1, v[vgprG2LA+4], s[64:65] //
v_and_b32 v205, v[vgprSerial], 7                   //
v_lshlrev_b32 v205, 3, v205                        //
v_add_co_u32 v205, vcc, 1, v205                    //
v_cmp_lt_u32 s[64:65], v205, s[sgprLoopCounterL]   //
v_add_co_u32 v205, vcc, 2, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v205, -0x1, v205, s[64:65]           //
v_and_b32 v[vgprG2LA+5], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+5], 3, v[vgprG2LA+5]      //
v_add_co_u32 v[vgprG2LA+5], vcc, 2, v[vgprG2LA+5]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+5], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+5], vcc, 4, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v[vgprG2LA+5], -0x1, v[vgprG2LA+5], s[64:65] //
v_and_b32 v206, v[vgprSerial], 7                   //
v_lshlrev_b32 v206, 3, v206                        //
v_add_co_u32 v206, vcc, 3, v206                    //
v_cmp_lt_u32 s[64:65], v206, s[sgprLoopCounterL]   //
v_add_co_u32 v206, vcc, 6, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v206, -0x1, v206, s[64:65]           //
v_and_b32 v[vgprG2LA+6], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+6], 3, v[vgprG2LA+6]      //
v_add_co_u32 v[vgprG2LA+6], vcc, 4, v[vgprG2LA+6]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+6], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+6], vcc, 8, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v[vgprG2LA+6], -0x1, v[vgprG2LA+6], s[64:65] //
v_and_b32 v207, v[vgprSerial], 7                   //
v_lshlrev_b32 v207, 3, v207                        //
v_add_co_u32 v207, vcc, 5, v207                    //
v_cmp_lt_u32 s[64:65], v207, s[sgprLoopCounterL]   //
v_add_co_u32 v207, vcc, 10, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v207, -0x1, v207, s[64:65]           //
v_and_b32 v[vgprG2LA+7], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+7], 3, v[vgprG2LA+7]      //
v_add_co_u32 v[vgprG2LA+7], vcc, 6, v[vgprG2LA+7]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+7], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+7], vcc, 12, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v[vgprG2LA+7], -0x1, v[vgprG2LA+7], s[64:65] //
v_and_b32 v208, v[vgprSerial], 7                   //
v_lshlrev_b32 v208, 3, v208                        //
v_add_co_u32 v208, vcc, 7, v208                    //
v_cmp_lt_u32 s[64:65], v208, s[sgprLoopCounterL]   //
v_add_co_u32 v208, vcc, 14, v[vgprGlobalReadOffsetA+1] //
v_cndmask_b32 v208, -0x1, v208, s[64:65]           //

v_and_b32 v[vgprG2LA+8], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+8], 3, v[vgprG2LA+8]      //
v_add_co_u32 v[vgprG2LA+8], vcc, 0, v[vgprG2LA+8]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+8], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+8], vcc, 0, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v[vgprG2LA+8], -0x1, v[vgprG2LA+8], s[64:65] //
v_and_b32 v209, v[vgprSerial], 7                   //
v_lshlrev_b32 v209, 3, v209                        //
v_add_co_u32 v209, vcc, 1, v209                    //
v_cmp_lt_u32 s[64:65], v209, s[sgprLoopCounterL]   //
v_add_co_u32 v209, vcc, 2, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v209, -0x1, v209, s[64:65]           //
v_and_b32 v[vgprG2LA+9], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+9], 3, v[vgprG2LA+9]      //
v_add_co_u32 v[vgprG2LA+9], vcc, 2, v[vgprG2LA+9]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+9], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+9], vcc, 4, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v[vgprG2LA+9], -0x1, v[vgprG2LA+9], s[64:65] //
v_and_b32 v210, v[vgprSerial], 7                   //
v_lshlrev_b32 v210, 3, v210                        //
v_add_co_u32 v210, vcc, 3, v210                    //
v_cmp_lt_u32 s[64:65], v210, s[sgprLoopCounterL]   //
v_add_co_u32 v210, vcc, 6, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v210, -0x1, v210, s[64:65]           //
v_and_b32 v[vgprG2LA+10], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+10], 3, v[vgprG2LA+10]      //
v_add_co_u32 v[vgprG2LA+10], vcc, 4, v[vgprG2LA+10]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+10], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+10], vcc, 8, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v[vgprG2LA+10], -0x1, v[vgprG2LA+10], s[64:65] //
v_and_b32 v211, v[vgprSerial], 7                   //
v_lshlrev_b32 v211, 3, v211                        //
v_add_co_u32 v211, vcc, 5, v211                    //
v_cmp_lt_u32 s[64:65], v211, s[sgprLoopCounterL]   //
v_add_co_u32 v211, vcc, 10, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v211, -0x1, v211, s[64:65]           //
v_and_b32 v[vgprG2LA+11], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+11], 3, v[vgprG2LA+11]      //
v_add_co_u32 v[vgprG2LA+11], vcc, 6, v[vgprG2LA+11]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+11], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+11], vcc, 12, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v[vgprG2LA+11], -0x1, v[vgprG2LA+11], s[64:65] //
v_and_b32 v212, v[vgprSerial], 7                   //
v_lshlrev_b32 v212, 3, v212                        //
v_add_co_u32 v212, vcc, 7, v212                    //
v_cmp_lt_u32 s[64:65], v212, s[sgprLoopCounterL]   //
v_add_co_u32 v212, vcc, 14, v[vgprGlobalReadOffsetA+2] //
v_cndmask_b32 v212, -0x1, v212, s[64:65]           //

v_and_b32 v[vgprG2LA+12], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+12], 3, v[vgprG2LA+12]      //
v_add_co_u32 v[vgprG2LA+12], vcc, 0, v[vgprG2LA+12]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+12], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+12], vcc, 0, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v[vgprG2LA+12], -0x1, v[vgprG2LA+12], s[64:65] //
v_and_b32 v213, v[vgprSerial], 7                   //
v_lshlrev_b32 v213, 3, v213                        //
v_add_co_u32 v213, vcc, 1, v213                    //
v_cmp_lt_u32 s[64:65], v213, s[sgprLoopCounterL]   //
v_add_co_u32 v213, vcc, 2, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v213, -0x1, v213, s[64:65]           //
v_and_b32 v[vgprG2LA+13], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+13], 3, v[vgprG2LA+13]      //
v_add_co_u32 v[vgprG2LA+13], vcc, 2, v[vgprG2LA+13]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+13], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+13], vcc, 4, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v[vgprG2LA+13], -0x1, v[vgprG2LA+13], s[64:65] //
v_and_b32 v214, v[vgprSerial], 7                   //
v_lshlrev_b32 v214, 3, v214                        //
v_add_co_u32 v214, vcc, 3, v214                    //
v_cmp_lt_u32 s[64:65], v214, s[sgprLoopCounterL]   //
v_add_co_u32 v214, vcc, 6, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v214, -0x1, v214, s[64:65]           //
v_and_b32 v[vgprG2LA+14], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+14], 3, v[vgprG2LA+14]      //
v_add_co_u32 v[vgprG2LA+14], vcc, 4, v[vgprG2LA+14]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+14], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+14], vcc, 8, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v[vgprG2LA+14], -0x1, v[vgprG2LA+14], s[64:65] //
v_and_b32 v215, v[vgprSerial], 7                   //
v_lshlrev_b32 v215, 3, v215                        //
v_add_co_u32 v215, vcc, 5, v215                    //
v_cmp_lt_u32 s[64:65], v215, s[sgprLoopCounterL]   //
v_add_co_u32 v215, vcc, 10, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v215, -0x1, v215, s[64:65]           //
v_and_b32 v[vgprG2LA+15], v[vgprSerial], 7          //
v_lshlrev_b32 v[vgprG2LA+15], 3, v[vgprG2LA+15]      //
v_add_co_u32 v[vgprG2LA+15], vcc, 6, v[vgprG2LA+15]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LA+15], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LA+15], vcc, 12, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v[vgprG2LA+15], -0x1, v[vgprG2LA+15], s[64:65] //
v_and_b32 v216, v[vgprSerial], 7                   //
v_lshlrev_b32 v216, 3, v216                        //
v_add_co_u32 v216, vcc, 7, v216                    //
v_cmp_lt_u32 s[64:65], v216, s[sgprLoopCounterL]   //
v_add_co_u32 v216, vcc, 14, v[vgprGlobalReadOffsetA+3] //
v_cndmask_b32 v216, -0x1, v216, s[64:65]           //


/* global read a */

/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LA+0+0], v[vgprG2LA+0+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v201, v201, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+0+0], v[vgprG2LA+0+0], v201 // HasEccHalf: pack
/* g2l=0, load component 2 */
buffer_load_short_d16 v[vgprG2LA+0+1], v[vgprG2LA+0+1], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 3 */
buffer_load_short_d16_hi v202, v202, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+0+1], v[vgprG2LA+0+1], v202 // HasEccHalf: pack
/* g2l=0, load component 4 */
buffer_load_short_d16 v[vgprG2LA+0+2], v[vgprG2LA+0+2], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 5 */
buffer_load_short_d16_hi v203, v203, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+0+2], v[vgprG2LA+0+2], v203 // HasEccHalf: pack
/* g2l=0, load component 6 */
buffer_load_short_d16 v[vgprG2LA+0+3], v[vgprG2LA+0+3], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 7 */
buffer_load_short_d16_hi v204, v204, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+0+3], v[vgprG2LA+0+3], v204 // HasEccHalf: pack
/* g2l=4, load component 0 */
buffer_load_short_d16 v[vgprG2LA+4+0], v[vgprG2LA+4+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 1 */
buffer_load_short_d16_hi v205, v205, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+4+0], v[vgprG2LA+4+0], v205 // HasEccHalf: pack
/* g2l=4, load component 2 */
buffer_load_short_d16 v[vgprG2LA+4+1], v[vgprG2LA+4+1], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 3 */
buffer_load_short_d16_hi v206, v206, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+4+1], v[vgprG2LA+4+1], v206 // HasEccHalf: pack
/* g2l=4, load component 4 */
buffer_load_short_d16 v[vgprG2LA+4+2], v[vgprG2LA+4+2], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 5 */
buffer_load_short_d16_hi v207, v207, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+4+2], v[vgprG2LA+4+2], v207 // HasEccHalf: pack
/* g2l=4, load component 6 */
buffer_load_short_d16 v[vgprG2LA+4+3], v[vgprG2LA+4+3], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 7 */
buffer_load_short_d16_hi v208, v208, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+4+3], v[vgprG2LA+4+3], v208 // HasEccHalf: pack

/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LA+8+0], v[vgprG2LA+8+0], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v209, v209, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+0], v[vgprG2LA+8+0], v209 // HasEccHalf: pack
/* g2l=0, load component 2 */
buffer_load_short_d16 v[vgprG2LA+8+1], v[vgprG2LA+8+1], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 3 */
buffer_load_short_d16_hi v210, v210, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+1], v[vgprG2LA+8+1], v210 // HasEccHalf: pack
/* g2l=0, load component 4 */
buffer_load_short_d16 v[vgprG2LA+8+2], v[vgprG2LA+8+2], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 5 */
buffer_load_short_d16_hi v211, v211, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+2], v[vgprG2LA+8+2], v211 // HasEccHalf: pack
/* g2l=0, load component 6 */
buffer_load_short_d16 v[vgprG2LA+8+3], v[vgprG2LA+8+3], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 7 */
buffer_load_short_d16_hi v212, v212, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+3], v[vgprG2LA+8+3], v212 // HasEccHalf: pack
/* g2l=4, load component 0 */
buffer_load_short_d16 v[vgprG2LA+8+4], v[vgprG2LA+8+4], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 1 */
buffer_load_short_d16_hi v213, v213, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+4], v[vgprG2LA+8+4], v213 // HasEccHalf: pack
/* g2l=4, load component 2 */
buffer_load_short_d16 v[vgprG2LA+8+5], v[vgprG2LA+8+5], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 3 */
buffer_load_short_d16_hi v214, v214, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+5], v[vgprG2LA+8+5], v214 // HasEccHalf: pack
/* g2l=4, load component 4 */
buffer_load_short_d16 v[vgprG2LA+8+6], v[vgprG2LA+8+6], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 5 */
buffer_load_short_d16_hi v215, v215, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+6], v[vgprG2LA+8+6], v215 // HasEccHalf: pack
/* g2l=4, load component 6 */
buffer_load_short_d16 v[vgprG2LA+8+7], v[vgprG2LA+8+7], s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 7 */
buffer_load_short_d16_hi v216, v216, s[sgprSrdA:sgprSrdA+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+8+7], v[vgprG2LA+8+7], v216 // HasEccHalf: pack




/* local write a */

ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+0:vgprG2LA+0+3] offset:0 // lwoA_0_0_0_0 = (0*LSCA)*(MT0I+PAD) + (0*LSPA) = 0
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+4:vgprG2LA+4+3] offset:4096 // lwoA_0_0_1_0 = (0*LSCA)*(MT0I+PAD) + (1*LSPA) = 8192
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+8:vgprG2LA+8+3] offset:8192 // lwoA_0_0_0_0 = (0*LSCA)*(MT0I+PAD) + (0*LSPA) = 0
ds_write_b128 v[vgprLocalWriteAddrA], v[vgprG2LA+12:vgprG2LA+12+3] offset:12288 // lwoA_0_0_1_0 = (0*LSCA)*(MT0I+PAD) + (1*LSPA) = 8192

s_waitcnt lgkmcnt(0)
s_barrier //

v_mov_b32 v[vgprGlobalReadOffsetB+0], v[vgprGlobalReadOffsetB1+0]
v_mov_b32 v[vgprGlobalReadOffsetB+1], v[vgprGlobalReadOffsetB1+1]
v_mov_b32 v[vgprGlobalReadOffsetB+2], v[vgprGlobalReadOffsetB1+2]
v_mov_b32 v[vgprGlobalReadOffsetB+3], v[vgprGlobalReadOffsetB1+3]

v_and_b32 v217, 63, v[vgprSerial]                  // v217 = v[vgprSerial] % 64
v_lshrrev_b32 v218, 6, v[vgprSerial]               // v218 = v[vgprSerial] / 64

v_lshrrev_b32 v219, 4, v217                        // v219 = v217 / 16
v_and_b32 v220, 15, v217                           // v220 = v217 % 16

v_mov_b32 v[vgprG2LB+0], v219          //
v_lshlrev_b32 v[vgprG2LB+0], 3, v[vgprG2LB+0]      //
v_add_co_u32 v[vgprG2LB+0], vcc, 0, v[vgprG2LB+0]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+0], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+0], vcc, 0, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v[vgprG2LB+0], -0x1, v[vgprG2LB+0], s[64:65] //
v_mov_b32 v201, v219                  //
v_lshlrev_b32 v201, 3, v201                        //
v_add_co_u32 v201, vcc, 1, v201                    //
v_cmp_lt_u32 s[64:65], v201, s[sgprLoopCounterL]   //
v_add_co_u32 v201, vcc, 2, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v201, -0x1, v201, s[64:65]           //
v_mov_b32 v[vgprG2LB+1], v219          //
v_lshlrev_b32 v[vgprG2LB+1], 3, v[vgprG2LB+1]      //
v_add_co_u32 v[vgprG2LB+1], vcc, 2, v[vgprG2LB+1]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+1], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+1], vcc, 4, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v[vgprG2LB+1], -0x1, v[vgprG2LB+1], s[64:65] //
v_mov_b32 v202, v219                   //
v_lshlrev_b32 v202, 3, v202                        //
v_add_co_u32 v202, vcc, 3, v202                    //
v_cmp_lt_u32 s[64:65], v202, s[sgprLoopCounterL]   //
v_add_co_u32 v202, vcc, 6, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v202, -0x1, v202, s[64:65]           //
v_mov_b32 v[vgprG2LB+2], v219          //
v_lshlrev_b32 v[vgprG2LB+2], 3, v[vgprG2LB+2]      //
v_add_co_u32 v[vgprG2LB+2], vcc, 4, v[vgprG2LB+2]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+2], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+2], vcc, 8, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v[vgprG2LB+2], -0x1, v[vgprG2LB+2], s[64:65] //
v_mov_b32 v203, v219                   //
v_lshlrev_b32 v203, 3, v203                        //
v_add_co_u32 v203, vcc, 5, v203                    //
v_cmp_lt_u32 s[64:65], v203, s[sgprLoopCounterL]   //
v_add_co_u32 v203, vcc, 10, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v203, -0x1, v203, s[64:65]           //
v_mov_b32 v[vgprG2LB+3], v219          //
v_lshlrev_b32 v[vgprG2LB+3], 3, v[vgprG2LB+3]      //
v_add_co_u32 v[vgprG2LB+3], vcc, 6, v[vgprG2LB+3]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+3], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+3], vcc, 12, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v[vgprG2LB+3], -0x1, v[vgprG2LB+3], s[64:65] //
v_mov_b32 v204, v219                   //
v_lshlrev_b32 v204, 3, v204                        //
v_add_co_u32 v204, vcc, 7, v204                    //
v_cmp_lt_u32 s[64:65], v204, s[sgprLoopCounterL]   //
v_add_co_u32 v204, vcc, 14, v[vgprGlobalReadOffsetB+0] //
v_cndmask_b32 v204, -0x1, v204, s[64:65]           //


v_mov_b32 v[vgprG2LB+4], v219          //
v_lshlrev_b32 v[vgprG2LB+4], 3, v[vgprG2LB+4]      //
v_add_co_u32 v[vgprG2LB+4], vcc, 32, v[vgprG2LB+4]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+4], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+4], vcc, 0, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v[vgprG2LB+4], -0x1, v[vgprG2LB+4], s[64:65] //
v_mov_b32 v205, v219                  //
v_lshlrev_b32 v205, 3, v205                        //
v_add_co_u32 v205, vcc, 33, v205                    //
v_cmp_lt_u32 s[64:65], v205, s[sgprLoopCounterL]   //
v_add_co_u32 v205, vcc, 2, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v205, -0x1, v205, s[64:65]           //
v_mov_b32 v[vgprG2LB+5], v219          //
v_lshlrev_b32 v[vgprG2LB+5], 3, v[vgprG2LB+5]      //
v_add_co_u32 v[vgprG2LB+5], vcc, 34, v[vgprG2LB+5]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+5], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+5], vcc, 4, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v[vgprG2LB+5], -0x1, v[vgprG2LB+5], s[64:65] //
v_mov_b32 v206, v219                   //
v_lshlrev_b32 v206, 3, v206                        //
v_add_co_u32 v206, vcc, 35, v206                    //
v_cmp_lt_u32 s[64:65], v206, s[sgprLoopCounterL]   //
v_add_co_u32 v206, vcc, 6, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v206, -0x1, v206, s[64:65]           //
v_mov_b32 v[vgprG2LB+6], v219          //
v_lshlrev_b32 v[vgprG2LB+6], 3, v[vgprG2LB+6]      //
v_add_co_u32 v[vgprG2LB+6], vcc, 36, v[vgprG2LB+6]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+6], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+6], vcc, 8, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v[vgprG2LB+6], -0x1, v[vgprG2LB+6], s[64:65] //
v_mov_b32 v207, v219                   //
v_lshlrev_b32 v207, 3, v207                        //
v_add_co_u32 v207, vcc, 37, v207                    //
v_cmp_lt_u32 s[64:65], v207, s[sgprLoopCounterL]   //
v_add_co_u32 v207, vcc, 10, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v207, -0x1, v207, s[64:65]           //
v_mov_b32 v[vgprG2LB+7], v219          //
v_lshlrev_b32 v[vgprG2LB+7], 3, v[vgprG2LB+7]      //
v_add_co_u32 v[vgprG2LB+7], vcc, 38, v[vgprG2LB+7]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+7], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+7], vcc, 12, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v[vgprG2LB+7], -0x1, v[vgprG2LB+7], s[64:65] //
v_mov_b32 v208, v219                   //
v_lshlrev_b32 v208, 3, v208                        //
v_add_co_u32 v208, vcc, 39, v208                    //
v_cmp_lt_u32 s[64:65], v208, s[sgprLoopCounterL]   //
v_add_co_u32 v208, vcc, 14, v[vgprGlobalReadOffsetB+1] //
v_cndmask_b32 v208, -0x1, v208, s[64:65]           //


v_mov_b32 v[vgprG2LB+8], v219          //
v_lshlrev_b32 v[vgprG2LB+8], 3, v[vgprG2LB+8]      //
v_add_co_u32 v[vgprG2LB+8], vcc, 0, v[vgprG2LB+8]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+8], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+8], vcc, 0, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v[vgprG2LB+8], -0x1, v[vgprG2LB+8], s[64:65] //
v_mov_b32 v209, v219                  //
v_lshlrev_b32 v209, 3, v209                        //
v_add_co_u32 v209, vcc, 1, v209                    //
v_cmp_lt_u32 s[64:65], v209, s[sgprLoopCounterL]   //
v_add_co_u32 v209, vcc, 2, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v209, -0x1, v209, s[64:65]           //
v_mov_b32 v[vgprG2LB+9], v219          //
v_lshlrev_b32 v[vgprG2LB+9], 3, v[vgprG2LB+9]      //
v_add_co_u32 v[vgprG2LB+9], vcc, 2, v[vgprG2LB+9]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+9], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+9], vcc, 4, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v[vgprG2LB+9], -0x1, v[vgprG2LB+9], s[64:65] //
v_mov_b32 v210, v219                   //
v_lshlrev_b32 v210, 3, v210                        //
v_add_co_u32 v210, vcc, 3, v210                    //
v_cmp_lt_u32 s[64:65], v210, s[sgprLoopCounterL]   //
v_add_co_u32 v210, vcc, 6, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v210, -0x1, v210, s[64:65]           //
v_mov_b32 v[vgprG2LB+10], v219          //
v_lshlrev_b32 v[vgprG2LB+10], 3, v[vgprG2LB+10]      //
v_add_co_u32 v[vgprG2LB+10], vcc, 4, v[vgprG2LB+10]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+10], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+10], vcc, 8, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v[vgprG2LB+10], -0x1, v[vgprG2LB+10], s[64:65] //
v_mov_b32 v211, v219                   //
v_lshlrev_b32 v211, 3, v211                        //
v_add_co_u32 v211, vcc, 5, v211                    //
v_cmp_lt_u32 s[64:65], v211, s[sgprLoopCounterL]   //
v_add_co_u32 v211, vcc, 10, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v211, -0x1, v211, s[64:65]           //
v_mov_b32 v[vgprG2LB+11], v219          //
v_lshlrev_b32 v[vgprG2LB+11], 3, v[vgprG2LB+11]      //
v_add_co_u32 v[vgprG2LB+11], vcc, 6, v[vgprG2LB+11]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+11], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+11], vcc, 12, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v[vgprG2LB+11], -0x1, v[vgprG2LB+11], s[64:65] //
v_mov_b32 v212, v219                   //
v_lshlrev_b32 v212, 3, v212                        //
v_add_co_u32 v212, vcc, 7, v212                    //
v_cmp_lt_u32 s[64:65], v212, s[sgprLoopCounterL]   //
v_add_co_u32 v212, vcc, 14, v[vgprGlobalReadOffsetB+2] //
v_cndmask_b32 v212, -0x1, v212, s[64:65]           //


v_mov_b32 v[vgprG2LB+12], v219          //
v_lshlrev_b32 v[vgprG2LB+12], 3, v[vgprG2LB+12]      //
v_add_co_u32 v[vgprG2LB+12], vcc, 32, v[vgprG2LB+12]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+12], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+12], vcc, 0, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v[vgprG2LB+12], -0x1, v[vgprG2LB+12], s[64:65] //
v_mov_b32 v213, v219                  //
v_lshlrev_b32 v213, 3, v213                        //
v_add_co_u32 v213, vcc, 33, v213                    //
v_cmp_lt_u32 s[64:65], v213, s[sgprLoopCounterL]   //
v_add_co_u32 v213, vcc, 2, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v213, -0x1, v213, s[64:65]           //
v_mov_b32 v[vgprG2LB+13], v219          //
v_lshlrev_b32 v[vgprG2LB+13], 3, v[vgprG2LB+13]      //
v_add_co_u32 v[vgprG2LB+13], vcc, 34, v[vgprG2LB+13]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+13], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+13], vcc, 4, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v[vgprG2LB+13], -0x1, v[vgprG2LB+13], s[64:65] //
v_mov_b32 v214, v219                   //
v_lshlrev_b32 v214, 3, v214                        //
v_add_co_u32 v214, vcc, 35, v214                    //
v_cmp_lt_u32 s[64:65], v214, s[sgprLoopCounterL]   //
v_add_co_u32 v214, vcc, 6, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v214, -0x1, v214, s[64:65]           //
v_mov_b32 v[vgprG2LB+14], v219          //
v_lshlrev_b32 v[vgprG2LB+14], 3, v[vgprG2LB+14]      //
v_add_co_u32 v[vgprG2LB+14], vcc, 36, v[vgprG2LB+14]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+14], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+14], vcc, 8, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v[vgprG2LB+14], -0x1, v[vgprG2LB+14], s[64:65] //
v_mov_b32 v215, v219                   //
v_lshlrev_b32 v215, 3, v215                        //
v_add_co_u32 v215, vcc, 37, v215                    //
v_cmp_lt_u32 s[64:65], v215, s[sgprLoopCounterL]   //
v_add_co_u32 v215, vcc, 10, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v215, -0x1, v215, s[64:65]           //
v_mov_b32 v[vgprG2LB+15], v219          //
v_lshlrev_b32 v[vgprG2LB+15], 3, v[vgprG2LB+15]      //
v_add_co_u32 v[vgprG2LB+15], vcc, 38, v[vgprG2LB+15]  //
v_cmp_lt_u32 s[64:65], v[vgprG2LB+15], s[sgprLoopCounterL] //
v_add_co_u32 v[vgprG2LB+15], vcc, 12, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v[vgprG2LB+15], -0x1, v[vgprG2LB+15], s[64:65] //
v_mov_b32 v216, v219                   //
v_lshlrev_b32 v216, 3, v216                        //
v_add_co_u32 v216, vcc, 39, v216                    //
v_cmp_lt_u32 s[64:65], v216, s[sgprLoopCounterL]   //
v_add_co_u32 v216, vcc, 14, v[vgprGlobalReadOffsetB+3] //
v_cndmask_b32 v216, -0x1, v216, s[64:65]           //


s_add_u32 s[sgprLoopCounterL], s[sgprLoopCounterL], 63 // tail add
s_lshr_b32 s[sgprLoopCounterL], s[sgprLoopCounterL], 6 //


/* Update M0 for DTLDS */



/* Update M0 for DTLDS */


/* global read b */

/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LB+0+0], v[vgprG2LB+0+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v201, v201, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+0+0], v[vgprG2LB+0+0], v201 // HasEccHalf: pack
/* g2l=0, load component 2 */
buffer_load_short_d16 v[vgprG2LB+0+1], v[vgprG2LB+0+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 3 */
buffer_load_short_d16_hi v202, v202, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+0+1], v[vgprG2LB+0+1], v202 // HasEccHalf: pack
/* g2l=0, load component 4 */
buffer_load_short_d16 v[vgprG2LB+0+2], v[vgprG2LB+0+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 5 */
buffer_load_short_d16_hi v203, v203, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+0+2], v[vgprG2LB+0+2], v203 // HasEccHalf: pack
/* g2l=0, load component 6 */
buffer_load_short_d16 v[vgprG2LB+0+3], v[vgprG2LB+0+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 7 */
buffer_load_short_d16_hi v204, v204, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+0+3], v[vgprG2LB+0+3], v204 // HasEccHalf: pack
/* g2l=4, load component 0 */
buffer_load_short_d16 v[vgprG2LB+4+0], v[vgprG2LB+4+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 1 */
buffer_load_short_d16_hi v205, v205, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+4+0], v[vgprG2LB+4+0], v205 // HasEccHalf: pack
/* g2l=4, load component 2 */
buffer_load_short_d16 v[vgprG2LB+4+1], v[vgprG2LB+4+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 3 */
buffer_load_short_d16_hi v206, v206, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+4+1], v[vgprG2LB+4+1], v206 // HasEccHalf: pack
/* g2l=4, load component 4 */
buffer_load_short_d16 v[vgprG2LB+4+2], v[vgprG2LB+4+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 5 */
buffer_load_short_d16_hi v207, v207, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+4+2], v[vgprG2LB+4+2], v207 // HasEccHalf: pack
/* g2l=4, load component 6 */
buffer_load_short_d16 v[vgprG2LB+4+3], v[vgprG2LB+4+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 7 */
buffer_load_short_d16_hi v208, v208, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+4+3], v[vgprG2LB+4+3], v208 // HasEccHalf: pack


/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LB+8+0], v[vgprG2LB+8+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v209, v209, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+8+0], v[vgprG2LB+8+0], v209 // HasEccHalf: pack
/* g2l=0, load component 2 */
buffer_load_short_d16 v[vgprG2LB+8+1], v[vgprG2LB+8+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 3 */
buffer_load_short_d16_hi v210, v210, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+8+1], v[vgprG2LB+8+1], v210 // HasEccHalf: pack
/* g2l=0, load component 4 */
buffer_load_short_d16 v[vgprG2LB+8+2], v[vgprG2LB+8+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 5 */
buffer_load_short_d16_hi v211, v211, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+8+2], v[vgprG2LB+8+2], v211 // HasEccHalf: pack
/* g2l=0, load component 6 */
buffer_load_short_d16 v[vgprG2LB+8+3], v[vgprG2LB+8+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=0, load component 7 */
buffer_load_short_d16_hi v212, v212, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+8+3], v[vgprG2LB+8+3], v212 // HasEccHalf: pack
/* g2l=4, load component 0 */
buffer_load_short_d16 v[vgprG2LB+12+0], v[vgprG2LB+12+0], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 1 */
buffer_load_short_d16_hi v213, v213, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+12+0], v[vgprG2LB+12+0], v213 // HasEccHalf: pack
/* g2l=4, load component 2 */
buffer_load_short_d16 v[vgprG2LB+12+1], v[vgprG2LB+12+1], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 3 */
buffer_load_short_d16_hi v214, v214, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+12+1], v[vgprG2LB+12+1], v214 // HasEccHalf: pack
/* g2l=4, load component 4 */
buffer_load_short_d16 v[vgprG2LB+12+2], v[vgprG2LB+12+2], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 5 */
buffer_load_short_d16_hi v215, v215, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+12+2], v[vgprG2LB+12+2], v215 // HasEccHalf: pack
/* g2l=4, load component 6 */
buffer_load_short_d16 v[vgprG2LB+12+3], v[vgprG2LB+12+3], s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
/* g2l=4, load component 7 */
buffer_load_short_d16_hi v216, v216, s[sgprSrdB:sgprSrdB+3], 0, offen offset:0 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+12+3], v[vgprG2LB+12+3], v216 // HasEccHalf: pack


s_waitcnt vmcnt(0)                                 // lgkmcnt=-1 vmcnt=02wait for global read

s_barrier //

v_mov_b64 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+1], v[vgprG2LB+0:vgprG2LB+1]
v_mov_b64 v[vgprValuB_X0_I0+2:vgprValuB_X0_I0+3], v[vgprG2LB+2:vgprG2LB+3]
v_mov_b64 v[vgprValuB_X0_I0+4:vgprValuB_X0_I0+5], v[vgprG2LB+4:vgprG2LB+5]
v_mov_b64 v[vgprValuB_X0_I0+6:vgprValuB_X0_I0+7], v[vgprG2LB+6:vgprG2LB+7]
v_mov_b64 v[vgprValuB_X0_I0+8:vgprValuB_X0_I0+9], v[vgprG2LB+8:vgprG2LB+9]
v_mov_b64 v[vgprValuB_X0_I0+10:vgprValuB_X0_I0+11], v[vgprG2LB+10:vgprG2LB+11]
v_mov_b64 v[vgprValuB_X0_I0+12:vgprValuB_X0_I0+13], v[vgprG2LB+12:vgprG2LB+13]
v_mov_b64 v[vgprValuB_X0_I0+14:vgprValuB_X0_I0+15], v[vgprG2LB+14:vgprG2LB+15]

/* local write a */


/* local write b */


/* Recalc local read offsets */


s_waitcnt lgkmcnt(0)                               // lgkmcnt=0 vmcnt=-15wait for local write

s_barrier //


/* TailLoop: Check VGPR.checkin for INT8 LW */


/* local read reset offsets a */


/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrA], 0x7fff, v[vgprLocalReadAddrA] // reset Red,Blk -> Red


/* local read reset offsets b */


/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrB], 0x7fff, v[vgprLocalReadAddrB] // reset Red,Blk -> Red


/* local read init pointers a */


/* localReadInitPointers */


/* local read init pointers b */


/* localReadInitPointers */


/* tail loop: macs */

TailLoopBeginL_5:


/* local read a */

ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x1000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x1200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x2000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x2200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x3000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x3200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x4000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x4200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x5000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x5200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x6000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x6200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x7000 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x7200 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_waitcnt lgkmcnt(0)
MAC_32x4x2_X0_I0
s_barrier


ds_read_b128 v[vgprValuA_X0_I0+0:vgprValuA_X0_I0+3], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x40 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+4:vgprValuA_X0_I0+7], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=1 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+8:vgprValuA_X0_I0+11], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x1040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=2 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+12:vgprValuA_X0_I0+15], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x1240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=3 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+16:vgprValuA_X0_I0+19], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x2040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=4 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+20:vgprValuA_X0_I0+23], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x2240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=5 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+24:vgprValuA_X0_I0+27], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x3040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=6 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+28:vgprValuA_X0_I0+31], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x3240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=7 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+32:vgprValuA_X0_I0+35], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x4040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=8 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+36:vgprValuA_X0_I0+39], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x4240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=9 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+40:vgprValuA_X0_I0+43], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x5040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=10 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+44:vgprValuA_X0_I0+47], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x5240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=11 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+48:vgprValuA_X0_I0+51], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x6040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=12 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+52:vgprValuA_X0_I0+55], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x6240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=13 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+56:vgprValuA_X0_I0+59], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x7040 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=14 rIdx=0 buffer=1 iui=0
ds_read_b128 v[vgprValuA_X0_I0+60:vgprValuA_X0_I0+63], v[vgprLocalReadAddrA_forLdsWrapTailLoop] offset:0x7240 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=15 rIdx=0 buffer=1 iui=0

s_waitcnt lgkmcnt(0)
MAC_32x4x2_X0_I1
s_barrier



/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_i32 s[sgprLoopCounterL], s[sgprLoopCounterL], 0x1 // dec counterL (tailLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x1 // inc counterL
s_cmp_le_i32 s[sgprLoopCounterL], 0x0              // counterL<=0
s_cbranch_scc0 TailLoopBeginL_5                    // restart LoopL
TailLoopEndL_6:

SkipTailLoopL_7:

Summation_End_23:
/* endSummation: add vgpr [128...198) to pool */
.set NumFullBlocks, UNDEF
.set WgmRemainder1, UNDEF
.set MagicNumberWgmRemainder1, UNDEF
.set ShadowLimitA, UNDEF
.set ShadowLimitB, UNDEF
.set LocalWriteAddrA, UNDEF
.set LocalWriteAddrB, UNDEF



/* not-LocalSplitU: global write indices */

/* computeStoreVgprs */
v_and_b32 v128, 63, v[vgprSerial]                  // v0 = v[vgprSerial] & 63
v_lshrrev_b32 v129, 6, v[vgprSerial]               // v4 = v[vgprSerial] / 64
v_and_b32 v132, 15, v128                           // v5 = v0 & 15
v_lshrrev_b32 v133, 4, v128                        // v3 = v0 / 16
v_and_b32 v134, 0, v129                            // v4&1
s_mov_b32 s54, 32                                 //
v_mul_lo_u32 v134, s54, v134                       //
v_lshlrev_b32 v128, 0, v132                        // ((v[vgprSerial]&63)&15)*2
_v_add_co_u32 v128, vcc, v128, v134                // row
v_lshrrev_b32 v134, 0, v129                        // v4>>1
s_mov_b32 s54, 32                                  //
v_mul_lo_u32 v134, s54, v134                       //
v_lshlrev_b32 v129, 0, v133                        // ((v[vgprSerial]&63)&15)*2
_v_add_co_u32 v129, vcc, v129, v134                // col
s_mul_i32 s[sgprStrideoffC+0], 8, s[sgprStridesC]  //
s_mul_i32 s[sgprStrideoffC+1], 16, s[sgprStridesC] //
s_mul_i32 s[sgprStrideoffC+2], 24, s[sgprStridesC] //
s_mul_i32 s[sgprStrideoffD+0], 8, s[sgprStridesD]  //
s_mul_i32 s[sgprStrideoffD+1], 16, s[sgprStridesD] //
s_mul_i32 s[sgprStrideoffD+2], 24, s[sgprStridesD] //
v_mul_lo_u32 v130, v129, s[sgprStrideC1J]          // rowStart vgpr
v_mul_lo_u32 v131, v129, s[sgprStrideD1J]          // rowStart vgpr

s_mul_i32 s54, 0x100, s[sgprWorkGroup0]            // s54 = wg0*MT0
_v_add_co_u32 v128, vcc, s54, v128                 // coord0 = tid0*VW + wg0*MT0
s_mul_i32 s56, 0x100, s[sgprWorkGroup1]            // <- wg1*MT1
_v_add_co_u32 v129, vcc, s56, v129                 // coord1 = tid1*VW + wg1*MT1


/* not-LocalSplitU: global write */

                                           //
s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 GW_Beta_38                          // Branch if Beta is not zero

s_and_b32 s54, 255, s[sgprSizeI]                   // s54 = s[sgprSizeI] % 256
s_add_u32 s56, -0x1, s[sgprNumWorkGroups0]         //
s_cmp_ge_u32 s[sgprWorkGroup0], s56                // wg0 >= nwg0-1 ?
s_cselect_b32 s54, s54, 0                          // set rMT0
s_cmpk_gt_u32 s54, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B0_E1_29                         // jump if edges required
s_and_b32 s54, 255, s[sgprSizeJ]                   // s54 = s[sgprSizeJ] % 256
s_add_u32 s56, -0x1, s[sgprNumWorkGroups1]         //
s_cmp_ge_u32 s[sgprWorkGroup1], s56                // wg1 >= nwg1-1
s_cselect_b32 s54, s54, 0                          // set rMT1
s_cmpk_gt_u32 s54, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B0_E1_29                         // jump if edges required
GW_B0_E0_26:

/* edge=0, allocate 2 sgpr. perBatch=2 perElement=0 elementsPerBatch=128 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw1); (0,0,0,1:vw1); (0,0,0,2:vw1); (0,0,0,3:vw1); (0,0,0,4:vw1); (0,0,0,5:vw1); (0,0,0,6:vw1); (0,0,0,7:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1); (0,1,0,2:vw1); (0,1,0,3:vw1); (0,1,0,4:vw1); (0,1,0,5:vw1); (0,1,0,6:vw1); (0,1,0,7:vw1); (0,0,1,0:vw1); (0,0,1,1:vw1); (0,0,1,2:vw1); (0,0,1,3:vw1); (0,0,1,4:vw1); (0,0,1,5:vw1); (0,0,1,6:vw1); (0,0,1,7:vw1); (0,1,1,0:vw1); (0,1,1,1:vw1); (0,1,1,2:vw1); (0,1,1,3:vw1); (0,1,1,4:vw1); (0,1,1,5:vw1); (0,1,1,6:vw1); (0,1,1,7:vw1); (0,0,2,0:vw1); (0,0,2,1:vw1); (0,0,2,2:vw1); (0,0,2,3:vw1); (0,0,2,4:vw1); (0,0,2,5:vw1); (0,0,2,6:vw1); (0,0,2,7:vw1); (0,1,2,0:vw1); (0,1,2,1:vw1); (0,1,2,2:vw1); (0,1,2,3:vw1); (0,1,2,4:vw1); (0,1,2,5:vw1); (0,1,2,6:vw1); (0,1,2,7:vw1); (0,0,3,0:vw1); (0,0,3,1:vw1); (0,0,3,2:vw1); (0,0,3,3:vw1); (0,0,3,4:vw1); (0,0,3,5:vw1); (0,0,3,6:vw1); (0,0,3,7:vw1); (0,1,3,0:vw1); (0,1,3,1:vw1); (0,1,3,2:vw1); (0,1,3,3:vw1); (0,1,3,4:vw1); (0,1,3,5:vw1); (0,1,3,6:vw1); (0,1,3,7:vw1); (0,0,4,0:vw1); (0,0,4,1:vw1); (0,0,4,2:vw1); (0,0,4,3:vw1); (0,0,4,4:vw1); (0,0,4,5:vw1); (0,0,4,6:vw1); (0,0,4,7:vw1); (0,1,4,0:vw1); (0,1,4,1:vw1); (0,1,4,2:vw1); (0,1,4,3:vw1); (0,1,4,4:vw1); (0,1,4,5:vw1); (0,1,4,6:vw1); (0,1,4,7:vw1); (0,0,5,0:vw1); (0,0,5,1:vw1); (0,0,5,2:vw1); (0,0,5,3:vw1); (0,0,5,4:vw1); (0,0,5,5:vw1); (0,0,5,6:vw1); (0,0,5,7:vw1); (0,1,5,0:vw1); (0,1,5,1:vw1); (0,1,5,2:vw1); (0,1,5,3:vw1); (0,1,5,4:vw1); (0,1,5,5:vw1); (0,1,5,6:vw1); (0,1,5,7:vw1); (0,0,6,0:vw1); (0,0,6,1:vw1); (0,0,6,2:vw1); (0,0,6,3:vw1); (0,0,6,4:vw1); (0,0,6,5:vw1); (0,0,6,6:vw1); (0,0,6,7:vw1); (0,1,6,0:vw1); (0,1,6,1:vw1); (0,1,6,2:vw1); (0,1,6,3:vw1); (0,1,6,4:vw1); (0,1,6,5:vw1); (0,1,6,6:vw1); (0,1,6,7:vw1); (0,0,7,0:vw1); (0,0,7,1:vw1); (0,0,7,2:vw1); (0,0,7,3:vw1); (0,0,7,4:vw1); (0,0,7,5:vw1); (0,0,7,6:vw1); (0,0,7,7:vw1); (0,1,7,0:vw1); (0,1,7,1:vw1); (0,1,7,2:vw1); (0,1,7,3:vw1); (0,1,7,4:vw1); (0,1,7,5:vw1); (0,1,7,6:vw1); (0,1,7,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
/* (d1,vc1,d0,vc0)=(0,0,0,1) */
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
/* (d1,vc1,d0,vc0)=(0,0,0,3) */
/* (d1,vc1,d0,vc0)=(0,0,0,4) */
/* (d1,vc1,d0,vc0)=(0,0,0,5) */
/* (d1,vc1,d0,vc0)=(0,0,0,6) */
/* (d1,vc1,d0,vc0)=(0,0,0,7) */
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
/* (d1,vc1,d0,vc0)=(0,0,1,1) */
/* (d1,vc1,d0,vc0)=(0,0,1,2) */
/* (d1,vc1,d0,vc0)=(0,0,1,3) */
/* (d1,vc1,d0,vc0)=(0,0,1,4) */
/* (d1,vc1,d0,vc0)=(0,0,1,5) */
/* (d1,vc1,d0,vc0)=(0,0,1,6) */
/* (d1,vc1,d0,vc0)=(0,0,1,7) */
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
/* (d1,vc1,d0,vc0)=(0,1,0,1) */
/* (d1,vc1,d0,vc0)=(0,1,0,2) */
/* (d1,vc1,d0,vc0)=(0,1,0,3) */
/* (d1,vc1,d0,vc0)=(0,1,0,4) */
/* (d1,vc1,d0,vc0)=(0,1,0,5) */
/* (d1,vc1,d0,vc0)=(0,1,0,6) */
/* (d1,vc1,d0,vc0)=(0,1,0,7) */
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
/* (d1,vc1,d0,vc0)=(0,1,1,1) */
/* (d1,vc1,d0,vc0)=(0,1,1,2) */
/* (d1,vc1,d0,vc0)=(0,1,1,3) */
/* (d1,vc1,d0,vc0)=(0,1,1,4) */
/* (d1,vc1,d0,vc0)=(0,1,1,5) */
/* (d1,vc1,d0,vc0)=(0,1,1,6) */
/* (d1,vc1,d0,vc0)=(0,1,1,7) */
/* (d1,vc1,d0,vc0)=(0,2,0,0) */
/* (d1,vc1,d0,vc0)=(0,2,0,1) */
/* (d1,vc1,d0,vc0)=(0,2,0,2) */
/* (d1,vc1,d0,vc0)=(0,2,0,3) */
/* (d1,vc1,d0,vc0)=(0,2,0,4) */
/* (d1,vc1,d0,vc0)=(0,2,0,5) */
/* (d1,vc1,d0,vc0)=(0,2,0,6) */
/* (d1,vc1,d0,vc0)=(0,2,0,7) */
/* (d1,vc1,d0,vc0)=(0,2,1,0) */
/* (d1,vc1,d0,vc0)=(0,2,1,1) */
/* (d1,vc1,d0,vc0)=(0,2,1,2) */
/* (d1,vc1,d0,vc0)=(0,2,1,3) */
/* (d1,vc1,d0,vc0)=(0,2,1,4) */
/* (d1,vc1,d0,vc0)=(0,2,1,5) */
/* (d1,vc1,d0,vc0)=(0,2,1,6) */
/* (d1,vc1,d0,vc0)=(0,2,1,7) */
/* (d1,vc1,d0,vc0)=(0,3,0,0) */
/* (d1,vc1,d0,vc0)=(0,3,0,1) */
/* (d1,vc1,d0,vc0)=(0,3,0,2) */
/* (d1,vc1,d0,vc0)=(0,3,0,3) */
/* (d1,vc1,d0,vc0)=(0,3,0,4) */
/* (d1,vc1,d0,vc0)=(0,3,0,5) */
/* (d1,vc1,d0,vc0)=(0,3,0,6) */
/* (d1,vc1,d0,vc0)=(0,3,0,7) */
/* (d1,vc1,d0,vc0)=(0,3,1,0) */
/* (d1,vc1,d0,vc0)=(0,3,1,1) */
/* (d1,vc1,d0,vc0)=(0,3,1,2) */
/* (d1,vc1,d0,vc0)=(0,3,1,3) */
/* (d1,vc1,d0,vc0)=(0,3,1,4) */
/* (d1,vc1,d0,vc0)=(0,3,1,5) */
/* (d1,vc1,d0,vc0)=(0,3,1,6) */
/* (d1,vc1,d0,vc0)=(0,3,1,7) */
/* (d1,vc1,d0,vc0)=(0,4,0,0) */
/* (d1,vc1,d0,vc0)=(0,4,0,1) */
/* (d1,vc1,d0,vc0)=(0,4,0,2) */
/* (d1,vc1,d0,vc0)=(0,4,0,3) */
/* (d1,vc1,d0,vc0)=(0,4,0,4) */
/* (d1,vc1,d0,vc0)=(0,4,0,5) */
/* (d1,vc1,d0,vc0)=(0,4,0,6) */
/* (d1,vc1,d0,vc0)=(0,4,0,7) */
/* (d1,vc1,d0,vc0)=(0,4,1,0) */
/* (d1,vc1,d0,vc0)=(0,4,1,1) */
/* (d1,vc1,d0,vc0)=(0,4,1,2) */
/* (d1,vc1,d0,vc0)=(0,4,1,3) */
/* (d1,vc1,d0,vc0)=(0,4,1,4) */
/* (d1,vc1,d0,vc0)=(0,4,1,5) */
/* (d1,vc1,d0,vc0)=(0,4,1,6) */
/* (d1,vc1,d0,vc0)=(0,4,1,7) */
/* (d1,vc1,d0,vc0)=(0,5,0,0) */
/* (d1,vc1,d0,vc0)=(0,5,0,1) */
/* (d1,vc1,d0,vc0)=(0,5,0,2) */
/* (d1,vc1,d0,vc0)=(0,5,0,3) */
/* (d1,vc1,d0,vc0)=(0,5,0,4) */
/* (d1,vc1,d0,vc0)=(0,5,0,5) */
/* (d1,vc1,d0,vc0)=(0,5,0,6) */
/* (d1,vc1,d0,vc0)=(0,5,0,7) */
/* (d1,vc1,d0,vc0)=(0,5,1,0) */
/* (d1,vc1,d0,vc0)=(0,5,1,1) */
/* (d1,vc1,d0,vc0)=(0,5,1,2) */
/* (d1,vc1,d0,vc0)=(0,5,1,3) */
/* (d1,vc1,d0,vc0)=(0,5,1,4) */
/* (d1,vc1,d0,vc0)=(0,5,1,5) */
/* (d1,vc1,d0,vc0)=(0,5,1,6) */
/* (d1,vc1,d0,vc0)=(0,5,1,7) */
/* (d1,vc1,d0,vc0)=(0,6,0,0) */
/* (d1,vc1,d0,vc0)=(0,6,0,1) */
/* (d1,vc1,d0,vc0)=(0,6,0,2) */
/* (d1,vc1,d0,vc0)=(0,6,0,3) */
/* (d1,vc1,d0,vc0)=(0,6,0,4) */
/* (d1,vc1,d0,vc0)=(0,6,0,5) */
/* (d1,vc1,d0,vc0)=(0,6,0,6) */
/* (d1,vc1,d0,vc0)=(0,6,0,7) */
/* (d1,vc1,d0,vc0)=(0,6,1,0) */
/* (d1,vc1,d0,vc0)=(0,6,1,1) */
/* (d1,vc1,d0,vc0)=(0,6,1,2) */
/* (d1,vc1,d0,vc0)=(0,6,1,3) */
/* (d1,vc1,d0,vc0)=(0,6,1,4) */
/* (d1,vc1,d0,vc0)=(0,6,1,5) */
/* (d1,vc1,d0,vc0)=(0,6,1,6) */
/* (d1,vc1,d0,vc0)=(0,6,1,7) */
/* (d1,vc1,d0,vc0)=(0,7,0,0) */
/* (d1,vc1,d0,vc0)=(0,7,0,1) */
/* (d1,vc1,d0,vc0)=(0,7,0,2) */
/* (d1,vc1,d0,vc0)=(0,7,0,3) */
/* (d1,vc1,d0,vc0)=(0,7,0,4) */
/* (d1,vc1,d0,vc0)=(0,7,0,5) */
/* (d1,vc1,d0,vc0)=(0,7,0,6) */
/* (d1,vc1,d0,vc0)=(0,7,0,7) */
/* (d1,vc1,d0,vc0)=(0,7,1,0) */
/* (d1,vc1,d0,vc0)=(0,7,1,1) */
/* (d1,vc1,d0,vc0)=(0,7,1,2) */
/* (d1,vc1,d0,vc0)=(0,7,1,3) */
/* (d1,vc1,d0,vc0)=(0,7,1,4) */
/* (d1,vc1,d0,vc0)=(0,7,1,5) */
/* (d1,vc1,d0,vc0)=(0,7,1,6) */
/* (d1,vc1,d0,vc0)=(0,7,1,7) */
_v_add_lshl_u32 v134, v131, v128, 0x1              // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=128, coord0Vgpr=128

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 0, 0, 1), (0, 0, 0, 2), (0, 0, 0, 3), (0, 0, 0, 4), (0, 0, 0, 5), (0, 0, 0, 6), (0, 0, 0, 7), (0, 1, 0, 0), (0, 1, 0, 1), (0, 1, 0, 2), (0, 1, 0, 3), (0, 1, 0, 4), (0, 1, 0, 5), (0, 1, 0, 6), (0, 1, 0, 7), (0, 0, 1, 0), (0, 0, 1, 1), (0, 0, 1, 2), (0, 0, 1, 3), (0, 0, 1, 4), (0, 0, 1, 5), (0, 0, 1, 6), (0, 0, 1, 7), (0, 1, 1, 0), (0, 1, 1, 1), (0, 1, 1, 2), (0, 1, 1, 3), (0, 1, 1, 4), (0, 1, 1, 5), (0, 1, 1, 6), (0, 1, 1, 7), (0, 0, 2, 0), (0, 0, 2, 1), (0, 0, 2, 2), (0, 0, 2, 3), (0, 0, 2, 4), (0, 0, 2, 5), (0, 0, 2, 6), (0, 0, 2, 7), (0, 1, 2, 0), (0, 1, 2, 1), (0, 1, 2, 2), (0, 1, 2, 3), (0, 1, 2, 4), (0, 1, 2, 5), (0, 1, 2, 6), (0, 1, 2, 7), (0, 0, 3, 0), (0, 0, 3, 1), (0, 0, 3, 2), (0, 0, 3, 3), (0, 0, 3, 4), (0, 0, 3, 5), (0, 0, 3, 6), (0, 0, 3, 7), (0, 1, 3, 0), (0, 1, 3, 1), (0, 1, 3, 2), (0, 1, 3, 3), (0, 1, 3, 4), (0, 1, 3, 5), (0, 1, 3, 6), (0, 1, 3, 7), (0, 0, 4, 0), (0, 0, 4, 1), (0, 0, 4, 2), (0, 0, 4, 3), (0, 0, 4, 4), (0, 0, 4, 5), (0, 0, 4, 6), (0, 0, 4, 7), (0, 1, 4, 0), (0, 1, 4, 1), (0, 1, 4, 2), (0, 1, 4, 3), (0, 1, 4, 4), (0, 1, 4, 5), (0, 1, 4, 6), (0, 1, 4, 7), (0, 0, 5, 0), (0, 0, 5, 1), (0, 0, 5, 2), (0, 0, 5, 3), (0, 0, 5, 4), (0, 0, 5, 5), (0, 0, 5, 6), (0, 0, 5, 7), (0, 1, 5, 0), (0, 1, 5, 1), (0, 1, 5, 2), (0, 1, 5, 3), (0, 1, 5, 4), (0, 1, 5, 5), (0, 1, 5, 6), (0, 1, 5, 7), (0, 0, 6, 0), (0, 0, 6, 1), (0, 0, 6, 2), (0, 0, 6, 3), (0, 0, 6, 4), (0, 0, 6, 5), (0, 0, 6, 6), (0, 0, 6, 7), (0, 1, 6, 0), (0, 1, 6, 1), (0, 1, 6, 2), (0, 1, 6, 3), (0, 1, 6, 4), (0, 1, 6, 5), (0, 1, 6, 6), (0, 1, 6, 7), (0, 0, 7, 0), (0, 0, 7, 1), (0, 0, 7, 2), (0, 0, 7, 3), (0, 0, 7, 4), (0, 0, 7, 5), (0, 0, 7, 6), (0, 0, 7, 7), (0, 1, 7, 0), (0, 1, 7, 1), (0, 1, 7, 2), (0, 1, 7, 3), (0, 1, 7, 4), (0, 1, 7, 5), (0, 1, 7, 6), (0, 1, 7, 7)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha
v_mul_f32 v[vgprValuC+64], s[sgprAlpha], v[vgprValuC+64] // *= alpha
v_mul_f32 v[vgprValuC+65], s[sgprAlpha], v[vgprValuC+65] // *= alpha
v_mul_f32 v[vgprValuC+66], s[sgprAlpha], v[vgprValuC+66] // *= alpha
v_mul_f32 v[vgprValuC+67], s[sgprAlpha], v[vgprValuC+67] // *= alpha
v_mul_f32 v[vgprValuC+68], s[sgprAlpha], v[vgprValuC+68] // *= alpha
v_mul_f32 v[vgprValuC+69], s[sgprAlpha], v[vgprValuC+69] // *= alpha
v_mul_f32 v[vgprValuC+70], s[sgprAlpha], v[vgprValuC+70] // *= alpha
v_mul_f32 v[vgprValuC+71], s[sgprAlpha], v[vgprValuC+71] // *= alpha
v_mul_f32 v[vgprValuC+72], s[sgprAlpha], v[vgprValuC+72] // *= alpha
v_mul_f32 v[vgprValuC+73], s[sgprAlpha], v[vgprValuC+73] // *= alpha
v_mul_f32 v[vgprValuC+74], s[sgprAlpha], v[vgprValuC+74] // *= alpha
v_mul_f32 v[vgprValuC+75], s[sgprAlpha], v[vgprValuC+75] // *= alpha
v_mul_f32 v[vgprValuC+76], s[sgprAlpha], v[vgprValuC+76] // *= alpha
v_mul_f32 v[vgprValuC+77], s[sgprAlpha], v[vgprValuC+77] // *= alpha
v_mul_f32 v[vgprValuC+78], s[sgprAlpha], v[vgprValuC+78] // *= alpha
v_mul_f32 v[vgprValuC+79], s[sgprAlpha], v[vgprValuC+79] // *= alpha
v_mul_f32 v[vgprValuC+80], s[sgprAlpha], v[vgprValuC+80] // *= alpha
v_mul_f32 v[vgprValuC+81], s[sgprAlpha], v[vgprValuC+81] // *= alpha
v_mul_f32 v[vgprValuC+82], s[sgprAlpha], v[vgprValuC+82] // *= alpha
v_mul_f32 v[vgprValuC+83], s[sgprAlpha], v[vgprValuC+83] // *= alpha
v_mul_f32 v[vgprValuC+84], s[sgprAlpha], v[vgprValuC+84] // *= alpha
v_mul_f32 v[vgprValuC+85], s[sgprAlpha], v[vgprValuC+85] // *= alpha
v_mul_f32 v[vgprValuC+86], s[sgprAlpha], v[vgprValuC+86] // *= alpha
v_mul_f32 v[vgprValuC+87], s[sgprAlpha], v[vgprValuC+87] // *= alpha
v_mul_f32 v[vgprValuC+88], s[sgprAlpha], v[vgprValuC+88] // *= alpha
v_mul_f32 v[vgprValuC+89], s[sgprAlpha], v[vgprValuC+89] // *= alpha
v_mul_f32 v[vgprValuC+90], s[sgprAlpha], v[vgprValuC+90] // *= alpha
v_mul_f32 v[vgprValuC+91], s[sgprAlpha], v[vgprValuC+91] // *= alpha
v_mul_f32 v[vgprValuC+92], s[sgprAlpha], v[vgprValuC+92] // *= alpha
v_mul_f32 v[vgprValuC+93], s[sgprAlpha], v[vgprValuC+93] // *= alpha
v_mul_f32 v[vgprValuC+94], s[sgprAlpha], v[vgprValuC+94] // *= alpha
v_mul_f32 v[vgprValuC+95], s[sgprAlpha], v[vgprValuC+95] // *= alpha
v_mul_f32 v[vgprValuC+96], s[sgprAlpha], v[vgprValuC+96] // *= alpha
v_mul_f32 v[vgprValuC+97], s[sgprAlpha], v[vgprValuC+97] // *= alpha
v_mul_f32 v[vgprValuC+98], s[sgprAlpha], v[vgprValuC+98] // *= alpha
v_mul_f32 v[vgprValuC+99], s[sgprAlpha], v[vgprValuC+99] // *= alpha
v_mul_f32 v[vgprValuC+100], s[sgprAlpha], v[vgprValuC+100] // *= alpha
v_mul_f32 v[vgprValuC+101], s[sgprAlpha], v[vgprValuC+101] // *= alpha
v_mul_f32 v[vgprValuC+102], s[sgprAlpha], v[vgprValuC+102] // *= alpha
v_mul_f32 v[vgprValuC+103], s[sgprAlpha], v[vgprValuC+103] // *= alpha
v_mul_f32 v[vgprValuC+104], s[sgprAlpha], v[vgprValuC+104] // *= alpha
v_mul_f32 v[vgprValuC+105], s[sgprAlpha], v[vgprValuC+105] // *= alpha
v_mul_f32 v[vgprValuC+106], s[sgprAlpha], v[vgprValuC+106] // *= alpha
v_mul_f32 v[vgprValuC+107], s[sgprAlpha], v[vgprValuC+107] // *= alpha
v_mul_f32 v[vgprValuC+108], s[sgprAlpha], v[vgprValuC+108] // *= alpha
v_mul_f32 v[vgprValuC+109], s[sgprAlpha], v[vgprValuC+109] // *= alpha
v_mul_f32 v[vgprValuC+110], s[sgprAlpha], v[vgprValuC+110] // *= alpha
v_mul_f32 v[vgprValuC+111], s[sgprAlpha], v[vgprValuC+111] // *= alpha
v_mul_f32 v[vgprValuC+112], s[sgprAlpha], v[vgprValuC+112] // *= alpha
v_mul_f32 v[vgprValuC+113], s[sgprAlpha], v[vgprValuC+113] // *= alpha
v_mul_f32 v[vgprValuC+114], s[sgprAlpha], v[vgprValuC+114] // *= alpha
v_mul_f32 v[vgprValuC+115], s[sgprAlpha], v[vgprValuC+115] // *= alpha
v_mul_f32 v[vgprValuC+116], s[sgprAlpha], v[vgprValuC+116] // *= alpha
v_mul_f32 v[vgprValuC+117], s[sgprAlpha], v[vgprValuC+117] // *= alpha
v_mul_f32 v[vgprValuC+118], s[sgprAlpha], v[vgprValuC+118] // *= alpha
v_mul_f32 v[vgprValuC+119], s[sgprAlpha], v[vgprValuC+119] // *= alpha
v_mul_f32 v[vgprValuC+120], s[sgprAlpha], v[vgprValuC+120] // *= alpha
v_mul_f32 v[vgprValuC+121], s[sgprAlpha], v[vgprValuC+121] // *= alpha
v_mul_f32 v[vgprValuC+122], s[sgprAlpha], v[vgprValuC+122] // *= alpha
v_mul_f32 v[vgprValuC+123], s[sgprAlpha], v[vgprValuC+123] // *= alpha
v_mul_f32 v[vgprValuC+124], s[sgprAlpha], v[vgprValuC+124] // *= alpha
v_mul_f32 v[vgprValuC+125], s[sgprAlpha], v[vgprValuC+125] // *= alpha
v_mul_f32 v[vgprValuC+126], s[sgprAlpha], v[vgprValuC+126] // *= alpha
v_mul_f32 v[vgprValuC+127], s[sgprAlpha], v[vgprValuC+127] // *= alpha

/* apply mask, calc new C and issue writes */
v_mov_b32 v250, 0x7fff0000                         // fp32 Nan
v_mov_b32 v251, 0x7fff                             // rounding bias for bfloat16

FP32_TO_BF16 vgprValuC+0       // convert C to bf16
buffer_store_short v0, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+1       // convert C to bf16
buffer_store_short v1, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+2       // convert C to bf16
buffer_store_short v2, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+3       // convert C to bf16
buffer_store_short v3, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+4       // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v4, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+5       // convert C to bf16
buffer_store_short v5, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+6       // convert C to bf16
buffer_store_short v6, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+7       // convert C to bf16
buffer_store_short v7, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+8       // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v8, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+9       // convert C to bf16
buffer_store_short v9, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+10     // convert C to bf16
buffer_store_short v10, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+11     // convert C to bf16
buffer_store_short v11, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+12     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v12, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+13     // convert C to bf16
buffer_store_short v13, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+14     // convert C to bf16
buffer_store_short v14, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+15     // convert C to bf16
buffer_store_short v15, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+16     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v16, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+17     // convert C to bf16
buffer_store_short v17, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+18     // convert C to bf16
buffer_store_short v18, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+19     // convert C to bf16
buffer_store_short v19, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+20     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v20, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+21     // convert C to bf16
buffer_store_short v21, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+22     // convert C to bf16
buffer_store_short v22, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+23    // convert C to bf16
buffer_store_short v23, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+24     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v24, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+25     // convert C to bf16
buffer_store_short v25, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+26     // convert C to bf16
buffer_store_short v26, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+27     // convert C to bf16
buffer_store_short v27, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+28     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v28, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+29     // convert C to bf16
buffer_store_short v29, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+30     // convert C to bf16
buffer_store_short v30, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+31     // convert C to bf16
buffer_store_short v31, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+32     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v32, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+33     // convert C to bf16
buffer_store_short v33, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+34     // convert C to bf16
buffer_store_short v34, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+35     // convert C to bf16
buffer_store_short v35, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+36     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v36, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+37     // convert C to bf16
buffer_store_short v37, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+38     // convert C to bf16
buffer_store_short v38, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+39     // convert C to bf16
buffer_store_short v39, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+40     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v40, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+41     // convert C to bf16
buffer_store_short v41, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+42     // convert C to bf16
buffer_store_short v42, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+43     // convert C to bf16
buffer_store_short v43, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+44     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v44, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+45     // convert C to bf16
buffer_store_short v45, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+46     // convert C to bf16
buffer_store_short v46, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+47     // convert C to bf16
buffer_store_short v47, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+48     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v48, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+49     // convert C to bf16
buffer_store_short v49, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+50     // convert C to bf16
buffer_store_short v50, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+51     // convert C to bf16
buffer_store_short v51, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+52     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v52, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+53     // convert C to bf16
buffer_store_short v53, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+54     // convert C to bf16
buffer_store_short v54, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+55     // convert C to bf16
buffer_store_short v55, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+56     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v56, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+57     // convert C to bf16
buffer_store_short v57, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+58     // convert C to bf16
buffer_store_short v58, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+59     // convert C to bf16
buffer_store_short v59, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+60     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v60, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+61     // convert C to bf16
buffer_store_short v61, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+62     // convert C to bf16
buffer_store_short v62, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+63     // convert C to bf16
buffer_store_short v63, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+64     // convert C to bf16
_v_add_lshl_u32 v134, v131, v128, 0x1              // inner add offset
s_mul_i32 s54, s[sgprStrideD1J], 32                // scale StrideD *= numRows(16) * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s54       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_short v64, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+65     // convert C to bf16
buffer_store_short v65, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+66     // convert C to bf16
buffer_store_short v66, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+67     // convert C to bf16
buffer_store_short v67, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+68     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v68, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+69     // convert C to bf16
buffer_store_short v69, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+70     // convert C to bf16
buffer_store_short v70, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+71     // convert C to bf16
buffer_store_short v71, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+72     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v72, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+73     // convert C to bf16
buffer_store_short v73, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+74     // convert C to bf16
buffer_store_short v74, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+75     // convert C to bf16
buffer_store_short v75, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+76     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v76, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+77     // convert C to bf16
buffer_store_short v77, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+78     // convert C to bf16
buffer_store_short v78, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+79     // convert C to bf16
buffer_store_short v79, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+80     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v80, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+81     // convert C to bf16
buffer_store_short v81, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+82    // convert C to bf16
buffer_store_short v82, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+83     // convert C to bf16
buffer_store_short v83, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+84    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v84, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+85     // convert C to bf16
buffer_store_short v85, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+86     // convert C to bf16
buffer_store_short v86, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+87     // convert C to bf16
buffer_store_short v87, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+88     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v88, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+89     // convert C to bf16
buffer_store_short v89, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+90     // convert C to bf16
buffer_store_short v90, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+91     // convert C to bf16
buffer_store_short v91, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+92     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v92, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+93     // convert C to bf16
buffer_store_short v93, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+94     // convert C to bf16
buffer_store_short v94, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+95     // convert C to bf16
buffer_store_short v95, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+96     // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v96, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+97     // convert C to bf16
buffer_store_short v97, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+98     // convert C to bf16
buffer_store_short v98, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+99     // convert C to bf16
buffer_store_short v99, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+100   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v100, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+101   // convert C to bf16
buffer_store_short v101, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+102   // convert C to bf16
buffer_store_short v102, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+103   // convert C to bf16
buffer_store_short v103, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+104   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v104, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+105   // convert C to bf16
buffer_store_short v105, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+106   // convert C to bf16
buffer_store_short v106, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+107   // convert C to bf16
buffer_store_short v107, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+108   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v108, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+109   // convert C to bf16
buffer_store_short v109, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+110   // convert C to bf16
buffer_store_short v110, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+111   // convert C to bf16
buffer_store_short v111, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+112   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v112, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+113   // convert C to bf16
buffer_store_short v113, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+114   // convert C to bf16
buffer_store_short v114, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+115   // convert C to bf16
buffer_store_short v115, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+116   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v116, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+117   // convert C to bf16
buffer_store_short v117, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+118   // convert C to bf16
buffer_store_short v118, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+119   // convert C to bf16
buffer_store_short v119, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+120   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v120, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+121   // convert C to bf16
buffer_store_short v121, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+122   // convert C to bf16
buffer_store_short v122, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+123   // convert C to bf16
buffer_store_short v123, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+124   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v124, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+125   // convert C to bf16
buffer_store_short v125, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+126   // convert C to bf16
buffer_store_short v126, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+127   // convert C to bf16
buffer_store_short v127, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
s_branch label_GW_End_37                           // jump to end
GW_B0_E1_29:

/* edge=1, allocate 46 sgpr. perBatch=6 perElement=2 elementsPerBatch=20 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw1); (0,0,0,1:vw1); (0,0,0,2:vw1); (0,0,0,3:vw1); (0,0,0,4:vw1); (0,0,0,5:vw1); (0,0,0,6:vw1); (0,0,0,7:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1); (0,1,0,2:vw1); (0,1,0,3:vw1); (0,1,0,4:vw1); (0,1,0,5:vw1); (0,1,0,6:vw1); (0,1,0,7:vw1); (0,0,1,0:vw1); (0,0,1,1:vw1); (0,0,1,2:vw1); (0,0,1,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,1) */
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v135, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v135, vcc, s[sgprStrideoffD+0], v135  // add 4* loop offset
v_cndmask_b32 v135, -1, v135, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v136, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+1], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v137, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v137, vcc, s[sgprStrideoffD+2], v137  // add 4* loop offset
v_cndmask_b32 v137, -1, v137, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,4) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v138, -1, v138, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,5) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v139, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v139, vcc, s[sgprStrideoffD+0], v139  // add 4* loop offset
v_cndmask_b32 v139, -1, v139, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,6) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+1], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,7) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v141, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v141, vcc, s[sgprStrideoffD+2], v141  // add 4* loop offset
v_cndmask_b32 v141, -1, v141, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,1) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v143, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v143, vcc, s[sgprStrideoffD+0], v143  // add 4* loop offset
v_cndmask_b32 v143, -1, v143, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,2) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+1], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,3) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v145, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v145, vcc, s[sgprStrideoffD+2], v145  // add 4* loop offset
v_cndmask_b32 v145, -1, v145, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,4) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v146, -1, v146, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,5) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v147, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v147, vcc, s[sgprStrideoffD+0], v147  // add 4* loop offset
v_cndmask_b32 v147, -1, v147, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,6) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+1], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,7) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v149, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v149, vcc, s[sgprStrideoffD+2], v149  // add 4* loop offset
v_cndmask_b32 v149, -1, v149, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,1) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v151, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v151, vcc, s[sgprStrideoffD+0], v151  // add 4* loop offset
v_cndmask_b32 v151, -1, v151, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,2) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+1], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,3) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v153, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v153, vcc, s[sgprStrideoffD+2], v153  // add 4* loop offset
v_cndmask_b32 v153, -1, v153, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 0, 0, 1), (0, 0, 0, 2), (0, 0, 0, 3), (0, 0, 0, 4), (0, 0, 0, 5), (0, 0, 0, 6), (0, 0, 0, 7), (0, 1, 0, 0), (0, 1, 0, 1), (0, 1, 0, 2), (0, 1, 0, 3), (0, 1, 0, 4), (0, 1, 0, 5), (0, 1, 0, 6), (0, 1, 0, 7), (0, 0, 1, 0), (0, 0, 1, 1), (0, 0, 1, 2), (0, 0, 1, 3)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha

/* apply mask, calc new C and issue writes */
v_mov_b32 v250, 0x7fff0000                         // fp32 Nan
v_mov_b32 v251, 0x7fff                             // rounding bias for bfloat16

FP32_TO_BF16 vgprValuC+0       // convert C to bf16
buffer_store_short v0, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+1       // convert C to bf16
buffer_store_short v1, v135, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+2       // convert C to bf16
buffer_store_short v2, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+3       // convert C to bf16
buffer_store_short v3, v137, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+4       // convert C to bf16
buffer_store_short v4, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+5       // convert C to bf16
buffer_store_short v5, v139, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+6       // convert C to bf16
buffer_store_short v6, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+7       // convert C to bf16
buffer_store_short v7, v141, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+8       // convert C to bf16
buffer_store_short v8, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+9       // convert C to bf16
buffer_store_short v9, v143, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+10     // convert C to bf16
buffer_store_short v10, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+11     // convert C to bf16
buffer_store_short v11, v145, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+12     // convert C to bf16
buffer_store_short v12, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+13     // convert C to bf16
buffer_store_short v13, v147, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+14     // convert C to bf16
buffer_store_short v14, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+15     // convert C to bf16
buffer_store_short v15, v149, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+16     // convert C to bf16
buffer_store_short v16, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+17     // convert C to bf16
buffer_store_short v17, v151, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+18     // convert C to bf16
buffer_store_short v18, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+19     // convert C to bf16
buffer_store_short v19, v153, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #1 (d1,d0,vc1,vc0) = */
/*    (0,0,1,4:vw1); (0,0,1,5:vw1); (0,0,1,6:vw1); (0,0,1,7:vw1); (0,1,1,0:vw1); (0,1,1,1:vw1); (0,1,1,2:vw1); (0,1,1,3:vw1); (0,1,1,4:vw1); (0,1,1,5:vw1); (0,1,1,6:vw1); (0,1,1,7:vw1); (0,0,2,0:vw1); (0,0,2,1:vw1); (0,0,2,2:vw1); (0,0,2,3:vw1); (0,0,2,4:vw1); (0,0,2,5:vw1); (0,0,2,6:vw1); (0,0,2,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,1,0,4) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,5) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v135, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v135, vcc, s[sgprStrideoffD+0], v135  // add 4* loop offset
v_cndmask_b32 v135, -1, v135, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,6) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+1], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,7) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v137, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v137, vcc, s[sgprStrideoffD+2], v137  // add 4* loop offset
v_cndmask_b32 v137, -1, v137, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v138, -1, v138, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,1) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=1
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v139, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v139, vcc, s[sgprStrideoffD+0], v139  // add 4* loop offset
v_cndmask_b32 v139, -1, v139, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,2) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=2
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+1], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,3) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=3
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v141, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v141, vcc, s[sgprStrideoffD+2], v141  // add 4* loop offset
v_cndmask_b32 v141, -1, v141, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,4) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,5) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v143, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v143, vcc, s[sgprStrideoffD+0], v143  // add 4* loop offset
v_cndmask_b32 v143, -1, v143, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,6) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+1], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,7) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v145, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v145, vcc, s[sgprStrideoffD+2], v145  // add 4* loop offset
v_cndmask_b32 v145, -1, v145, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,0) */
s_mov_b32 s54, 128                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v146, -1, v146, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v147, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v147, vcc, s[sgprStrideoffD+0], v147  // add 4* loop offset
v_cndmask_b32 v147, -1, v147, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+1], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v149, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v149, vcc, s[sgprStrideoffD+2], v149  // add 4* loop offset
v_cndmask_b32 v149, -1, v149, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,4) */
s_mov_b32 s54, 144                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v151, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v151, vcc, s[sgprStrideoffD+0], v151  // add 4* loop offset
v_cndmask_b32 v151, -1, v151, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+1], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v153, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v153, vcc, s[sgprStrideoffD+2], v153  // add 4* loop offset
v_cndmask_b32 v153, -1, v153, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 1, 4), (0, 0, 1, 5), (0, 0, 1, 6), (0, 0, 1, 7), (0, 1, 1, 0), (0, 1, 1, 1), (0, 1, 1, 2), (0, 1, 1, 3), (0, 1, 1, 4), (0, 1, 1, 5), (0, 1, 1, 6), (0, 1, 1, 7), (0, 0, 2, 0), (0, 0, 2, 1), (0, 0, 2, 2), (0, 0, 2, 3), (0, 0, 2, 4), (0, 0, 2, 5), (0, 0, 2, 6), (0, 0, 2, 7)] */
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha

/* apply mask, calc new C and issue writes */
FP32_TO_BF16 vgprValuC+20     // convert C to bf16
buffer_store_short v20, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+21     // convert C to bf16
buffer_store_short v21, v135, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+22     // convert C to bf16
buffer_store_short v22, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+23     // convert C to bf16
buffer_store_short v23, v137, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+24     // convert C to bf16
buffer_store_short v24, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+25     // convert C to bf16
buffer_store_short v25, v139, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+26     // convert C to bf16
buffer_store_short v26, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+27     // convert C to bf16
buffer_store_short v27, v141, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+28     // convert C to bf16
buffer_store_short v28, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+29     // convert C to bf16
buffer_store_short v29, v143, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+30     // convert C to bf16
buffer_store_short v30, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+31     // convert C to bf16
buffer_store_short v31, v145, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+32     // convert C to bf16
buffer_store_short v32, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+33     // convert C to bf16
buffer_store_short v33, v147, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+34     // convert C to bf16
buffer_store_short v34, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+35     // convert C to bf16
buffer_store_short v35, v149, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+36     // convert C to bf16
buffer_store_short v36, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+37     // convert C to bf16
buffer_store_short v37, v151, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+38     // convert C to bf16
buffer_store_short v38, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+39    // convert C to bf16
buffer_store_short v39, v153, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #2 (d1,d0,vc1,vc0) = */
/*    (0,1,2,0:vw1); (0,1,2,1:vw1); (0,1,2,2:vw1); (0,1,2,3:vw1); (0,1,2,4:vw1); (0,1,2,5:vw1); (0,1,2,6:vw1); (0,1,2,7:vw1); (0,0,3,0:vw1); (0,0,3,1:vw1); (0,0,3,2:vw1); (0,0,3,3:vw1); (0,0,3,4:vw1); (0,0,3,5:vw1); (0,0,3,6:vw1); (0,0,3,7:vw1); (0,1,3,0:vw1); (0,1,3,1:vw1); (0,1,3,2:vw1); (0,1,3,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,2,1,0) */
s_mov_b32 s54, 160                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v135, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v135, vcc, s[sgprStrideoffD+0], v135  // add 4* loop offset
v_cndmask_b32 v135, -1, v135, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+1], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v137, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v137, vcc, s[sgprStrideoffD+2], v137  // add 4* loop offset
v_cndmask_b32 v137, -1, v137, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,4) */
s_mov_b32 s54, 176                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v138, -1, v138, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v139, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v139, vcc, s[sgprStrideoffD+0], v139  // add 4* loop offset
v_cndmask_b32 v139, -1, v139, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+1], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v141, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v141, vcc, s[sgprStrideoffD+2], v141  // add 4* loop offset
v_cndmask_b32 v141, -1, v141, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,0) */
s_mov_b32 s54, 192                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v143, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v143, vcc, s[sgprStrideoffD+0], v143  // add 4* loop offset
v_cndmask_b32 v143, -1, v143, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+1], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v145, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v145, vcc, s[sgprStrideoffD+2], v145  // add 4* loop offset
v_cndmask_b32 v145, -1, v145, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,4) */
s_mov_b32 s54, 208                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v146, -1, v146, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v147, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v147, vcc, s[sgprStrideoffD+0], v147  // add 4* loop offset
v_cndmask_b32 v147, -1, v147, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+1], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v149, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v149, vcc, s[sgprStrideoffD+2], v149  // add 4* loop offset
v_cndmask_b32 v149, -1, v149, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,0) */
s_mov_b32 s54, 224                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v151, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v151, vcc, s[sgprStrideoffD+0], v151  // add 4* loop offset
v_cndmask_b32 v151, -1, v151, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+1], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v153, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v153, vcc, s[sgprStrideoffD+2], v153  // add 4* loop offset
v_cndmask_b32 v153, -1, v153, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 1, 2, 0), (0, 1, 2, 1), (0, 1, 2, 2), (0, 1, 2, 3), (0, 1, 2, 4), (0, 1, 2, 5), (0, 1, 2, 6), (0, 1, 2, 7), (0, 0, 3, 0), (0, 0, 3, 1), (0, 0, 3, 2), (0, 0, 3, 3), (0, 0, 3, 4), (0, 0, 3, 5), (0, 0, 3, 6), (0, 0, 3, 7), (0, 1, 3, 0), (0, 1, 3, 1), (0, 1, 3, 2), (0, 1, 3, 3)] */
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha

/* apply mask, calc new C and issue writes */
FP32_TO_BF16 vgprValuC+40     // convert C to bf16
buffer_store_short v40, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+41     // convert C to bf16
buffer_store_short v41, v135, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+42     // convert C to bf16
buffer_store_short v42, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+43     // convert C to bf16
buffer_store_short v43, v137, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+44     // convert C to bf16
buffer_store_short v44, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+45     // convert C to bf16
buffer_store_short v45, v139, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+46     // convert C to bf16
buffer_store_short v46, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+47     // convert C to bf16
buffer_store_short v47, v141, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+48     // convert C to bf16
buffer_store_short v48, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+49     // convert C to bf16
buffer_store_short v49, v143, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+50     // convert C to bf16
buffer_store_short v50, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+51     // convert C to bf16
buffer_store_short v51, v145, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+52     // convert C to bf16
buffer_store_short v52, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+53     // convert C to bf16
buffer_store_short v53, v147, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+54     // convert C to bf16
buffer_store_short v54, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+55     // convert C to bf16
buffer_store_short v55, v149, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+56     // convert C to bf16
buffer_store_short v56, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+57     // convert C to bf16
buffer_store_short v57, v151, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+58     // convert C to bf16
buffer_store_short v58, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+59     // convert C to bf16
buffer_store_short v59, v153, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #3 (d1,d0,vc1,vc0) = */
/*    (0,1,3,4:vw1); (0,1,3,5:vw1); (0,1,3,6:vw1); (0,1,3,7:vw1); (0,0,4,0:vw1); (0,0,4,1:vw1); (0,0,4,2:vw1); (0,0,4,3:vw1); (0,0,4,4:vw1); (0,0,4,5:vw1); (0,0,4,6:vw1); (0,0,4,7:vw1); (0,1,4,0:vw1); (0,1,4,1:vw1); (0,1,4,2:vw1); (0,1,4,3:vw1); (0,1,4,4:vw1); (0,1,4,5:vw1); (0,1,4,6:vw1); (0,1,4,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,3,1,4) */
s_mov_b32 s54, 240                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v135, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v135, vcc, s[sgprStrideoffD+0], v135  // add 4* loop offset
v_cndmask_b32 v135, -1, v135, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+1], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v137, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v137, vcc, s[sgprStrideoffD+2], v137  // add 4* loop offset
v_cndmask_b32 v137, -1, v137, s[66:67]             // LDD clip if OOB. offset


/* (d1,vc1,d0,vc0)=(0,4,0,0) */
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v138, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
s_mul_i32 s[sgprEdgeCheck+1], s[sgprStrideD1J], 32 // add offset stride
v_add_co_u32 v138, vcc, s[sgprEdgeCheck+1], v138   //
v_cndmask_b32 v138, -1, v138, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v139, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v139, vcc, s[sgprStrideoffD+0], v139  // add 4* loop offset
v_add_co_u32 v139, vcc, s[sgprEdgeCheck+1], v139   //
v_cndmask_b32 v139, -1, v139, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v140, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+1], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck+1], v140   //
v_cndmask_b32 v140, -1, v140, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v141, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v141, vcc, s[sgprStrideoffD+2], v141  // add 4* loop offset
v_add_co_u32 v141, vcc, s[sgprEdgeCheck+1], v141   //
v_cndmask_b32 v141, -1, v141, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,4) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck+1], v142   //
v_cndmask_b32 v142, -1, v142, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,5) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v143, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v143, vcc, s[sgprStrideoffD+0], v143  // add 4* loop offset
v_add_co_u32 v143, vcc, s[sgprEdgeCheck+1], v143   //
v_cndmask_b32 v143, -1, v143, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,6) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+1], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck+1], v144   //
v_cndmask_b32 v144, -1, v144, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,7) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v145, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v145, vcc, s[sgprStrideoffD+2], v145  // add 4* loop offset
v_add_co_u32 v145, vcc, s[sgprEdgeCheck+1], v145   //
v_cndmask_b32 v145, -1, v145, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,0) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprEdgeCheck+1], v146   //
v_cndmask_b32 v146, -1, v146, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,1) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v147, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v147, vcc, s[sgprStrideoffD+0], v147  // add 4* loop offset
v_add_co_u32 v147, vcc, s[sgprEdgeCheck+1], v147   //
v_cndmask_b32 v147, -1, v147, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,2) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+1], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck+1], v148   //
v_cndmask_b32 v148, -1, v148, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,3) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v149, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v149, vcc, s[sgprStrideoffD+2], v149  // add 4* loop offset
v_add_co_u32 v149, vcc, s[sgprEdgeCheck+1], v149   //
v_cndmask_b32 v149, -1, v149, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,4) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck+1], v150   //
v_cndmask_b32 v150, -1, v150, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,5) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v151, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v151, vcc, s[sgprStrideoffD+0], v151  // add 4* loop offset
v_add_co_u32 v151, vcc, s[sgprEdgeCheck+1], v151   //
v_cndmask_b32 v151, -1, v151, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,6) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+1], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck+1], v152   //
v_cndmask_b32 v152, -1, v152, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,7) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v153, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v153, vcc, s[sgprStrideoffD+2], v153  // add 4* loop offset
v_add_co_u32 v153, vcc, s[sgprEdgeCheck+1], v153   //
v_cndmask_b32 v153, -1, v153, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 1, 3, 4), (0, 1, 3, 5), (0, 1, 3, 6), (0, 1, 3, 7), (0, 0, 4, 0), (0, 0, 4, 1), (0, 0, 4, 2), (0, 0, 4, 3), (0, 0, 4, 4), (0, 0, 4, 5), (0, 0, 4, 6), (0, 0, 4, 7), (0, 1, 4, 0), (0, 1, 4, 1), (0, 1, 4, 2), (0, 1, 4, 3), (0, 1, 4, 4), (0, 1, 4, 5), (0, 1, 4, 6), (0, 1, 4, 7)] */
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha
v_mul_f32 v[vgprValuC+64], s[sgprAlpha], v[vgprValuC+64] // *= alpha
v_mul_f32 v[vgprValuC+65], s[sgprAlpha], v[vgprValuC+65] // *= alpha
v_mul_f32 v[vgprValuC+66], s[sgprAlpha], v[vgprValuC+66] // *= alpha
v_mul_f32 v[vgprValuC+67], s[sgprAlpha], v[vgprValuC+67] // *= alpha
v_mul_f32 v[vgprValuC+68], s[sgprAlpha], v[vgprValuC+68] // *= alpha
v_mul_f32 v[vgprValuC+69], s[sgprAlpha], v[vgprValuC+69] // *= alpha
v_mul_f32 v[vgprValuC+70], s[sgprAlpha], v[vgprValuC+70] // *= alpha
v_mul_f32 v[vgprValuC+71], s[sgprAlpha], v[vgprValuC+71] // *= alpha
v_mul_f32 v[vgprValuC+72], s[sgprAlpha], v[vgprValuC+72] // *= alpha
v_mul_f32 v[vgprValuC+73], s[sgprAlpha], v[vgprValuC+73] // *= alpha
v_mul_f32 v[vgprValuC+74], s[sgprAlpha], v[vgprValuC+74] // *= alpha
v_mul_f32 v[vgprValuC+75], s[sgprAlpha], v[vgprValuC+75] // *= alpha
v_mul_f32 v[vgprValuC+76], s[sgprAlpha], v[vgprValuC+76] // *= alpha
v_mul_f32 v[vgprValuC+77], s[sgprAlpha], v[vgprValuC+77] // *= alpha
v_mul_f32 v[vgprValuC+78], s[sgprAlpha], v[vgprValuC+78] // *= alpha
v_mul_f32 v[vgprValuC+79], s[sgprAlpha], v[vgprValuC+79] // *= alpha

/* apply mask, calc new C and issue writes */
FP32_TO_BF16 vgprValuC+60     // convert C to bf16
buffer_store_short v60, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+61     // convert C to bf16
buffer_store_short v61, v135, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+62     // convert C to bf16
buffer_store_short v62, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+63     // convert C to bf16
buffer_store_short v63, v137, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+64     // convert C to bf16
buffer_store_short v64, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+65     // convert C to bf16
buffer_store_short v65, v139, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+66     // convert C to bf16
buffer_store_short v66, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+67     // convert C to bf16
buffer_store_short v67, v141, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+68     // convert C to bf16
buffer_store_short v68, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+69     // convert C to bf16
buffer_store_short v69, v143, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+70     // convert C to bf16
buffer_store_short v70, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+71     // convert C to bf16
buffer_store_short v71, v145, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+72     // convert C to bf16
buffer_store_short v72, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+73     // convert C to bf16
buffer_store_short v73, v147, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+74     // convert C to bf16
buffer_store_short v74, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+75     // convert C to bf16
buffer_store_short v75, v149, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+76     // convert C to bf16
buffer_store_short v76, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+77     // convert C to bf16
buffer_store_short v77, v151, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+78     // convert C to bf16
buffer_store_short v78, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+79     // convert C to bf16
buffer_store_short v79, v153, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #4 (d1,d0,vc1,vc0) = */
/*    (0,0,5,0:vw1); (0,0,5,1:vw1); (0,0,5,2:vw1); (0,0,5,3:vw1); (0,0,5,4:vw1); (0,0,5,5:vw1); (0,0,5,6:vw1); (0,0,5,7:vw1); (0,1,5,0:vw1); (0,1,5,1:vw1); (0,1,5,2:vw1); (0,1,5,3:vw1); (0,1,5,4:vw1); (0,1,5,5:vw1); (0,1,5,6:vw1); (0,1,5,7:vw1); (0,0,6,0:vw1); (0,0,6,1:vw1); (0,0,6,2:vw1); (0,0,6,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,5,0,0) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck+1], v134   //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,1) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v135, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v135, vcc, s[sgprStrideoffD+0], v135  // add 4* loop offset
v_add_co_u32 v135, vcc, s[sgprEdgeCheck+1], v135   //
v_cndmask_b32 v135, -1, v135, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,2) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+1], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck+1], v136   //
v_cndmask_b32 v136, -1, v136, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,3) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v137, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v137, vcc, s[sgprStrideoffD+2], v137  // add 4* loop offset
v_add_co_u32 v137, vcc, s[sgprEdgeCheck+1], v137   //
v_cndmask_b32 v137, -1, v137, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,4) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprEdgeCheck+1], v138   //
v_cndmask_b32 v138, -1, v138, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,5) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v139, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v139, vcc, s[sgprStrideoffD+0], v139  // add 4* loop offset
v_add_co_u32 v139, vcc, s[sgprEdgeCheck+1], v139   //
v_cndmask_b32 v139, -1, v139, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,6) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+1], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck+1], v140   //
v_cndmask_b32 v140, -1, v140, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,7) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v141, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v141, vcc, s[sgprStrideoffD+2], v141  // add 4* loop offset
v_add_co_u32 v141, vcc, s[sgprEdgeCheck+1], v141   //
v_cndmask_b32 v141, -1, v141, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,0) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck+1], v142   //
v_cndmask_b32 v142, -1, v142, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,1) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=1
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v143, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v143, vcc, s[sgprStrideoffD+0], v143  // add 4* loop offset
v_add_co_u32 v143, vcc, s[sgprEdgeCheck+1], v143   //
v_cndmask_b32 v143, -1, v143, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,2) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=2
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+1], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck+1], v144   //
v_cndmask_b32 v144, -1, v144, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,3) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=3
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v145, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v145, vcc, s[sgprStrideoffD+2], v145  // add 4* loop offset
v_add_co_u32 v145, vcc, s[sgprEdgeCheck+1], v145   //
v_cndmask_b32 v145, -1, v145, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,4) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprEdgeCheck+1], v146   //
v_cndmask_b32 v146, -1, v146, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,5) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v147, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v147, vcc, s[sgprStrideoffD+0], v147  // add 4* loop offset
v_add_co_u32 v147, vcc, s[sgprEdgeCheck+1], v147   //
v_cndmask_b32 v147, -1, v147, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,6) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+1], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck+1], v148   //
v_cndmask_b32 v148, -1, v148, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,7) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v149, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v149, vcc, s[sgprStrideoffD+2], v149  // add 4* loop offset
v_add_co_u32 v149, vcc, s[sgprEdgeCheck+1], v149   //
v_cndmask_b32 v149, -1, v149, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,0) */
s_mov_b32 s54, 128                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck+1], v150   //
v_cndmask_b32 v150, -1, v150, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v151, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v151, vcc, s[sgprStrideoffD+0], v151  // add 4* loop offset
v_add_co_u32 v151, vcc, s[sgprEdgeCheck+1], v151   //
v_cndmask_b32 v151, -1, v151, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+1], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck+1], v152   //
v_cndmask_b32 v152, -1, v152, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v153, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v153, vcc, s[sgprStrideoffD+2], v153  // add 4* loop offset
v_add_co_u32 v153, vcc, s[sgprEdgeCheck+1], v153   //
v_cndmask_b32 v153, -1, v153, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 5, 0), (0, 0, 5, 1), (0, 0, 5, 2), (0, 0, 5, 3), (0, 0, 5, 4), (0, 0, 5, 5), (0, 0, 5, 6), (0, 0, 5, 7), (0, 1, 5, 0), (0, 1, 5, 1), (0, 1, 5, 2), (0, 1, 5, 3), (0, 1, 5, 4), (0, 1, 5, 5), (0, 1, 5, 6), (0, 1, 5, 7), (0, 0, 6, 0), (0, 0, 6, 1), (0, 0, 6, 2), (0, 0, 6, 3)] */
v_mul_f32 v[vgprValuC+80], s[sgprAlpha], v[vgprValuC+80] // *= alpha
v_mul_f32 v[vgprValuC+81], s[sgprAlpha], v[vgprValuC+81] // *= alpha
v_mul_f32 v[vgprValuC+82], s[sgprAlpha], v[vgprValuC+82] // *= alpha
v_mul_f32 v[vgprValuC+83], s[sgprAlpha], v[vgprValuC+83] // *= alpha
v_mul_f32 v[vgprValuC+84], s[sgprAlpha], v[vgprValuC+84] // *= alpha
v_mul_f32 v[vgprValuC+85], s[sgprAlpha], v[vgprValuC+85] // *= alpha
v_mul_f32 v[vgprValuC+86], s[sgprAlpha], v[vgprValuC+86] // *= alpha
v_mul_f32 v[vgprValuC+87], s[sgprAlpha], v[vgprValuC+87] // *= alpha
v_mul_f32 v[vgprValuC+88], s[sgprAlpha], v[vgprValuC+88] // *= alpha
v_mul_f32 v[vgprValuC+89], s[sgprAlpha], v[vgprValuC+89] // *= alpha
v_mul_f32 v[vgprValuC+90], s[sgprAlpha], v[vgprValuC+90] // *= alpha
v_mul_f32 v[vgprValuC+91], s[sgprAlpha], v[vgprValuC+91] // *= alpha
v_mul_f32 v[vgprValuC+92], s[sgprAlpha], v[vgprValuC+92] // *= alpha
v_mul_f32 v[vgprValuC+93], s[sgprAlpha], v[vgprValuC+93] // *= alpha
v_mul_f32 v[vgprValuC+94], s[sgprAlpha], v[vgprValuC+94] // *= alpha
v_mul_f32 v[vgprValuC+95], s[sgprAlpha], v[vgprValuC+95] // *= alpha
v_mul_f32 v[vgprValuC+96], s[sgprAlpha], v[vgprValuC+96] // *= alpha
v_mul_f32 v[vgprValuC+97], s[sgprAlpha], v[vgprValuC+97] // *= alpha
v_mul_f32 v[vgprValuC+98], s[sgprAlpha], v[vgprValuC+98] // *= alpha
v_mul_f32 v[vgprValuC+99], s[sgprAlpha], v[vgprValuC+99] // *= alpha

/* apply mask, calc new C and issue writes */
FP32_TO_BF16 vgprValuC+80     // convert C to bf16
buffer_store_short v80, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+81     // convert C to bf16
buffer_store_short v81, v135, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+82     // convert C to bf16
buffer_store_short v82, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+83     // convert C to bf16
buffer_store_short v83, v137, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+84     // convert C to bf16
buffer_store_short v84, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+85     // convert C to bf16
buffer_store_short v85, v139, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+86     // convert C to bf16
buffer_store_short v86, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+87     // convert C to bf16
buffer_store_short v87, v141, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+88     // convert C to bf16
buffer_store_short v88, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+89     // convert C to bf16
buffer_store_short v89, v143, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+90     // convert C to bf16
buffer_store_short v90, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+91     // convert C to bf16
buffer_store_short v91, v145, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+92     // convert C to bf16
buffer_store_short v92, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+93     // convert C to bf16
buffer_store_short v93, v147, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+94     // convert C to bf16
buffer_store_short v94, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+95     // convert C to bf16
buffer_store_short v95, v149, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+96     // convert C to bf16
buffer_store_short v96, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+97     // convert C to bf16
buffer_store_short v97, v151, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+98     // convert C to bf16
buffer_store_short v98, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+99     // convert C to bf16
buffer_store_short v99, v153, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #5 (d1,d0,vc1,vc0) = */
/*    (0,0,6,4:vw1); (0,0,6,5:vw1); (0,0,6,6:vw1); (0,0,6,7:vw1); (0,1,6,0:vw1); (0,1,6,1:vw1); (0,1,6,2:vw1); (0,1,6,3:vw1); (0,1,6,4:vw1); (0,1,6,5:vw1); (0,1,6,6:vw1); (0,1,6,7:vw1); (0,0,7,0:vw1); (0,0,7,1:vw1); (0,0,7,2:vw1); (0,0,7,3:vw1); (0,0,7,4:vw1); (0,0,7,5:vw1); (0,0,7,6:vw1); (0,0,7,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,6,0,4) */
s_mov_b32 s54, 144                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck+1], v134   //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v135, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v135, vcc, s[sgprStrideoffD+0], v135  // add 4* loop offset
v_add_co_u32 v135, vcc, s[sgprEdgeCheck+1], v135   //
v_cndmask_b32 v135, -1, v135, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+1], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck+1], v136   //
v_cndmask_b32 v136, -1, v136, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v137, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v137, vcc, s[sgprStrideoffD+2], v137  // add 4* loop offset
v_add_co_u32 v137, vcc, s[sgprEdgeCheck+1], v137   //
v_cndmask_b32 v137, -1, v137, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,0) */
s_mov_b32 s54, 160                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprEdgeCheck+1], v138   //
v_cndmask_b32 v138, -1, v138, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v139, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v139, vcc, s[sgprStrideoffD+0], v139  // add 4* loop offset
v_add_co_u32 v139, vcc, s[sgprEdgeCheck+1], v139   //
v_cndmask_b32 v139, -1, v139, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+1], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck+1], v140   //
v_cndmask_b32 v140, -1, v140, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v141, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v141, vcc, s[sgprStrideoffD+2], v141  // add 4* loop offset
v_add_co_u32 v141, vcc, s[sgprEdgeCheck+1], v141   //
v_cndmask_b32 v141, -1, v141, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,4) */
s_mov_b32 s54, 176                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck+1], v142   //
v_cndmask_b32 v142, -1, v142, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v143, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v143, vcc, s[sgprStrideoffD+0], v143  // add 4* loop offset
v_add_co_u32 v143, vcc, s[sgprEdgeCheck+1], v143   //
v_cndmask_b32 v143, -1, v143, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+1], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck+1], v144   //
v_cndmask_b32 v144, -1, v144, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v145, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v145, vcc, s[sgprStrideoffD+2], v145  // add 4* loop offset
v_add_co_u32 v145, vcc, s[sgprEdgeCheck+1], v145   //
v_cndmask_b32 v145, -1, v145, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,0) */
s_mov_b32 s54, 192                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprEdgeCheck+1], v146   //
v_cndmask_b32 v146, -1, v146, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v147, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v147, vcc, s[sgprStrideoffD+0], v147  // add 4* loop offset
v_add_co_u32 v147, vcc, s[sgprEdgeCheck+1], v147   //
v_cndmask_b32 v147, -1, v147, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+1], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck+1], v148   //
v_cndmask_b32 v148, -1, v148, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v149, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v149, vcc, s[sgprStrideoffD+2], v149  // add 4* loop offset
v_add_co_u32 v149, vcc, s[sgprEdgeCheck+1], v149   //
v_cndmask_b32 v149, -1, v149, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,4) */
s_mov_b32 s54, 208                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck+1], v150   //
v_cndmask_b32 v150, -1, v150, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v151, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v151, vcc, s[sgprStrideoffD+0], v151  // add 4* loop offset
v_add_co_u32 v151, vcc, s[sgprEdgeCheck+1], v151   //
v_cndmask_b32 v151, -1, v151, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+1], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck+1], v152   //
v_cndmask_b32 v152, -1, v152, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v153, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v153, vcc, s[sgprStrideoffD+2], v153  // add 4* loop offset
v_add_co_u32 v153, vcc, s[sgprEdgeCheck+1], v153   //
v_cndmask_b32 v153, -1, v153, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 6, 4), (0, 0, 6, 5), (0, 0, 6, 6), (0, 0, 6, 7), (0, 1, 6, 0), (0, 1, 6, 1), (0, 1, 6, 2), (0, 1, 6, 3), (0, 1, 6, 4), (0, 1, 6, 5), (0, 1, 6, 6), (0, 1, 6, 7), (0, 0, 7, 0), (0, 0, 7, 1), (0, 0, 7, 2), (0, 0, 7, 3), (0, 0, 7, 4), (0, 0, 7, 5), (0, 0, 7, 6), (0, 0, 7, 7)] */
v_mul_f32 v[vgprValuC+100], s[sgprAlpha], v[vgprValuC+100] // *= alpha
v_mul_f32 v[vgprValuC+101], s[sgprAlpha], v[vgprValuC+101] // *= alpha
v_mul_f32 v[vgprValuC+102], s[sgprAlpha], v[vgprValuC+102] // *= alpha
v_mul_f32 v[vgprValuC+103], s[sgprAlpha], v[vgprValuC+103] // *= alpha
v_mul_f32 v[vgprValuC+104], s[sgprAlpha], v[vgprValuC+104] // *= alpha
v_mul_f32 v[vgprValuC+105], s[sgprAlpha], v[vgprValuC+105] // *= alpha
v_mul_f32 v[vgprValuC+106], s[sgprAlpha], v[vgprValuC+106] // *= alpha
v_mul_f32 v[vgprValuC+107], s[sgprAlpha], v[vgprValuC+107] // *= alpha
v_mul_f32 v[vgprValuC+108], s[sgprAlpha], v[vgprValuC+108] // *= alpha
v_mul_f32 v[vgprValuC+109], s[sgprAlpha], v[vgprValuC+109] // *= alpha
v_mul_f32 v[vgprValuC+110], s[sgprAlpha], v[vgprValuC+110] // *= alpha
v_mul_f32 v[vgprValuC+111], s[sgprAlpha], v[vgprValuC+111] // *= alpha
v_mul_f32 v[vgprValuC+112], s[sgprAlpha], v[vgprValuC+112] // *= alpha
v_mul_f32 v[vgprValuC+113], s[sgprAlpha], v[vgprValuC+113] // *= alpha
v_mul_f32 v[vgprValuC+114], s[sgprAlpha], v[vgprValuC+114] // *= alpha
v_mul_f32 v[vgprValuC+115], s[sgprAlpha], v[vgprValuC+115] // *= alpha
v_mul_f32 v[vgprValuC+116], s[sgprAlpha], v[vgprValuC+116] // *= alpha
v_mul_f32 v[vgprValuC+117], s[sgprAlpha], v[vgprValuC+117] // *= alpha
v_mul_f32 v[vgprValuC+118], s[sgprAlpha], v[vgprValuC+118] // *= alpha
v_mul_f32 v[vgprValuC+119], s[sgprAlpha], v[vgprValuC+119] // *= alpha

/* apply mask, calc new C and issue writes */
FP32_TO_BF16 vgprValuC+100   // convert C to bf16
buffer_store_short v100, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+101   // convert C to bf16
buffer_store_short v101, v135, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+102   // convert C to bf16
buffer_store_short v102, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+103   // convert C to bf16
buffer_store_short v103, v137, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+104   // convert C to bf16
buffer_store_short v104, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+105   // convert C to bf16
buffer_store_short v105, v139, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+106   // convert C to bf16
buffer_store_short v106, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+107   // convert C to bf16
buffer_store_short v107, v141, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+108   // convert C to bf16
buffer_store_short v108, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+109   // convert C to bf16
buffer_store_short v109, v143, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+110   // convert C to bf16
buffer_store_short v110, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+111   // convert C to bf16
buffer_store_short v111, v145, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+112   // convert C to bf16
buffer_store_short v112, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+113   // convert C to bf16
buffer_store_short v113, v147, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+114   // convert C to bf16
buffer_store_short v114, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+115   // convert C to bf16
buffer_store_short v115, v149, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+116  // convert C to bf16
buffer_store_short v116, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+117   // convert C to bf16
buffer_store_short v117, v151, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+118   // convert C to bf16
buffer_store_short v118, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+119   // convert C to bf16
buffer_store_short v119, v153, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #6 (d1,d0,vc1,vc0) = */
/*    (0,1,7,0:vw1); (0,1,7,1:vw1); (0,1,7,2:vw1); (0,1,7,3:vw1); (0,1,7,4:vw1); (0,1,7,5:vw1); (0,1,7,6:vw1); (0,1,7,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,7,1,0) */
s_mov_b32 s54, 224                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck+1], v134   //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v135, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v135, vcc, s[sgprStrideoffD+0], v135  // add 4* loop offset
v_add_co_u32 v135, vcc, s[sgprEdgeCheck+1], v135   //
v_cndmask_b32 v135, -1, v135, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+1], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck+1], v136   //
v_cndmask_b32 v136, -1, v136, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v137, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v137, vcc, s[sgprStrideoffD+2], v137  // add 4* loop offset
v_add_co_u32 v137, vcc, s[sgprEdgeCheck+1], v137   //
v_cndmask_b32 v137, -1, v137, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,4) */
s_mov_b32 s54, 240                                  // coordOffset0 d0=1 vc0=3
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprEdgeCheck+1], v138   //
v_cndmask_b32 v138, -1, v138, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v139, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v139, vcc, s[sgprStrideoffD+0], v139  // add 4* loop offset
v_add_co_u32 v139, vcc, s[sgprEdgeCheck+1], v139   //
v_cndmask_b32 v139, -1, v139, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+1], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck+1], v140   //
v_cndmask_b32 v140, -1, v140, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v141, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v141, vcc, s[sgprStrideoffD+2], v141  // add 4* loop offset
v_add_co_u32 v141, vcc, s[sgprEdgeCheck+1], v141   //
v_cndmask_b32 v141, -1, v141, s[74:75]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 1, 7, 0), (0, 1, 7, 1), (0, 1, 7, 2), (0, 1, 7, 3), (0, 1, 7, 4), (0, 1, 7, 5), (0, 1, 7, 6), (0, 1, 7, 7)] */
v_mul_f32 v[vgprValuC+120], s[sgprAlpha], v[vgprValuC+120] // *= alpha
v_mul_f32 v[vgprValuC+121], s[sgprAlpha], v[vgprValuC+121] // *= alpha
v_mul_f32 v[vgprValuC+122], s[sgprAlpha], v[vgprValuC+122] // *= alpha
v_mul_f32 v[vgprValuC+123], s[sgprAlpha], v[vgprValuC+123] // *= alpha
v_mul_f32 v[vgprValuC+124], s[sgprAlpha], v[vgprValuC+124] // *= alpha
v_mul_f32 v[vgprValuC+125], s[sgprAlpha], v[vgprValuC+125] // *= alpha
v_mul_f32 v[vgprValuC+126], s[sgprAlpha], v[vgprValuC+126] // *= alpha
v_mul_f32 v[vgprValuC+127], s[sgprAlpha], v[vgprValuC+127] // *= alpha

/* apply mask, calc new C and issue writes */
FP32_TO_BF16 vgprValuC+120   // convert C to bf16
buffer_store_short v120, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+121   // convert C to bf16
buffer_store_short v121, v135, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+122   // convert C to bf16
buffer_store_short v122, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+123   // convert C to bf16
buffer_store_short v123, v137, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+124   // convert C to bf16
buffer_store_short v124, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+125   // convert C to bf16
buffer_store_short v125, v139, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+126   // convert C to bf16
buffer_store_short v126, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
FP32_TO_BF16 vgprValuC+127   // convert C to bf16
buffer_store_short v127, v141, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
s_branch label_GW_End_37                           // jump to end
GW_Beta_38:
s_and_b32 s54, 255, s[sgprSizeI]                   // s54 = s[sgprSizeI] % 256
s_add_u32 s56, -0x1, s[sgprNumWorkGroups0]         //
s_cmp_ge_u32 s[sgprWorkGroup0], s56                // wg0 >= nwg0-1 ?
s_cselect_b32 s54, s54, 0                          // set rMT0
s_cmpk_gt_u32 s54, 0x0                             // rMT0 > 0
s_cbranch_scc1 GW_B1_E1_36                         // jump if edges required
s_and_b32 s54, 255, s[sgprSizeJ]                   // s54 = s[sgprSizeJ] % 256
s_add_u32 s56, -0x1, s[sgprNumWorkGroups1]         //
s_cmp_ge_u32 s[sgprWorkGroup1], s56                // wg1 >= nwg1-1
s_cselect_b32 s54, s54, 0                          // set rMT1
s_cmpk_gt_u32 s54, 0x0                             // rMT1 > 0
s_cbranch_scc1 GW_B1_E1_36                         // jump if edges required
GW_B1_E0_33:

/* edge=0, allocate 2 sgpr. perBatch=2 perElement=0 elementsPerBatch=80 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw1); (0,0,0,1:vw1); (0,0,0,2:vw1); (0,0,0,3:vw1); (0,0,0,4:vw1); (0,0,0,5:vw1); (0,0,0,6:vw1); (0,0,0,7:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1); (0,1,0,2:vw1); (0,1,0,3:vw1); (0,1,0,4:vw1); (0,1,0,5:vw1); (0,1,0,6:vw1); (0,1,0,7:vw1); (0,0,1,0:vw1); (0,0,1,1:vw1); (0,0,1,2:vw1); (0,0,1,3:vw1); (0,0,1,4:vw1); (0,0,1,5:vw1); (0,0,1,6:vw1); (0,0,1,7:vw1); (0,1,1,0:vw1); (0,1,1,1:vw1); (0,1,1,2:vw1); (0,1,1,3:vw1); (0,1,1,4:vw1); (0,1,1,5:vw1); (0,1,1,6:vw1); (0,1,1,7:vw1); (0,0,2,0:vw1); (0,0,2,1:vw1); (0,0,2,2:vw1); (0,0,2,3:vw1); (0,0,2,4:vw1); (0,0,2,5:vw1); (0,0,2,6:vw1); (0,0,2,7:vw1); (0,1,2,0:vw1); (0,1,2,1:vw1); (0,1,2,2:vw1); (0,1,2,3:vw1); (0,1,2,4:vw1); (0,1,2,5:vw1); (0,1,2,6:vw1); (0,1,2,7:vw1); (0,0,3,0:vw1); (0,0,3,1:vw1); (0,0,3,2:vw1); (0,0,3,3:vw1); (0,0,3,4:vw1); (0,0,3,5:vw1); (0,0,3,6:vw1); (0,0,3,7:vw1); (0,1,3,0:vw1); (0,1,3,1:vw1); (0,1,3,2:vw1); (0,1,3,3:vw1); (0,1,3,4:vw1); (0,1,3,5:vw1); (0,1,3,6:vw1); (0,1,3,7:vw1); (0,0,4,0:vw1); (0,0,4,1:vw1); (0,0,4,2:vw1); (0,0,4,3:vw1); (0,0,4,4:vw1); (0,0,4,5:vw1); (0,0,4,6:vw1); (0,0,4,7:vw1); (0,1,4,0:vw1); (0,1,4,1:vw1); (0,1,4,2:vw1); (0,1,4,3:vw1); (0,1,4,4:vw1); (0,1,4,5:vw1); (0,1,4,6:vw1); (0,1,4,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
_v_add_lshl_u32 v134, v130, v128, 0x1              // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=128, coord0Vgpr=128
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,1) */
buffer_load_short_d16 v136, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_short_d16 v137, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,3) */
buffer_load_short_d16 v138, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v139, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,5) */
buffer_load_short_d16 v140, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,6) */
buffer_load_short_d16 v141, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,0,7) */
buffer_load_short_d16 v142, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v143, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,1) */
buffer_load_short_d16 v144, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,2) */
buffer_load_short_d16 v145, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,3) */
buffer_load_short_d16 v146, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v147, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,5) */
buffer_load_short_d16 v148, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,6) */
buffer_load_short_d16 v149, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,0,1,7) */
buffer_load_short_d16 v150, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v151, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,1) */
buffer_load_short_d16 v152, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,2) */
buffer_load_short_d16 v153, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,3) */
buffer_load_short_d16 v154, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v155, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,5) */
buffer_load_short_d16 v156, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,6) */
buffer_load_short_d16 v157, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,0,7) */
buffer_load_short_d16 v158, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v159, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,1) */
buffer_load_short_d16 v160, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,2) */
buffer_load_short_d16 v161, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,3) */
buffer_load_short_d16 v162, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v163, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,5) */
buffer_load_short_d16 v164, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,6) */
buffer_load_short_d16 v165, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,1,1,7) */
buffer_load_short_d16 v166, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v167, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,1) */
buffer_load_short_d16 v168, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,2) */
buffer_load_short_d16 v169, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,3) */
buffer_load_short_d16 v170, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v171, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,5) */
buffer_load_short_d16 v172, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,6) */
buffer_load_short_d16 v173, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,0,7) */
buffer_load_short_d16 v174, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v175, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,1) */
buffer_load_short_d16 v176, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,2) */
buffer_load_short_d16 v177, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,3) */
buffer_load_short_d16 v178, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v179, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,5) */
buffer_load_short_d16 v180, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,6) */
buffer_load_short_d16 v181, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,2,1,7) */
buffer_load_short_d16 v182, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v183, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,1) */
buffer_load_short_d16 v184, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,2) */
buffer_load_short_d16 v185, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,3) */
buffer_load_short_d16 v186, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v187, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,5) */
buffer_load_short_d16 v188, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,6) */
buffer_load_short_d16 v189, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,0,7) */
buffer_load_short_d16 v190, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v191, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,1) */
buffer_load_short_d16 v192, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,2) */
buffer_load_short_d16 v193, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,3) */
buffer_load_short_d16 v194, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v195, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,5) */
buffer_load_short_d16 v196, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,6) */
buffer_load_short_d16 v197, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,3,1,7) */
buffer_load_short_d16 v201, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,0) */
_v_add_lshl_u32 v134, v130, v128, 0x1              //
s_mul_i32 s54, s[sgprStrideC1J], 32                // scale StrideC *= numRows(16) * bpe
s_add_u32  s[sgprSrdC+0], s[sgprSrdC+0], s54       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdC+1], s[sgprSrdC+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_load_short_d16 v202, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,1) */
buffer_load_short_d16 v203, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,2) */
buffer_load_short_d16 v204, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,3) */
buffer_load_short_d16 v205, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v206, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,5) */
buffer_load_short_d16 v207, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,6) */
buffer_load_short_d16 v208, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,0,7) */
buffer_load_short_d16 v209, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v210, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,1) */
buffer_load_short_d16 v211, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,2) */
buffer_load_short_d16 v212, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,3) */
buffer_load_short_d16 v213, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v214, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,5) */
buffer_load_short_d16 v215, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,6) */
buffer_load_short_d16 v216, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,4,1,7) */
buffer_load_short_d16 v217, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v128, 0x1              // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=128, coord0Vgpr=128

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 0, 0, 1), (0, 0, 0, 2), (0, 0, 0, 3), (0, 0, 0, 4), (0, 0, 0, 5), (0, 0, 0, 6), (0, 0, 0, 7), (0, 1, 0, 0), (0, 1, 0, 1), (0, 1, 0, 2), (0, 1, 0, 3), (0, 1, 0, 4), (0, 1, 0, 5), (0, 1, 0, 6), (0, 1, 0, 7), (0, 0, 1, 0), (0, 0, 1, 1), (0, 0, 1, 2), (0, 0, 1, 3), (0, 0, 1, 4), (0, 0, 1, 5), (0, 0, 1, 6), (0, 0, 1, 7), (0, 1, 1, 0), (0, 1, 1, 1), (0, 1, 1, 2), (0, 1, 1, 3), (0, 1, 1, 4), (0, 1, 1, 5), (0, 1, 1, 6), (0, 1, 1, 7), (0, 0, 2, 0), (0, 0, 2, 1), (0, 0, 2, 2), (0, 0, 2, 3), (0, 0, 2, 4), (0, 0, 2, 5), (0, 0, 2, 6), (0, 0, 2, 7), (0, 1, 2, 0), (0, 1, 2, 1), (0, 1, 2, 2), (0, 1, 2, 3), (0, 1, 2, 4), (0, 1, 2, 5), (0, 1, 2, 6), (0, 1, 2, 7), (0, 0, 3, 0), (0, 0, 3, 1), (0, 0, 3, 2), (0, 0, 3, 3), (0, 0, 3, 4), (0, 0, 3, 5), (0, 0, 3, 6), (0, 0, 3, 7), (0, 1, 3, 0), (0, 1, 3, 1), (0, 1, 3, 2), (0, 1, 3, 3), (0, 1, 3, 4), (0, 1, 3, 5), (0, 1, 3, 6), (0, 1, 3, 7), (0, 0, 4, 0), (0, 0, 4, 1), (0, 0, 4, 2), (0, 0, 4, 3), (0, 0, 4, 4), (0, 0, 4, 5), (0, 0, 4, 6), (0, 0, 4, 7), (0, 1, 4, 0), (0, 1, 4, 1), (0, 1, 4, 2), (0, 1, 4, 3), (0, 1, 4, 4), (0, 1, 4, 5), (0, 1, 4, 6), (0, 1, 4, 7)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha
v_mul_f32 v[vgprValuC+64], s[sgprAlpha], v[vgprValuC+64] // *= alpha
v_mul_f32 v[vgprValuC+65], s[sgprAlpha], v[vgprValuC+65] // *= alpha
v_mul_f32 v[vgprValuC+66], s[sgprAlpha], v[vgprValuC+66] // *= alpha
v_mul_f32 v[vgprValuC+67], s[sgprAlpha], v[vgprValuC+67] // *= alpha
v_mul_f32 v[vgprValuC+68], s[sgprAlpha], v[vgprValuC+68] // *= alpha
v_mul_f32 v[vgprValuC+69], s[sgprAlpha], v[vgprValuC+69] // *= alpha
v_mul_f32 v[vgprValuC+70], s[sgprAlpha], v[vgprValuC+70] // *= alpha
v_mul_f32 v[vgprValuC+71], s[sgprAlpha], v[vgprValuC+71] // *= alpha
v_mul_f32 v[vgprValuC+72], s[sgprAlpha], v[vgprValuC+72] // *= alpha
v_mul_f32 v[vgprValuC+73], s[sgprAlpha], v[vgprValuC+73] // *= alpha
v_mul_f32 v[vgprValuC+74], s[sgprAlpha], v[vgprValuC+74] // *= alpha
v_mul_f32 v[vgprValuC+75], s[sgprAlpha], v[vgprValuC+75] // *= alpha
v_mul_f32 v[vgprValuC+76], s[sgprAlpha], v[vgprValuC+76] // *= alpha
v_mul_f32 v[vgprValuC+77], s[sgprAlpha], v[vgprValuC+77] // *= alpha
v_mul_f32 v[vgprValuC+78], s[sgprAlpha], v[vgprValuC+78] // *= alpha
v_mul_f32 v[vgprValuC+79], s[sgprAlpha], v[vgprValuC+79] // *= alpha

/* apply mask, calc new C and issue writes */
v_mov_b32 v250, 0x7fff0000                         // fp32 Nan
v_mov_b32 v251, 0x7fff                             // rounding bias for bfloat16

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 0 + 0 - 1
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+0], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+0                                    // convert C to bf16
buffer_store_short v0, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 1 + 1 - 1
v_lshlrev_b32 v252, 16, v136                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+1], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+1                                    // convert C to bf16
buffer_store_short v1, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 2 + 2 - 1
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+2], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+2                                    // convert C to bf16
buffer_store_short v2, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 3 + 3 - 1
v_lshlrev_b32 v252, 16, v138                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+3], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+3                                    // convert C to bf16
buffer_store_short v3, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 4 + 4 - 1
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+4], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+4                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v4, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 5 + 5 - 1
v_lshlrev_b32 v252, 16, v140                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+5], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+5                                    // convert C to bf16
buffer_store_short v5, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 6 + 6 - 1
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+6], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+6                                    // convert C to bf16
buffer_store_short v6, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 7 + 7 - 1
v_lshlrev_b32 v252, 16, v142                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+7], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+7                                    // convert C to bf16
buffer_store_short v7, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 8 + 8 - 1
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+8], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+8                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v8, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 9 + 9 - 1
v_lshlrev_b32 v252, 16, v144                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+9], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+9                                    // convert C to bf16
buffer_store_short v9, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 10 + 10 - 1
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+10], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+10                                    // convert C to bf16
buffer_store_short v10, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 11 + 11 - 1
v_lshlrev_b32 v252, 16, v146                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+11], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+11                                    // convert C to bf16
buffer_store_short v11, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 12 + 12 - 1
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+12], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+12                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v12, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 13 + 13 - 1
v_lshlrev_b32 v252, 16, v148                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+13], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+13                                    // convert C to bf16
buffer_store_short v13, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 14 + 14 - 1
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+14], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+14                                    // convert C to bf16
buffer_store_short v14, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 15 + 15 - 1
v_lshlrev_b32 v252, 16, v150                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+15], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+15                                    // convert C to bf16
buffer_store_short v15, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 16 + 16 - 1
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+16], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+16                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v16, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 17 + 17 - 1
v_lshlrev_b32 v252, 16, v152                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+17], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+17                                    // convert C to bf16
buffer_store_short v17, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 18 + 18 - 1
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+18], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+18                                    // convert C to bf16
buffer_store_short v18, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 19 + 19 - 1
v_lshlrev_b32 v252, 16, v154                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+19], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+19                                    // convert C to bf16
buffer_store_short v19, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 20 + 20 - 1
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+20], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+20                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v20, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 21 + 21 - 1
v_lshlrev_b32 v252, 16, v156                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+21], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+21                                    // convert C to bf16
buffer_store_short v21, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 22 + 22 - 1
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+22], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+22                                    // convert C to bf16
buffer_store_short v22, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 23 + 23 - 1
v_lshlrev_b32 v252, 16, v158                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+23], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+23                                    // convert C to bf16
buffer_store_short v23, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 24 + 24 - 1
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+24], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+24                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v24, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 25 + 25 - 1
v_lshlrev_b32 v252, 16, v160                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+25], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+25                                    // convert C to bf16
buffer_store_short v25, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 26 + 26 - 1
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+26], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+26                                    // convert C to bf16
buffer_store_short v26, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 27 + 27 - 1
v_lshlrev_b32 v252, 16, v162                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+27], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+27                                    // convert C to bf16
buffer_store_short v27, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 28 + 28 - 1
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+28], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+28                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v28, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 29 + 29 - 1
v_lshlrev_b32 v252, 16, v164                        // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+29], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+29                                    // convert C to bf16
buffer_store_short v29, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 30 + 30 - 1
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+30], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+30                                    // convert C to bf16
buffer_store_short v30, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 31 + 31 - 1
v_lshlrev_b32 v252, 16, v166                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+31], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+31                                    // convert C to bf16
buffer_store_short v31, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 32 + 32 - 1
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+32], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+32                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v32, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 33 + 33 - 1
v_lshlrev_b32 v252, 16, v168                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+33], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+33                                    // convert C to bf16
buffer_store_short v33, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 34 + 34 - 1
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+34], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+34                                    // convert C to bf16
buffer_store_short v34, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 35 + 35 - 1
v_lshlrev_b32 v252, 16, v170                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+35], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+35                                    // convert C to bf16
buffer_store_short v35, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 36 + 36 - 1
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+36], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+36                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v36, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 37 + 37 - 1
v_lshlrev_b32 v252, 16, v172                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+37], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+37                                    // convert C to bf16
buffer_store_short v37, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 38 + 38 - 1
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+38], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+38                                    // convert C to bf16
buffer_store_short v38, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 39 + 39 - 1
v_lshlrev_b32 v252, 16, v174                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+39], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+39                                    // convert C to bf16
buffer_store_short v39, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 40 + 40 - 1
v_lshlrev_b32 v252, 16, v175                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+40], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+40                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v40, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 41 + 41 - 1
v_lshlrev_b32 v252, 16, v176                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+41], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+41                                    // convert C to bf16
buffer_store_short v41, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 42 + 42 - 1
v_lshlrev_b32 v252, 16, v177                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+42], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+42                                    // convert C to bf16
buffer_store_short v42, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 43 + 43 - 1
v_lshlrev_b32 v252, 16, v178                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+43], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+43                                    // convert C to bf16
buffer_store_short v43, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 44 + 44 - 1
v_lshlrev_b32 v252, 16, v179                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+44], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+44                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v44, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 45 + 45 - 1
v_lshlrev_b32 v252, 16, v180                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+45], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+45                                    // convert C to bf16
buffer_store_short v45, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 46 + 46 - 1
v_lshlrev_b32 v252, 16, v181                        // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+46], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+46                                    // convert C to bf16
buffer_store_short v46, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 47 + 47 - 1
v_lshlrev_b32 v252, 16, v182                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+47], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+47                                    // convert C to bf16
buffer_store_short v47, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 48 + 48 - 1
v_lshlrev_b32 v252, 16, v183                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+48], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+48                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v48, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 49 + 49 - 1
v_lshlrev_b32 v252, 16, v184                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+49], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+49                                    // convert C to bf16
buffer_store_short v49, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 50 + 50 - 1
v_lshlrev_b32 v252, 16, v185                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+50], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+50                                    // convert C to bf16
buffer_store_short v50, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 51 + 51 - 1
v_lshlrev_b32 v252, 16, v186                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+51], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+51                                    // convert C to bf16
buffer_store_short v51, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 52 + 52 - 1
v_lshlrev_b32 v252, 16, v187                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+52], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+52                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v52, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 53 + 53 - 1
v_lshlrev_b32 v252, 16, v188                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+53], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+53                                    // convert C to bf16
buffer_store_short v53, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 54 + 54 - 1
v_lshlrev_b32 v252, 16, v189                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+54], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+54                                    // convert C to bf16
buffer_store_short v54, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 55 + 55 - 1
v_lshlrev_b32 v252, 16, v190                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+55], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+55                                    // convert C to bf16
buffer_store_short v55, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 56 + 56 - 1
v_lshlrev_b32 v252, 16, v191                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+56], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+56                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v56, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 57 + 57 - 1
v_lshlrev_b32 v252, 16, v192                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+57], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+57                                    // convert C to bf16
buffer_store_short v57, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 58 + 58 - 1
v_lshlrev_b32 v252, 16, v193                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+58], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+58                                    // convert C to bf16
buffer_store_short v58, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 59 + 59 - 1
v_lshlrev_b32 v252, 16, v194                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+59], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+59                                    // convert C to bf16
buffer_store_short v59, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 60 + 60 - 1
v_lshlrev_b32 v252, 16, v195                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+60], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+60                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v60, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 61 + 61 - 1
v_lshlrev_b32 v252, 16, v196                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+61], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+61                                    // convert C to bf16
buffer_store_short v61, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 62 + 62 - 1
v_lshlrev_b32 v252, 16, v197                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+62], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+62                                    // convert C to bf16
buffer_store_short v62, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 63 + 63 - 1
v_lshlrev_b32 v252, 16, v201                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+63], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+63                                    // convert C to bf16
buffer_store_short v63, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 64 + 64 - 1
v_lshlrev_b32 v252, 16, v202                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+64], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+64                                    // convert C to bf16
_v_add_lshl_u32 v134, v131, v128, 0x1              // inner add offset
s_mul_i32 s54, s[sgprStrideD1J], 32                // scale StrideD *= numRows(16) * bpe
s_add_u32  s[sgprSrdD+0], s[sgprSrdD+0], s54       // incToNextRow: gra SRD += inc(lower)
s_addc_u32  s[sgprSrdD+1], s[sgprSrdD+1], 0        // incToNextRow: gra SRD += inc(upper)
buffer_store_short v64, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 65 + 65 - 1
v_lshlrev_b32 v252, 16, v203                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+65], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+65                                    // convert C to bf16
buffer_store_short v65, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 66 + 66 - 1
v_lshlrev_b32 v252, 16, v204                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+66], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+66                                    // convert C to bf16
buffer_store_short v66, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 67 + 67 - 1
v_lshlrev_b32 v252, 16, v205                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+67], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+67                                    // convert C to bf16
buffer_store_short v67, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 68 + 68 - 1
v_lshlrev_b32 v252, 16, v206                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+68], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+68                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v68, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 69 + 69 - 1
v_lshlrev_b32 v252, 16, v207                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+69], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+69                                    // convert C to bf16
buffer_store_short v69, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 70 + 70 - 1
v_lshlrev_b32 v252, 16, v208                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+70], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+70                                    // convert C to bf16
buffer_store_short v70, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 71 + 71 - 1
v_lshlrev_b32 v252, 16, v209                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+71], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+71                                    // convert C to bf16
buffer_store_short v71, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 72 + 72 - 1
v_lshlrev_b32 v252, 16, v210                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+72], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+72                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v72, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 73 + 73 - 1
v_lshlrev_b32 v252, 16, v211                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+73], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+73                                    // convert C to bf16
buffer_store_short v73, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 74 + 74 - 1
v_lshlrev_b32 v252, 16, v212                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+74], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+74                                    // convert C to bf16
buffer_store_short v74, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 75 + 75 - 1
v_lshlrev_b32 v252, 16, v213                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+75], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+75                                    // convert C to bf16
buffer_store_short v75, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 76 + 76 - 1
v_lshlrev_b32 v252, 16, v214                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+76], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+76                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v76, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 77 + 77 - 1
v_lshlrev_b32 v252, 16, v215                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+77], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+77                                    // convert C to bf16
buffer_store_short v77, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 78 + 78 - 1
v_lshlrev_b32 v252, 16, v216                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+78], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+78                                    // convert C to bf16
buffer_store_short v78, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(63)                                // wait C (interleaved) 79 = 80 - 79 + 79 - 1
v_lshlrev_b32 v252, 16, v217                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+79], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+79                                    // convert C to bf16
buffer_store_short v79, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
/* optSingleColVgpr=1 optSharedColVgpr=0 optSharedMask=1 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Batch #1 (d1,d0,vc1,vc0) = */
/*    (0,0,5,0:vw1); (0,0,5,1:vw1); (0,0,5,2:vw1); (0,0,5,3:vw1); (0,0,5,4:vw1); (0,0,5,5:vw1); (0,0,5,6:vw1); (0,0,5,7:vw1); (0,1,5,0:vw1); (0,1,5,1:vw1); (0,1,5,2:vw1); (0,1,5,3:vw1); (0,1,5,4:vw1); (0,1,5,5:vw1); (0,1,5,6:vw1); (0,1,5,7:vw1); (0,0,6,0:vw1); (0,0,6,1:vw1); (0,0,6,2:vw1); (0,0,6,3:vw1); (0,0,6,4:vw1); (0,0,6,5:vw1); (0,0,6,6:vw1); (0,0,6,7:vw1); (0,1,6,0:vw1); (0,1,6,1:vw1); (0,1,6,2:vw1); (0,1,6,3:vw1); (0,1,6,4:vw1); (0,1,6,5:vw1); (0,1,6,6:vw1); (0,1,6,7:vw1); (0,0,7,0:vw1); (0,0,7,1:vw1); (0,0,7,2:vw1); (0,0,7,3:vw1); (0,0,7,4:vw1); (0,0,7,5:vw1); (0,0,7,6:vw1); (0,0,7,7:vw1); (0,1,7,0:vw1); (0,1,7,1:vw1); (0,1,7,2:vw1); (0,1,7,3:vw1); (0,1,7,4:vw1); (0,1,7,5:vw1); (0,1,7,6:vw1); (0,1,7,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,5,0,0) */
_v_add_lshl_u32 v134, v130, v128, 0x1              // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=128, coord0Vgpr=128
v_add_co_u32 v134, vcc, 0x60, v134                 // add offset
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,0,1) */
buffer_load_short_d16 v136, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,0,2) */
buffer_load_short_d16 v137, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,0,3) */
buffer_load_short_d16 v138, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v139, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,0,5) */
buffer_load_short_d16 v140, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,0,6) */
buffer_load_short_d16 v141, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,0,7) */
buffer_load_short_d16 v142, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v143, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,1) */
buffer_load_short_d16 v144, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,2) */
buffer_load_short_d16 v145, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,3) */
buffer_load_short_d16 v146, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v147, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,5) */
buffer_load_short_d16 v148, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,6) */
buffer_load_short_d16 v149, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,5,1,7) */
buffer_load_short_d16 v150, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v151, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,1) */
buffer_load_short_d16 v152, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,2) */
buffer_load_short_d16 v153, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,3) */
buffer_load_short_d16 v154, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v155, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,5) */
buffer_load_short_d16 v156, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,6) */
buffer_load_short_d16 v157, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,0,7) */
buffer_load_short_d16 v158, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v159, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,1) */
buffer_load_short_d16 v160, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,2) */
buffer_load_short_d16 v161, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,3) */
buffer_load_short_d16 v162, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v163, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,5) */
buffer_load_short_d16 v164, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,6) */
buffer_load_short_d16 v165, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,6,1,7) */
buffer_load_short_d16 v166, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v167, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,1) */
buffer_load_short_d16 v168, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,2) */
buffer_load_short_d16 v169, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,3) */
buffer_load_short_d16 v170, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v171, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,5) */
buffer_load_short_d16 v172, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,6) */
buffer_load_short_d16 v173, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,0,7) */
buffer_load_short_d16 v174, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,0) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v175, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,1) */
buffer_load_short_d16 v176, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,2) */
buffer_load_short_d16 v177, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,3) */
buffer_load_short_d16 v178, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,4) */
_v_add_co_u32 v134, vcc, v134, 32                  // load not edge offset
buffer_load_short_d16 v179, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,5) */
buffer_load_short_d16 v180, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+0], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,6) */
buffer_load_short_d16 v181, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+1], offen, offset:0 // load C for beta calc
/* (d1,vc1,d0,vc0)=(0,7,1,7) */
buffer_load_short_d16 v182, v134, s[sgprSrdC:sgprSrdC+3], s[sgprStrideoffC+2], offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v128, 0x1              // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=128, coord0Vgpr=128
v_add_co_u32 v134, vcc, 0x60, v134                 // add offset

/* rC *= alpha batchEements=[(0, 0, 5, 0), (0, 0, 5, 1), (0, 0, 5, 2), (0, 0, 5, 3), (0, 0, 5, 4), (0, 0, 5, 5), (0, 0, 5, 6), (0, 0, 5, 7), (0, 1, 5, 0), (0, 1, 5, 1), (0, 1, 5, 2), (0, 1, 5, 3), (0, 1, 5, 4), (0, 1, 5, 5), (0, 1, 5, 6), (0, 1, 5, 7), (0, 0, 6, 0), (0, 0, 6, 1), (0, 0, 6, 2), (0, 0, 6, 3), (0, 0, 6, 4), (0, 0, 6, 5), (0, 0, 6, 6), (0, 0, 6, 7), (0, 1, 6, 0), (0, 1, 6, 1), (0, 1, 6, 2), (0, 1, 6, 3), (0, 1, 6, 4), (0, 1, 6, 5), (0, 1, 6, 6), (0, 1, 6, 7), (0, 0, 7, 0), (0, 0, 7, 1), (0, 0, 7, 2), (0, 0, 7, 3), (0, 0, 7, 4), (0, 0, 7, 5), (0, 0, 7, 6), (0, 0, 7, 7), (0, 1, 7, 0), (0, 1, 7, 1), (0, 1, 7, 2), (0, 1, 7, 3), (0, 1, 7, 4), (0, 1, 7, 5), (0, 1, 7, 6), (0, 1, 7, 7)] */
v_mul_f32 v[vgprValuC+80], s[sgprAlpha], v[vgprValuC+80] // *= alpha
v_mul_f32 v[vgprValuC+81], s[sgprAlpha], v[vgprValuC+81] // *= alpha
v_mul_f32 v[vgprValuC+82], s[sgprAlpha], v[vgprValuC+82] // *= alpha
v_mul_f32 v[vgprValuC+83], s[sgprAlpha], v[vgprValuC+83] // *= alpha
v_mul_f32 v[vgprValuC+84], s[sgprAlpha], v[vgprValuC+84] // *= alpha
v_mul_f32 v[vgprValuC+85], s[sgprAlpha], v[vgprValuC+85] // *= alpha
v_mul_f32 v[vgprValuC+86], s[sgprAlpha], v[vgprValuC+86] // *= alpha
v_mul_f32 v[vgprValuC+87], s[sgprAlpha], v[vgprValuC+87] // *= alpha
v_mul_f32 v[vgprValuC+88], s[sgprAlpha], v[vgprValuC+88] // *= alpha
v_mul_f32 v[vgprValuC+89], s[sgprAlpha], v[vgprValuC+89] // *= alpha
v_mul_f32 v[vgprValuC+90], s[sgprAlpha], v[vgprValuC+90] // *= alpha
v_mul_f32 v[vgprValuC+91], s[sgprAlpha], v[vgprValuC+91] // *= alpha
v_mul_f32 v[vgprValuC+92], s[sgprAlpha], v[vgprValuC+92] // *= alpha
v_mul_f32 v[vgprValuC+93], s[sgprAlpha], v[vgprValuC+93] // *= alpha
v_mul_f32 v[vgprValuC+94], s[sgprAlpha], v[vgprValuC+94] // *= alpha
v_mul_f32 v[vgprValuC+95], s[sgprAlpha], v[vgprValuC+95] // *= alpha
v_mul_f32 v[vgprValuC+96], s[sgprAlpha], v[vgprValuC+96] // *= alpha
v_mul_f32 v[vgprValuC+97], s[sgprAlpha], v[vgprValuC+97] // *= alpha
v_mul_f32 v[vgprValuC+98], s[sgprAlpha], v[vgprValuC+98] // *= alpha
v_mul_f32 v[vgprValuC+99], s[sgprAlpha], v[vgprValuC+99] // *= alpha
v_mul_f32 v[vgprValuC+100], s[sgprAlpha], v[vgprValuC+100] // *= alpha
v_mul_f32 v[vgprValuC+101], s[sgprAlpha], v[vgprValuC+101] // *= alpha
v_mul_f32 v[vgprValuC+102], s[sgprAlpha], v[vgprValuC+102] // *= alpha
v_mul_f32 v[vgprValuC+103], s[sgprAlpha], v[vgprValuC+103] // *= alpha
v_mul_f32 v[vgprValuC+104], s[sgprAlpha], v[vgprValuC+104] // *= alpha
v_mul_f32 v[vgprValuC+105], s[sgprAlpha], v[vgprValuC+105] // *= alpha
v_mul_f32 v[vgprValuC+106], s[sgprAlpha], v[vgprValuC+106] // *= alpha
v_mul_f32 v[vgprValuC+107], s[sgprAlpha], v[vgprValuC+107] // *= alpha
v_mul_f32 v[vgprValuC+108], s[sgprAlpha], v[vgprValuC+108] // *= alpha
v_mul_f32 v[vgprValuC+109], s[sgprAlpha], v[vgprValuC+109] // *= alpha
v_mul_f32 v[vgprValuC+110], s[sgprAlpha], v[vgprValuC+110] // *= alpha
v_mul_f32 v[vgprValuC+111], s[sgprAlpha], v[vgprValuC+111] // *= alpha
v_mul_f32 v[vgprValuC+112], s[sgprAlpha], v[vgprValuC+112] // *= alpha
v_mul_f32 v[vgprValuC+113], s[sgprAlpha], v[vgprValuC+113] // *= alpha
v_mul_f32 v[vgprValuC+114], s[sgprAlpha], v[vgprValuC+114] // *= alpha
v_mul_f32 v[vgprValuC+115], s[sgprAlpha], v[vgprValuC+115] // *= alpha
v_mul_f32 v[vgprValuC+116], s[sgprAlpha], v[vgprValuC+116] // *= alpha
v_mul_f32 v[vgprValuC+117], s[sgprAlpha], v[vgprValuC+117] // *= alpha
v_mul_f32 v[vgprValuC+118], s[sgprAlpha], v[vgprValuC+118] // *= alpha
v_mul_f32 v[vgprValuC+119], s[sgprAlpha], v[vgprValuC+119] // *= alpha
v_mul_f32 v[vgprValuC+120], s[sgprAlpha], v[vgprValuC+120] // *= alpha
v_mul_f32 v[vgprValuC+121], s[sgprAlpha], v[vgprValuC+121] // *= alpha
v_mul_f32 v[vgprValuC+122], s[sgprAlpha], v[vgprValuC+122] // *= alpha
v_mul_f32 v[vgprValuC+123], s[sgprAlpha], v[vgprValuC+123] // *= alpha
v_mul_f32 v[vgprValuC+124], s[sgprAlpha], v[vgprValuC+124] // *= alpha
v_mul_f32 v[vgprValuC+125], s[sgprAlpha], v[vgprValuC+125] // *= alpha
v_mul_f32 v[vgprValuC+126], s[sgprAlpha], v[vgprValuC+126] // *= alpha
v_mul_f32 v[vgprValuC+127], s[sgprAlpha], v[vgprValuC+127] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 0 + 0 - 1
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+80], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+80                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v80, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 1 + 1 - 1
v_lshlrev_b32 v252, 16, v136                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+81], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+81                                    // convert C to bf16
buffer_store_short v81, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 2 + 2 - 1
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+82], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+82                                    // convert C to bf16
buffer_store_short v82, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 3 + 3 - 1
v_lshlrev_b32 v252, 16, v138                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+83], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+83                                    // convert C to bf16
buffer_store_short v83, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 4 + 4 - 1
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+84], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+84                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v84, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 5 + 5 - 1
v_lshlrev_b32 v252, 16, v140                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+85], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+85                                    // convert C to bf16
buffer_store_short v85, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 6 + 6 - 1
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+86], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+86                                    // convert C to bf16
buffer_store_short v86, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 7 + 7 - 1
v_lshlrev_b32 v252, 16, v142                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+87], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+87                                    // convert C to bf16
buffer_store_short v87, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 8 + 8 - 1
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+88], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+88                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v88, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 9 + 9 - 1
v_lshlrev_b32 v252, 16, v144                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+89], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+89                                    // convert C to bf16
buffer_store_short v89, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 10 + 10 - 1
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+90], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+90                                    // convert C to bf16
buffer_store_short v90, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 11 + 11 - 1
v_lshlrev_b32 v252, 16, v146                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+91], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+91                                    // convert C to bf16
buffer_store_short v91, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 12 + 12 - 1
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+92], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+92                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v92, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 13 + 13 - 1
v_lshlrev_b32 v252, 16, v148                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+93], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+93                                    // convert C to bf16
buffer_store_short v93, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 14 + 14 - 1
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+94], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+94                                    // convert C to bf16
buffer_store_short v94, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 15 + 15 - 1
v_lshlrev_b32 v252, 16, v150                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+95], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+95                                    // convert C to bf16
buffer_store_short v95, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 16 + 16 - 1
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+96], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+96                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v96, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 17 + 17 - 1
v_lshlrev_b32 v252, 16, v152                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+97], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+97                                    // convert C to bf16
buffer_store_short v97, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 18 + 18 - 1
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+98], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+98                                    // convert C to bf16
buffer_store_short v98, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 19 + 19 - 1
v_lshlrev_b32 v252, 16, v154                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+99], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+99                                    // convert C to bf16
buffer_store_short v99, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 20 + 20 - 1
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+100], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+100                                    // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v100, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 21 + 21 - 1
v_lshlrev_b32 v252, 16, v156                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+101], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+101                                    // convert C to bf16
buffer_store_short v101, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 22 + 22 - 1
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+102], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+102                                   // convert C to bf16
buffer_store_short v102, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 23 + 23 - 1
v_lshlrev_b32 v252, 16, v158                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+103], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+103                                   // convert C to bf16
buffer_store_short v103, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 24 + 24 - 1
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+104], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+104                                   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v104, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 25 + 25 - 1
v_lshlrev_b32 v252, 16, v160                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+105], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+105                                   // convert C to bf16
buffer_store_short v105, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 26 + 26 - 1
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+106], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+106                                   // convert C to bf16
buffer_store_short v106, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 27 + 27 - 1
v_lshlrev_b32 v252, 16, v162                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+107], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+107                                   // convert C to bf16
buffer_store_short v107, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 28 + 28 - 1
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+108], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+108                                   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v108, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 29 + 29 - 1
v_lshlrev_b32 v252, 16, v164                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+109], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+109                                   // convert C to bf16
buffer_store_short v109, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 30 + 30 - 1
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+110], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+110                                   // convert C to bf16
buffer_store_short v110, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 31 + 31 - 1
v_lshlrev_b32 v252, 16, v166                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+111], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+111                                   // convert C to bf16
buffer_store_short v111, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 32 + 32 - 1
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+112], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+112                                   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v112, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 33 + 33 - 1
v_lshlrev_b32 v252, 16, v168                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+113], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+113                                   // convert C to bf16
buffer_store_short v113, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 34 + 34 - 1
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+114], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+114                                   // convert C to bf16
buffer_store_short v114, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 35 + 35 - 1
v_lshlrev_b32 v252, 16, v170                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+115], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+115                                   // convert C to bf16
buffer_store_short v115, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 36 + 36 - 1
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+116], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+116                                   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v116, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 37 + 37 - 1
v_lshlrev_b32 v252, 16, v172                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+117], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+117                                   // convert C to bf16
buffer_store_short v117, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 38 + 38 - 1
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+118], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+118                                   // convert C to bf16
buffer_store_short v118, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 39 + 39 - 1
v_lshlrev_b32 v252, 16, v174                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+119], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+119                                   // convert C to bf16
buffer_store_short v119, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 40 + 40 - 1
v_lshlrev_b32 v252, 16, v175                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+120], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+120                                   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v120, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 41 + 41 - 1
v_lshlrev_b32 v252, 16, v176                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+121], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+121                                   // convert C to bf16
buffer_store_short v121, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 42 + 42 - 1
v_lshlrev_b32 v252, 16, v177                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+122], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+122                                   // convert C to bf16
buffer_store_short v122, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 43 + 43 - 1
v_lshlrev_b32 v252, 16, v178                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+123], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+123                                   // convert C to bf16
buffer_store_short v123, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 44 + 44 - 1
v_lshlrev_b32 v252, 16, v179                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+124], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+124                                   // convert C to bf16
v_add_co_u32 v134, vcc, 0x20, v134                 // add offset1
buffer_store_short v124, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 45 + 45 - 1
v_lshlrev_b32 v252, 16, v180                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+125], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+125                                   // convert C to bf16
buffer_store_short v125, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+0], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 46 + 46 - 1
v_lshlrev_b32 v252, 16, v181                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+126], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+126                                   // convert C to bf16
buffer_store_short v126, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+1], offen, offset:0 // store D

s_waitcnt vmcnt(47)                                // wait C (interleaved) 47 = 48 - 47 + 47 - 1
v_lshlrev_b32 v252, 16, v182                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+127], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+127                                   // convert C to bf16
buffer_store_short v127, v134, s[sgprSrdD:sgprSrdD+3], s[sgprStrideoffD+2], offen, offset:0 // store D
s_branch label_GW_End_37                           // jump to end
GW_B1_E1_36:

/* edge=1, allocate 46 sgpr. perBatch=6 perElement=2 elementsPerBatch=20 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw1); (0,0,0,1:vw1); (0,0,0,2:vw1); (0,0,0,3:vw1); (0,0,0,4:vw1); (0,0,0,5:vw1); (0,0,0,6:vw1); (0,0,0,7:vw1); (0,1,0,0:vw1); (0,1,0,1:vw1); (0,1,0,2:vw1); (0,1,0,3:vw1); (0,1,0,4:vw1); (0,1,0,5:vw1); (0,1,0,6:vw1); (0,1,0,7:vw1); (0,0,1,0:vw1); (0,0,1,1:vw1); (0,0,1,2:vw1); (0,0,1,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDC clip if OOB. offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,1) */
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v136, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffC+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDC clip if OOB. offset
buffer_load_short_d16 v137, v136, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v136, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v138, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffC+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDC clip if OOB. offset
buffer_load_short_d16 v139, v138, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v138, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffD+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v140, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffC+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDC clip if OOB. offset
buffer_load_short_d16 v141, v140, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v140, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,4) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v142, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDC clip if OOB. offset
buffer_load_short_d16 v143, v142, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,5) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v144, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffC+0], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDC clip if OOB. offset
buffer_load_short_d16 v145, v144, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+0], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,6) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v146, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffC+1], v146  // add 4* loop offset
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDC clip if OOB. offset
buffer_load_short_d16 v147, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffD+1], v146  // add 4* loop offset
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,7) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v148, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffC+2], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDC clip if OOB. offset
buffer_load_short_d16 v149, v148, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+2], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,0) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v150, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDC clip if OOB. offset
buffer_load_short_d16 v151, v150, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,1) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v152, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffC+0], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDC clip if OOB. offset
buffer_load_short_d16 v153, v152, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+0], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,2) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v154, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffC+1], v154  // add 4* loop offset
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDC clip if OOB. offset
buffer_load_short_d16 v155, v154, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v154, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffD+1], v154  // add 4* loop offset
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,3) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v156, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffC+2], v156  // add 4* loop offset
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDC clip if OOB. offset
buffer_load_short_d16 v157, v156, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v156, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffD+2], v156  // add 4* loop offset
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,4) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v158, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDC clip if OOB. offset
buffer_load_short_d16 v159, v158, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v158, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,5) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v160, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffC+0], v160  // add 4* loop offset
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDC clip if OOB. offset
buffer_load_short_d16 v161, v160, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v160, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffD+0], v160  // add 4* loop offset
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,6) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v162, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffC+1], v162  // add 4* loop offset
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDC clip if OOB. offset
buffer_load_short_d16 v163, v162, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v162, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffD+1], v162  // add 4* loop offset
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,1,7) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v164, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffC+2], v164  // add 4* loop offset
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDC clip if OOB. offset
buffer_load_short_d16 v165, v164, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v164, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffD+2], v164  // add 4* loop offset
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,0) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v166, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDC clip if OOB. offset
buffer_load_short_d16 v167, v166, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v166, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,1) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v168, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffC+0], v168  // add 4* loop offset
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDC clip if OOB. offset
buffer_load_short_d16 v169, v168, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v168, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffD+0], v168  // add 4* loop offset
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,2) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v170, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffC+1], v170  // add 4* loop offset
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDC clip if OOB. offset
buffer_load_short_d16 v171, v170, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v170, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffD+1], v170  // add 4* loop offset
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,3) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v172, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffC+2], v172  // add 4* loop offset
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDC clip if OOB. offset
buffer_load_short_d16 v173, v172, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v172, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffD+2], v172  // add 4* loop offset
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 0, 0), (0, 0, 0, 1), (0, 0, 0, 2), (0, 0, 0, 3), (0, 0, 0, 4), (0, 0, 0, 5), (0, 0, 0, 6), (0, 0, 0, 7), (0, 1, 0, 0), (0, 1, 0, 1), (0, 1, 0, 2), (0, 1, 0, 3), (0, 1, 0, 4), (0, 1, 0, 5), (0, 1, 0, 6), (0, 1, 0, 7), (0, 0, 1, 0), (0, 0, 1, 1), (0, 0, 1, 2), (0, 0, 1, 3)] */
v_mul_f32 v[vgprValuC+0], s[sgprAlpha], v[vgprValuC+0] // *= alpha
v_mul_f32 v[vgprValuC+1], s[sgprAlpha], v[vgprValuC+1] // *= alpha
v_mul_f32 v[vgprValuC+2], s[sgprAlpha], v[vgprValuC+2] // *= alpha
v_mul_f32 v[vgprValuC+3], s[sgprAlpha], v[vgprValuC+3] // *= alpha
v_mul_f32 v[vgprValuC+4], s[sgprAlpha], v[vgprValuC+4] // *= alpha
v_mul_f32 v[vgprValuC+5], s[sgprAlpha], v[vgprValuC+5] // *= alpha
v_mul_f32 v[vgprValuC+6], s[sgprAlpha], v[vgprValuC+6] // *= alpha
v_mul_f32 v[vgprValuC+7], s[sgprAlpha], v[vgprValuC+7] // *= alpha
v_mul_f32 v[vgprValuC+8], s[sgprAlpha], v[vgprValuC+8] // *= alpha
v_mul_f32 v[vgprValuC+9], s[sgprAlpha], v[vgprValuC+9] // *= alpha
v_mul_f32 v[vgprValuC+10], s[sgprAlpha], v[vgprValuC+10] // *= alpha
v_mul_f32 v[vgprValuC+11], s[sgprAlpha], v[vgprValuC+11] // *= alpha
v_mul_f32 v[vgprValuC+12], s[sgprAlpha], v[vgprValuC+12] // *= alpha
v_mul_f32 v[vgprValuC+13], s[sgprAlpha], v[vgprValuC+13] // *= alpha
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue writes */
v_mov_b32 v250, 0x7fff0000                         // fp32 Nan
v_mov_b32 v251, 0x7fff                             // rounding bias for bfloat16

v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+0], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+0                                    // convert C to bf16
buffer_store_short v0, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+1], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+1                                    // convert C to bf16
buffer_store_short v1, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+2], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+2                                    // convert C to bf16
buffer_store_short v2, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+3], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+3                                    // convert C to bf16
buffer_store_short v3, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+4], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+4                                    // convert C to bf16
buffer_store_short v4, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+5], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+5                                    // convert C to bf16
buffer_store_short v5, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+6], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+6                                    // convert C to bf16
buffer_store_short v6, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+7], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+7                                    // convert C to bf16
buffer_store_short v7, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+8], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+8                                    // convert C to bf16
buffer_store_short v8, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+9], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+9                                    // convert C to bf16
buffer_store_short v9, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+10], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+10                                    // convert C to bf16
buffer_store_short v10, v154, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+11], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+11                                    // convert C to bf16
buffer_store_short v11, v156, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+12], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+12                                    // convert C to bf16
buffer_store_short v12, v158, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+13], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+13                                    // convert C to bf16
buffer_store_short v13, v160, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+14], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+14                                    // convert C to bf16
buffer_store_short v14, v162, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+15], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+15                                    // convert C to bf16
buffer_store_short v15, v164, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+16], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+16                                    // convert C to bf16
buffer_store_short v16, v166, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+17], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+17                                    // convert C to bf16
buffer_store_short v17, v168, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+18], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+18                                    // convert C to bf16
buffer_store_short v18, v170, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+19], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+19                                    // convert C to bf16
buffer_store_short v19, v172, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #1 (d1,d0,vc1,vc0) = */
/*    (0,0,1,4:vw1); (0,0,1,5:vw1); (0,0,1,6:vw1); (0,0,1,7:vw1); (0,1,1,0:vw1); (0,1,1,1:vw1); (0,1,1,2:vw1); (0,1,1,3:vw1); (0,1,1,4:vw1); (0,1,1,5:vw1); (0,1,1,6:vw1); (0,1,1,7:vw1); (0,0,2,0:vw1); (0,0,2,1:vw1); (0,0,2,2:vw1); (0,0,2,3:vw1); (0,0,2,4:vw1); (0,0,2,5:vw1); (0,0,2,6:vw1); (0,0,2,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,1,0,4) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDC clip if OOB. offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,5) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v136, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffC+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDC clip if OOB. offset
buffer_load_short_d16 v137, v136, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,6) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v138, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffC+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDC clip if OOB. offset
buffer_load_short_d16 v139, v138, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffD+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,0,7) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v140, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffC+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDC clip if OOB. offset
buffer_load_short_d16 v141, v140, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,0) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v142, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDC clip if OOB. offset
buffer_load_short_d16 v143, v142, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,1) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=1
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v144, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffC+0], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDC clip if OOB. offset
buffer_load_short_d16 v145, v144, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+0], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,2) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=2
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v146, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffC+1], v146  // add 4* loop offset
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDC clip if OOB. offset
buffer_load_short_d16 v147, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffD+1], v146  // add 4* loop offset
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,3) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=3
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v148, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffC+2], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDC clip if OOB. offset
buffer_load_short_d16 v149, v148, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+2], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,4) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v129, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v150, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDC clip if OOB. offset
buffer_load_short_d16 v151, v150, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,5) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 4                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v152, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffC+0], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDC clip if OOB. offset
buffer_load_short_d16 v153, v152, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+0], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,6) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 8                   // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v154, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffC+1], v154  // add 4* loop offset
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDC clip if OOB. offset
buffer_load_short_d16 v155, v154, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v154, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffD+1], v154  // add 4* loop offset
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,1,1,7) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v156, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffC+2], v156  // add 4* loop offset
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDC clip if OOB. offset
buffer_load_short_d16 v157, v156, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v156, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffD+2], v156  // add 4* loop offset
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDD clip if OOB. offset

/* (d1,vc1,d0,vc0)=(0,2,0,0) */
s_mov_b32 s54, 128                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v158, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDC clip if OOB. offset
buffer_load_short_d16 v159, v158, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v158, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v160, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffC+0], v160  // add 4* loop offset
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDC clip if OOB. offset
buffer_load_short_d16 v161, v160, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v160, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffD+0], v160  // add 4* loop offset
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v162, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffC+1], v162  // add 4* loop offset
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDC clip if OOB. offset
buffer_load_short_d16 v163, v162, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v162, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffD+1], v162  // add 4* loop offset
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v164, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffC+2], v164  // add 4* loop offset
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDC clip if OOB. offset
buffer_load_short_d16 v165, v164, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v164, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffD+2], v164  // add 4* loop offset
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,4) */
s_mov_b32 s54, 144                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v166, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDC clip if OOB. offset
buffer_load_short_d16 v167, v166, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v166, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v168, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffC+0], v168  // add 4* loop offset
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDC clip if OOB. offset
buffer_load_short_d16 v169, v168, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v168, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffD+0], v168  // add 4* loop offset
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v170, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffC+1], v170  // add 4* loop offset
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDC clip if OOB. offset
buffer_load_short_d16 v171, v170, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v170, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffD+1], v170  // add 4* loop offset
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,0,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v172, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffC+2], v172  // add 4* loop offset
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDC clip if OOB. offset
buffer_load_short_d16 v173, v172, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v172, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffD+2], v172  // add 4* loop offset
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 1, 4), (0, 0, 1, 5), (0, 0, 1, 6), (0, 0, 1, 7), (0, 1, 1, 0), (0, 1, 1, 1), (0, 1, 1, 2), (0, 1, 1, 3), (0, 1, 1, 4), (0, 1, 1, 5), (0, 1, 1, 6), (0, 1, 1, 7), (0, 0, 2, 0), (0, 0, 2, 1), (0, 0, 2, 2), (0, 0, 2, 3), (0, 0, 2, 4), (0, 0, 2, 5), (0, 0, 2, 6), (0, 0, 2, 7)] */
v_mul_f32 v[vgprValuC+20], s[sgprAlpha], v[vgprValuC+20] // *= alpha
v_mul_f32 v[vgprValuC+21], s[sgprAlpha], v[vgprValuC+21] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
v_mul_f32 v[vgprValuC+30], s[sgprAlpha], v[vgprValuC+30] // *= alpha
v_mul_f32 v[vgprValuC+31], s[sgprAlpha], v[vgprValuC+31] // *= alpha
v_mul_f32 v[vgprValuC+32], s[sgprAlpha], v[vgprValuC+32] // *= alpha
v_mul_f32 v[vgprValuC+33], s[sgprAlpha], v[vgprValuC+33] // *= alpha
v_mul_f32 v[vgprValuC+34], s[sgprAlpha], v[vgprValuC+34] // *= alpha
v_mul_f32 v[vgprValuC+35], s[sgprAlpha], v[vgprValuC+35] // *= alpha
v_mul_f32 v[vgprValuC+36], s[sgprAlpha], v[vgprValuC+36] // *= alpha
v_mul_f32 v[vgprValuC+37], s[sgprAlpha], v[vgprValuC+37] // *= alpha
v_mul_f32 v[vgprValuC+38], s[sgprAlpha], v[vgprValuC+38] // *= alpha
v_mul_f32 v[vgprValuC+39], s[sgprAlpha], v[vgprValuC+39] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue writes */
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+20], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+20                                    // convert C to bf16
buffer_store_short v20, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+21], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+21                                    // convert C to bf16
buffer_store_short v21, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+22], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+22                                    // convert C to bf16
buffer_store_short v22, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+23], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+23                                    // convert C to bf16
buffer_store_short v23, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+24], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+24                                    // convert C to bf16
buffer_store_short v24, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+25], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+25                                    // convert C to bf16
buffer_store_short v25, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+26], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+26                                    // convert C to bf16
buffer_store_short v26, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+27], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+27                                    // convert C to bf16
buffer_store_short v27, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+28], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+28                                    // convert C to bf16
buffer_store_short v28, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+29], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+29                                    // convert C to bf16
buffer_store_short v29, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+30], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+30                                    // convert C to bf16
buffer_store_short v30, v154, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+31], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+31                                   // convert C to bf16
buffer_store_short v31, v156, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+32], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+32                                    // convert C to bf16
buffer_store_short v32, v158, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+33], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+33                                    // convert C to bf16
buffer_store_short v33, v160, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+34], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+34                                    // convert C to bf16
buffer_store_short v34, v162, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+35], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+35                                    // convert C to bf16
buffer_store_short v35, v164, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+36], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+36                                    // convert C to bf16
buffer_store_short v36, v166, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+37], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+37                                    // convert C to bf16
buffer_store_short v37, v168, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+38], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+38                                    // convert C to bf16
buffer_store_short v38, v170, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+39], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+39                                    // convert C to bf16
buffer_store_short v39, v172, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #2 (d1,d0,vc1,vc0) = */
/*    (0,1,2,0:vw1); (0,1,2,1:vw1); (0,1,2,2:vw1); (0,1,2,3:vw1); (0,1,2,4:vw1); (0,1,2,5:vw1); (0,1,2,6:vw1); (0,1,2,7:vw1); (0,0,3,0:vw1); (0,0,3,1:vw1); (0,0,3,2:vw1); (0,0,3,3:vw1); (0,0,3,4:vw1); (0,0,3,5:vw1); (0,0,3,6:vw1); (0,0,3,7:vw1); (0,1,3,0:vw1); (0,1,3,1:vw1); (0,1,3,2:vw1); (0,1,3,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,2,1,0) */
s_mov_b32 s54, 160                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDC clip if OOB. offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v136, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffC+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDC clip if OOB. offset
buffer_load_short_d16 v137, v136, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v138, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffC+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDC clip if OOB. offset
buffer_load_short_d16 v139, v138, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffD+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v140, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffC+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDC clip if OOB. offset
buffer_load_short_d16 v141, v140, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,4) */
s_mov_b32 s54, 176                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v142, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDC clip if OOB. offset
buffer_load_short_d16 v143, v142, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v144, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffC+0], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDC clip if OOB. offset
buffer_load_short_d16 v145, v144, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+0], v144  // add 4* loop offset
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v146, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffC+1], v146  // add 4* loop offset
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDC clip if OOB. offset
buffer_load_short_d16 v147, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffD+1], v146  // add 4* loop offset
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,2,1,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v148, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffC+2], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDC clip if OOB. offset
buffer_load_short_d16 v149, v148, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+2], v148  // add 4* loop offset
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,0) */
s_mov_b32 s54, 192                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v150, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDC clip if OOB. offset
buffer_load_short_d16 v151, v150, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v152, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffC+0], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDC clip if OOB. offset
buffer_load_short_d16 v153, v152, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+0], v152  // add 4* loop offset
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v154, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffC+1], v154  // add 4* loop offset
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDC clip if OOB. offset
buffer_load_short_d16 v155, v154, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v154, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffD+1], v154  // add 4* loop offset
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v156, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffC+2], v156  // add 4* loop offset
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDC clip if OOB. offset
buffer_load_short_d16 v157, v156, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v156, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffD+2], v156  // add 4* loop offset
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,4) */
s_mov_b32 s54, 208                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v158, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDC clip if OOB. offset
buffer_load_short_d16 v159, v158, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v158, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v160, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffC+0], v160  // add 4* loop offset
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDC clip if OOB. offset
buffer_load_short_d16 v161, v160, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v160, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffD+0], v160  // add 4* loop offset
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v162, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffC+1], v162  // add 4* loop offset
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDC clip if OOB. offset
buffer_load_short_d16 v163, v162, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v162, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffD+1], v162  // add 4* loop offset
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,0,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v164, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffC+2], v164  // add 4* loop offset
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDC clip if OOB. offset
buffer_load_short_d16 v165, v164, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v164, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffD+2], v164  // add 4* loop offset
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,0) */
s_mov_b32 s54, 224                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v166, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDC clip if OOB. offset
buffer_load_short_d16 v167, v166, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v166, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,1) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v168, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffC+0], v168  // add 4* loop offset
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDC clip if OOB. offset
buffer_load_short_d16 v169, v168, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v168, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffD+0], v168  // add 4* loop offset
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,2) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v170, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffC+1], v170  // add 4* loop offset
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDC clip if OOB. offset
buffer_load_short_d16 v171, v170, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v170, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffD+1], v170  // add 4* loop offset
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,3) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v172, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffC+2], v172  // add 4* loop offset
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDC clip if OOB. offset
buffer_load_short_d16 v173, v172, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v172, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffD+2], v172  // add 4* loop offset
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 1, 2, 0), (0, 1, 2, 1), (0, 1, 2, 2), (0, 1, 2, 3), (0, 1, 2, 4), (0, 1, 2, 5), (0, 1, 2, 6), (0, 1, 2, 7), (0, 0, 3, 0), (0, 0, 3, 1), (0, 0, 3, 2), (0, 0, 3, 3), (0, 0, 3, 4), (0, 0, 3, 5), (0, 0, 3, 6), (0, 0, 3, 7), (0, 1, 3, 0), (0, 1, 3, 1), (0, 1, 3, 2), (0, 1, 3, 3)] */
v_mul_f32 v[vgprValuC+40], s[sgprAlpha], v[vgprValuC+40] // *= alpha
v_mul_f32 v[vgprValuC+41], s[sgprAlpha], v[vgprValuC+41] // *= alpha
v_mul_f32 v[vgprValuC+42], s[sgprAlpha], v[vgprValuC+42] // *= alpha
v_mul_f32 v[vgprValuC+43], s[sgprAlpha], v[vgprValuC+43] // *= alpha
v_mul_f32 v[vgprValuC+44], s[sgprAlpha], v[vgprValuC+44] // *= alpha
v_mul_f32 v[vgprValuC+45], s[sgprAlpha], v[vgprValuC+45] // *= alpha
v_mul_f32 v[vgprValuC+46], s[sgprAlpha], v[vgprValuC+46] // *= alpha
v_mul_f32 v[vgprValuC+47], s[sgprAlpha], v[vgprValuC+47] // *= alpha
v_mul_f32 v[vgprValuC+48], s[sgprAlpha], v[vgprValuC+48] // *= alpha
v_mul_f32 v[vgprValuC+49], s[sgprAlpha], v[vgprValuC+49] // *= alpha
v_mul_f32 v[vgprValuC+50], s[sgprAlpha], v[vgprValuC+50] // *= alpha
v_mul_f32 v[vgprValuC+51], s[sgprAlpha], v[vgprValuC+51] // *= alpha
v_mul_f32 v[vgprValuC+52], s[sgprAlpha], v[vgprValuC+52] // *= alpha
v_mul_f32 v[vgprValuC+53], s[sgprAlpha], v[vgprValuC+53] // *= alpha
v_mul_f32 v[vgprValuC+54], s[sgprAlpha], v[vgprValuC+54] // *= alpha
v_mul_f32 v[vgprValuC+55], s[sgprAlpha], v[vgprValuC+55] // *= alpha
v_mul_f32 v[vgprValuC+56], s[sgprAlpha], v[vgprValuC+56] // *= alpha
v_mul_f32 v[vgprValuC+57], s[sgprAlpha], v[vgprValuC+57] // *= alpha
v_mul_f32 v[vgprValuC+58], s[sgprAlpha], v[vgprValuC+58] // *= alpha
v_mul_f32 v[vgprValuC+59], s[sgprAlpha], v[vgprValuC+59] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue writes */
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+40], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+40                                    // convert C to bf16
buffer_store_short v40, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+41], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+41                                    // convert C to bf16
buffer_store_short v41, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+42], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+42                                    // convert C to bf16
buffer_store_short v42, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+43], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+43                                    // convert C to bf16
buffer_store_short v43, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+44], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+44                                    // convert C to bf16
buffer_store_short v44, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+45], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+45                                    // convert C to bf16
buffer_store_short v45, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+46], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+46                                    // convert C to bf16
buffer_store_short v46, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+47], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+47                                    // convert C to bf16
buffer_store_short v47, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+48], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+48                                    // convert C to bf16
buffer_store_short v48, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+49], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+49                                    // convert C to bf16
buffer_store_short v49, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+50], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+50                                    // convert C to bf16
buffer_store_short v50, v154, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+51], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+51                                    // convert C to bf16
buffer_store_short v51, v156, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+52], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+52                                    // convert C to bf16
buffer_store_short v52, v158, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+53], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+53                                    // convert C to bf16
buffer_store_short v53, v160, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+54], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+54                                    // convert C to bf16
buffer_store_short v54, v162, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+55], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+55                                    // convert C to bf16
buffer_store_short v55, v164, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+56], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+56                                    // convert C to bf16
buffer_store_short v56, v166, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+57], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+57                                    // convert C to bf16
buffer_store_short v57, v168, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+58], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+58                                    // convert C to bf16
buffer_store_short v58, v170, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+59], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+59                                    // convert C to bf16
buffer_store_short v59, v172, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #3 (d1,d0,vc1,vc0) = */
/*    (0,1,3,4:vw1); (0,1,3,5:vw1); (0,1,3,6:vw1); (0,1,3,7:vw1); (0,0,4,0:vw1); (0,0,4,1:vw1); (0,0,4,2:vw1); (0,0,4,3:vw1); (0,0,4,4:vw1); (0,0,4,5:vw1); (0,0,4,6:vw1); (0,0,4,7:vw1); (0,1,4,0:vw1); (0,1,4,1:vw1); (0,1,4,2:vw1); (0,1,4,3:vw1); (0,1,4,4:vw1); (0,1,4,5:vw1); (0,1,4,6:vw1); (0,1,4,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,3,1,4) */
s_mov_b32 s54, 240                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 0                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDC clip if OOB. offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,5) */
_v_add_co_u32 v133, vcc, v129, 4                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v136, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffC+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDC clip if OOB. offset
buffer_load_short_d16 v137, v136, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+0], v136  // add 4* loop offset
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,6) */
_v_add_co_u32 v133, vcc, v129, 8                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v138, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffC+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDC clip if OOB. offset
buffer_load_short_d16 v139, v138, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffD+1], v138  // add 4* loop offset
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,3,1,7) */
_v_add_co_u32 v133, vcc, v129, 12                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v140, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffC+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDC clip if OOB. offset
buffer_load_short_d16 v141, v140, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+2], v140  // add 4* loop offset
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDD clip if OOB. offset


/* (d1,vc1,d0,vc0)=(0,4,0,0) */
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v142, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
s_mul_i32 s[sgprEdgeCheck], s[sgprStrideC1J], 32   // add offset stride
v_add_co_u32 v142, vcc, s[sgprEdgeCheck], v142     //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDC clip if OOB. offset
buffer_load_short_d16 v143, v142, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v142, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
s_mul_i32 s[sgprEdgeCheck+1], s[sgprStrideD1J], 32 // add offset stride
v_add_co_u32 v142, vcc, s[sgprEdgeCheck+1], v142   //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v144, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffC+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck], v144     //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDC clip if OOB. offset
buffer_load_short_d16 v145, v144, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v144, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck+1], v144   //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v146, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffC+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck], v146     //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDC clip if OOB. offset
buffer_load_short_d16 v147, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v146, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffD+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck+1], v146   //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v128, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v148, v130, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffC+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck], v148     //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDC clip if OOB. offset
buffer_load_short_d16 v149, v148, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v148, v131, v128, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck+1], v148   //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,4) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v150, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck], v150     //
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDC clip if OOB. offset
buffer_load_short_d16 v151, v150, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck+1], v150   //
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,5) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v152, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffC+0], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck], v152     //
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDC clip if OOB. offset
buffer_load_short_d16 v153, v152, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+0], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck+1], v152   //
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,6) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v154, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffC+1], v154  // add 4* loop offset
v_add_co_u32 v154, vcc, s[sgprEdgeCheck], v154     //
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDC clip if OOB. offset
buffer_load_short_d16 v155, v154, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v154, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffD+1], v154  // add 4* loop offset
v_add_co_u32 v154, vcc, s[sgprEdgeCheck+1], v154   //
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,0,7) */
_v_add_co_u32 v132, vcc, v128, 16                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v156, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffC+2], v156  // add 4* loop offset
v_add_co_u32 v156, vcc, s[sgprEdgeCheck], v156     //
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDC clip if OOB. offset
buffer_load_short_d16 v157, v156, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v156, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffD+2], v156  // add 4* loop offset
v_add_co_u32 v156, vcc, s[sgprEdgeCheck+1], v156   //
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,0) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v158, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v158, vcc, s[sgprEdgeCheck], v158     //
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDC clip if OOB. offset
buffer_load_short_d16 v159, v158, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v158, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v158, vcc, s[sgprEdgeCheck+1], v158   //
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,1) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v160, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffC+0], v160  // add 4* loop offset
v_add_co_u32 v160, vcc, s[sgprEdgeCheck], v160     //
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDC clip if OOB. offset
buffer_load_short_d16 v161, v160, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v160, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffD+0], v160  // add 4* loop offset
v_add_co_u32 v160, vcc, s[sgprEdgeCheck+1], v160   //
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,2) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v162, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffC+1], v162  // add 4* loop offset
v_add_co_u32 v162, vcc, s[sgprEdgeCheck], v162     //
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDC clip if OOB. offset
buffer_load_short_d16 v163, v162, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v162, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffD+1], v162  // add 4* loop offset
v_add_co_u32 v162, vcc, s[sgprEdgeCheck+1], v162   //
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,3) */
_v_add_co_u32 v132, vcc, v128, 32                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v164, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffC+2], v164  // add 4* loop offset
v_add_co_u32 v164, vcc, s[sgprEdgeCheck], v164     //
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDC clip if OOB. offset
buffer_load_short_d16 v165, v164, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v164, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffD+2], v164  // add 4* loop offset
v_add_co_u32 v164, vcc, s[sgprEdgeCheck+1], v164   //
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,4) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v166, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v166, vcc, s[sgprEdgeCheck], v166     //
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDC clip if OOB. offset
buffer_load_short_d16 v167, v166, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v166, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v166, vcc, s[sgprEdgeCheck+1], v166   //
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,5) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v168, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffC+0], v168  // add 4* loop offset
v_add_co_u32 v168, vcc, s[sgprEdgeCheck], v168     //
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDC clip if OOB. offset
buffer_load_short_d16 v169, v168, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v168, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffD+0], v168  // add 4* loop offset
v_add_co_u32 v168, vcc, s[sgprEdgeCheck+1], v168   //
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,6) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v170, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffC+1], v170  // add 4* loop offset
v_add_co_u32 v170, vcc, s[sgprEdgeCheck], v170     //
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDC clip if OOB. offset
buffer_load_short_d16 v171, v170, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v170, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffD+1], v170  // add 4* loop offset
v_add_co_u32 v170, vcc, s[sgprEdgeCheck+1], v170   //
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,4,1,7) */
_v_add_co_u32 v132, vcc, v128, 48                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v172, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffC+2], v172  // add 4* loop offset
v_add_co_u32 v172, vcc, s[sgprEdgeCheck], v172     //
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDC clip if OOB. offset
buffer_load_short_d16 v173, v172, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v172, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffD+2], v172  // add 4* loop offset
v_add_co_u32 v172, vcc, s[sgprEdgeCheck+1], v172   //
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 1, 3, 4), (0, 1, 3, 5), (0, 1, 3, 6), (0, 1, 3, 7), (0, 0, 4, 0), (0, 0, 4, 1), (0, 0, 4, 2), (0, 0, 4, 3), (0, 0, 4, 4), (0, 0, 4, 5), (0, 0, 4, 6), (0, 0, 4, 7), (0, 1, 4, 0), (0, 1, 4, 1), (0, 1, 4, 2), (0, 1, 4, 3), (0, 1, 4, 4), (0, 1, 4, 5), (0, 1, 4, 6), (0, 1, 4, 7)] */
v_mul_f32 v[vgprValuC+60], s[sgprAlpha], v[vgprValuC+60] // *= alpha
v_mul_f32 v[vgprValuC+61], s[sgprAlpha], v[vgprValuC+61] // *= alpha
v_mul_f32 v[vgprValuC+62], s[sgprAlpha], v[vgprValuC+62] // *= alpha
v_mul_f32 v[vgprValuC+63], s[sgprAlpha], v[vgprValuC+63] // *= alpha
v_mul_f32 v[vgprValuC+64], s[sgprAlpha], v[vgprValuC+64] // *= alpha
v_mul_f32 v[vgprValuC+65], s[sgprAlpha], v[vgprValuC+65] // *= alpha
v_mul_f32 v[vgprValuC+66], s[sgprAlpha], v[vgprValuC+66] // *= alpha
v_mul_f32 v[vgprValuC+67], s[sgprAlpha], v[vgprValuC+67] // *= alpha
v_mul_f32 v[vgprValuC+68], s[sgprAlpha], v[vgprValuC+68] // *= alpha
v_mul_f32 v[vgprValuC+69], s[sgprAlpha], v[vgprValuC+69] // *= alpha
v_mul_f32 v[vgprValuC+70], s[sgprAlpha], v[vgprValuC+70] // *= alpha
v_mul_f32 v[vgprValuC+71], s[sgprAlpha], v[vgprValuC+71] // *= alpha
v_mul_f32 v[vgprValuC+72], s[sgprAlpha], v[vgprValuC+72] // *= alpha
v_mul_f32 v[vgprValuC+73], s[sgprAlpha], v[vgprValuC+73] // *= alpha
v_mul_f32 v[vgprValuC+74], s[sgprAlpha], v[vgprValuC+74] // *= alpha
v_mul_f32 v[vgprValuC+75], s[sgprAlpha], v[vgprValuC+75] // *= alpha
v_mul_f32 v[vgprValuC+76], s[sgprAlpha], v[vgprValuC+76] // *= alpha
v_mul_f32 v[vgprValuC+77], s[sgprAlpha], v[vgprValuC+77] // *= alpha
v_mul_f32 v[vgprValuC+78], s[sgprAlpha], v[vgprValuC+78] // *= alpha
v_mul_f32 v[vgprValuC+79], s[sgprAlpha], v[vgprValuC+79] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue writes */
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+60], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+60                                    // convert C to bf16
buffer_store_short v60, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+61], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+61                                    // convert C to bf16
buffer_store_short v61, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+62], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+62                                    // convert C to bf16
buffer_store_short v62, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+63], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+63                                    // convert C to bf16
buffer_store_short v63, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+64], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+64                                    // convert C to bf16
buffer_store_short v64, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+65], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+65                                    // convert C to bf16
buffer_store_short v65, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+66], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+66                                    // convert C to bf16
buffer_store_short v66, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+67], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+67                                    // convert C to bf16
buffer_store_short v67, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+68], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+68                                    // convert C to bf16
buffer_store_short v68, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+69], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+69                                    // convert C to bf16
buffer_store_short v69, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+70], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+70                                    // convert C to bf16
buffer_store_short v70, v154, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+71], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+71                                    // convert C to bf16
buffer_store_short v71, v156, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+72], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+72                                    // convert C to bf16
buffer_store_short v72, v158, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+73], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+73                                    // convert C to bf16
buffer_store_short v73, v160, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+74], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+74                                    // convert C to bf16
buffer_store_short v74, v162, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+75], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+75                                    // convert C to bf16
buffer_store_short v75, v164, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+76], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+76                                    // convert C to bf16
buffer_store_short v76, v166, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+77], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+77                                    // convert C to bf16
buffer_store_short v77, v168, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+78], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+78                                    // convert C to bf16
buffer_store_short v78, v170, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+79], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+79                                    // convert C to bf16
buffer_store_short v79, v172, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #4 (d1,d0,vc1,vc0) = */
/*    (0,0,5,0:vw1); (0,0,5,1:vw1); (0,0,5,2:vw1); (0,0,5,3:vw1); (0,0,5,4:vw1); (0,0,5,5:vw1); (0,0,5,6:vw1); (0,0,5,7:vw1); (0,1,5,0:vw1); (0,1,5,1:vw1); (0,1,5,2:vw1); (0,1,5,3:vw1); (0,1,5,4:vw1); (0,1,5,5:vw1); (0,1,5,6:vw1); (0,1,5,7:vw1); (0,0,6,0:vw1); (0,0,6,1:vw1); (0,0,6,2:vw1); (0,0,6,3:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,5,0,0) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck], v134     //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDC clip if OOB. offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck+1], v134   //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,1) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v136, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffC+0], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck], v136     //
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDC clip if OOB. offset
buffer_load_short_d16 v137, v136, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+0], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck+1], v136   //
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,2) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v138, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffC+1], v138  // add 4* loop offset
v_add_co_u32 v138, vcc, s[sgprEdgeCheck], v138     //
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDC clip if OOB. offset
buffer_load_short_d16 v139, v138, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffD+1], v138  // add 4* loop offset
v_add_co_u32 v138, vcc, s[sgprEdgeCheck+1], v138   //
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,3) */
_v_add_co_u32 v132, vcc, v128, 64                  // coord0.1: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v140, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffC+2], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck], v140     //
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDC clip if OOB. offset
buffer_load_short_d16 v141, v140, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+2], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck+1], v140   //
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,4) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v142, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck], v142     //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDC clip if OOB. offset
buffer_load_short_d16 v143, v142, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck+1], v142   //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,5) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v144, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffC+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck], v144     //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDC clip if OOB. offset
buffer_load_short_d16 v145, v144, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck+1], v144   //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,6) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v146, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffC+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck], v146     //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDC clip if OOB. offset
buffer_load_short_d16 v147, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffD+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck+1], v146   //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,0,7) */
s_mov_b32 s54, 80                                  // coordOffset0 d0=0 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v148, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffC+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck], v148     //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDC clip if OOB. offset
buffer_load_short_d16 v149, v148, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck+1], v148   //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,0) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v150, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck], v150     //
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDC clip if OOB. offset
buffer_load_short_d16 v151, v150, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck+1], v150   //
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,1) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=1
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v152, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffC+0], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck], v152     //
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDC clip if OOB. offset
buffer_load_short_d16 v153, v152, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+0], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck+1], v152   //
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,2) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=2
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v154, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffC+1], v154  // add 4* loop offset
v_add_co_u32 v154, vcc, s[sgprEdgeCheck], v154     //
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDC clip if OOB. offset
buffer_load_short_d16 v155, v154, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v154, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffD+1], v154  // add 4* loop offset
v_add_co_u32 v154, vcc, s[sgprEdgeCheck+1], v154   //
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,3) */
s_mov_b32 s54, 96                                  // coordOffset0 d0=1 vc0=3
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v156, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffC+2], v156  // add 4* loop offset
v_add_co_u32 v156, vcc, s[sgprEdgeCheck], v156     //
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDC clip if OOB. offset
buffer_load_short_d16 v157, v156, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v156, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffD+2], v156  // add 4* loop offset
v_add_co_u32 v156, vcc, s[sgprEdgeCheck+1], v156   //
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,4) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v158, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v158, vcc, s[sgprEdgeCheck], v158     //
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDC clip if OOB. offset
buffer_load_short_d16 v159, v158, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v158, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v158, vcc, s[sgprEdgeCheck+1], v158   //
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,5) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=5
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v160, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffC+0], v160  // add 4* loop offset
v_add_co_u32 v160, vcc, s[sgprEdgeCheck], v160     //
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDC clip if OOB. offset
buffer_load_short_d16 v161, v160, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v160, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffD+0], v160  // add 4* loop offset
v_add_co_u32 v160, vcc, s[sgprEdgeCheck+1], v160   //
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,6) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=6
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v162, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffC+1], v162  // add 4* loop offset
v_add_co_u32 v162, vcc, s[sgprEdgeCheck], v162     //
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDC clip if OOB. offset
buffer_load_short_d16 v163, v162, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v162, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffD+1], v162  // add 4* loop offset
v_add_co_u32 v162, vcc, s[sgprEdgeCheck+1], v162   //
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,5,1,7) */
s_mov_b32 s54, 112                                 // coordOffset0 d0=1 vc0=7
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v164, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffC+2], v164  // add 4* loop offset
v_add_co_u32 v164, vcc, s[sgprEdgeCheck], v164     //
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDC clip if OOB. offset
buffer_load_short_d16 v165, v164, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v164, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffD+2], v164  // add 4* loop offset
v_add_co_u32 v164, vcc, s[sgprEdgeCheck+1], v164   //
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDD clip if OOB. offset


/* (d1,vc1,d0,vc0)=(0,6,0,0) */
s_mov_b32 s54, 128                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v166, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v166, vcc, s[sgprEdgeCheck], v166     //
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDC clip if OOB. offset
buffer_load_short_d16 v167, v166, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v166, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v166, vcc, s[sgprEdgeCheck+1], v166   //
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v168, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffC+0], v168  // add 4* loop offset
v_add_co_u32 v168, vcc, s[sgprEdgeCheck], v168     //
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDC clip if OOB. offset
buffer_load_short_d16 v169, v168, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v168, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffD+0], v168  // add 4* loop offset
v_add_co_u32 v168, vcc, s[sgprEdgeCheck+1], v168   //
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v170, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffC+1], v170  // add 4* loop offset
v_add_co_u32 v170, vcc, s[sgprEdgeCheck], v170     //
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDC clip if OOB. offset
buffer_load_short_d16 v171, v170, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v170, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffD+1], v170  // add 4* loop offset
v_add_co_u32 v170, vcc, s[sgprEdgeCheck+1], v170   //
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v172, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffC+2], v172  // add 4* loop offset
v_add_co_u32 v172, vcc, s[sgprEdgeCheck], v172     //
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDC clip if OOB. offset
buffer_load_short_d16 v173, v172, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v172, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffD+2], v172  // add 4* loop offset
v_add_co_u32 v172, vcc, s[sgprEdgeCheck+1], v172   //
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 5, 0), (0, 0, 5, 1), (0, 0, 5, 2), (0, 0, 5, 3), (0, 0, 5, 4), (0, 0, 5, 5), (0, 0, 5, 6), (0, 0, 5, 7), (0, 1, 5, 0), (0, 1, 5, 1), (0, 1, 5, 2), (0, 1, 5, 3), (0, 1, 5, 4), (0, 1, 5, 5), (0, 1, 5, 6), (0, 1, 5, 7), (0, 0, 6, 0), (0, 0, 6, 1), (0, 0, 6, 2), (0, 0, 6, 3)] */
v_mul_f32 v[vgprValuC+80], s[sgprAlpha], v[vgprValuC+80] // *= alpha
v_mul_f32 v[vgprValuC+81], s[sgprAlpha], v[vgprValuC+81] // *= alpha
v_mul_f32 v[vgprValuC+82], s[sgprAlpha], v[vgprValuC+82] // *= alpha
v_mul_f32 v[vgprValuC+83], s[sgprAlpha], v[vgprValuC+83] // *= alpha
v_mul_f32 v[vgprValuC+84], s[sgprAlpha], v[vgprValuC+84] // *= alpha
v_mul_f32 v[vgprValuC+85], s[sgprAlpha], v[vgprValuC+85] // *= alpha
v_mul_f32 v[vgprValuC+86], s[sgprAlpha], v[vgprValuC+86] // *= alpha
v_mul_f32 v[vgprValuC+87], s[sgprAlpha], v[vgprValuC+87] // *= alpha
v_mul_f32 v[vgprValuC+88], s[sgprAlpha], v[vgprValuC+88] // *= alpha
v_mul_f32 v[vgprValuC+89], s[sgprAlpha], v[vgprValuC+89] // *= alpha
v_mul_f32 v[vgprValuC+90], s[sgprAlpha], v[vgprValuC+90] // *= alpha
v_mul_f32 v[vgprValuC+91], s[sgprAlpha], v[vgprValuC+91] // *= alpha
v_mul_f32 v[vgprValuC+92], s[sgprAlpha], v[vgprValuC+92] // *= alpha
v_mul_f32 v[vgprValuC+93], s[sgprAlpha], v[vgprValuC+93] // *= alpha
v_mul_f32 v[vgprValuC+94], s[sgprAlpha], v[vgprValuC+94] // *= alpha
v_mul_f32 v[vgprValuC+95], s[sgprAlpha], v[vgprValuC+95] // *= alpha
v_mul_f32 v[vgprValuC+96], s[sgprAlpha], v[vgprValuC+96] // *= alpha
v_mul_f32 v[vgprValuC+97], s[sgprAlpha], v[vgprValuC+97] // *= alpha
v_mul_f32 v[vgprValuC+98], s[sgprAlpha], v[vgprValuC+98] // *= alpha
v_mul_f32 v[vgprValuC+99], s[sgprAlpha], v[vgprValuC+99] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue writes */
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+80], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+80                                    // convert C to bf16
buffer_store_short v80, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+81], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+81                                    // convert C to bf16
buffer_store_short v81, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+82], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+82                                    // convert C to bf16
buffer_store_short v82, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+83], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+83                                    // convert C to bf16
buffer_store_short v83, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+84], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+84                                    // convert C to bf16
buffer_store_short v84, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+85], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+85                                    // convert C to bf16
buffer_store_short v85, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+86], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+86                                    // convert C to bf16
buffer_store_short v86, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+87], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+87                                    // convert C to bf16
buffer_store_short v87, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+88], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+88                                    // convert C to bf16
buffer_store_short v88, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+89], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+89                                    // convert C to bf16
buffer_store_short v89, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+90], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+90                                    // convert C to bf16
buffer_store_short v90, v154, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+91], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+91                                    // convert C to bf16
buffer_store_short v91, v156, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+92], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+92                                    // convert C to bf16
buffer_store_short v92, v158, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+93], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+93                                    // convert C to bf16
buffer_store_short v93, v160, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+94], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+94                                    // convert C to bf16
buffer_store_short v94, v162, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+95], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+95                                    // convert C to bf16
buffer_store_short v95, v164, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+96], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+96                                    // convert C to bf16
buffer_store_short v96, v166, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+97], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+97                                    // convert C to bf16
buffer_store_short v97, v168, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+98], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+98                                    // convert C to bf16
buffer_store_short v98, v170, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+99], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+99                                    // convert C to bf16
buffer_store_short v99, v172, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #5 (d1,d0,vc1,vc0) = */
/*    (0,0,6,4:vw1); (0,0,6,5:vw1); (0,0,6,6:vw1); (0,0,6,7:vw1); (0,1,6,0:vw1); (0,1,6,1:vw1); (0,1,6,2:vw1); (0,1,6,3:vw1); (0,1,6,4:vw1); (0,1,6,5:vw1); (0,1,6,6:vw1); (0,1,6,7:vw1); (0,0,7,0:vw1); (0,0,7,1:vw1); (0,0,7,2:vw1); (0,0,7,3:vw1); (0,0,7,4:vw1); (0,0,7,5:vw1); (0,0,7,6:vw1); (0,0,7,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,6,0,4) */
s_mov_b32 s54, 144                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck], v134     //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDC clip if OOB. offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck+1], v134   //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v136, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffC+0], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck], v136     //
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDC clip if OOB. offset
buffer_load_short_d16 v137, v136, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+0], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck+1], v136   //
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v138, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffC+1], v138  // add 4* loop offset
v_add_co_u32 v138, vcc, s[sgprEdgeCheck], v138     //
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDC clip if OOB. offset
buffer_load_short_d16 v139, v138, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffD+1], v138  // add 4* loop offset
v_add_co_u32 v138, vcc, s[sgprEdgeCheck+1], v138   //
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,0,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v140, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffC+2], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck], v140     //
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDC clip if OOB. offset
buffer_load_short_d16 v141, v140, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+2], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck+1], v140   //
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,0) */
s_mov_b32 s54, 160                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v142, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck], v142     //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDC clip if OOB. offset
buffer_load_short_d16 v143, v142, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck+1], v142   //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v144, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffC+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck], v144     //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDC clip if OOB. offset
buffer_load_short_d16 v145, v144, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck+1], v144   //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v146, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffC+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck], v146     //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDC clip if OOB. offset
buffer_load_short_d16 v147, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffD+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck+1], v146   //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v148, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffC+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck], v148     //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDC clip if OOB. offset
buffer_load_short_d16 v149, v148, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck+1], v148   //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,4) */
s_mov_b32 s54, 176                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[76:77], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[76:77], s[54:55], s[76:77]             // in0 && in1
_v_add_lshl_u32 v150, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck], v150     //
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDC clip if OOB. offset
buffer_load_short_d16 v151, v150, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v150, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v150, vcc, s[sgprEdgeCheck+1], v150   //
v_cndmask_b32 v150, -1, v150, s[76:77]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[78:79], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[78:79], s[54:55], s[78:79]             // in0 && in1
_v_add_lshl_u32 v152, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffC+0], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck], v152     //
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDC clip if OOB. offset
buffer_load_short_d16 v153, v152, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v152, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v152, vcc, s[sgprStrideoffD+0], v152  // add 4* loop offset
v_add_co_u32 v152, vcc, s[sgprEdgeCheck+1], v152   //
v_cndmask_b32 v152, -1, v152, s[78:79]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[80:81], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[80:81], s[54:55], s[80:81]             // in0 && in1
_v_add_lshl_u32 v154, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffC+1], v154  // add 4* loop offset
v_add_co_u32 v154, vcc, s[sgprEdgeCheck], v154     //
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDC clip if OOB. offset
buffer_load_short_d16 v155, v154, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v154, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v154, vcc, s[sgprStrideoffD+1], v154  // add 4* loop offset
v_add_co_u32 v154, vcc, s[sgprEdgeCheck+1], v154   //
v_cndmask_b32 v154, -1, v154, s[80:81]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,6,1,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[82:83], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[82:83], s[54:55], s[82:83]             // in0 && in1
_v_add_lshl_u32 v156, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffC+2], v156  // add 4* loop offset
v_add_co_u32 v156, vcc, s[sgprEdgeCheck], v156     //
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDC clip if OOB. offset
buffer_load_short_d16 v157, v156, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v156, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v156, vcc, s[sgprStrideoffD+2], v156  // add 4* loop offset
v_add_co_u32 v156, vcc, s[sgprEdgeCheck+1], v156   //
v_cndmask_b32 v156, -1, v156, s[82:83]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,0) */
s_mov_b32 s54, 192                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[84:85], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[84:85], s[54:55], s[84:85]             // in0 && in1
_v_add_lshl_u32 v158, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v158, vcc, s[sgprEdgeCheck], v158     //
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDC clip if OOB. offset
buffer_load_short_d16 v159, v158, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v158, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v158, vcc, s[sgprEdgeCheck+1], v158   //
v_cndmask_b32 v158, -1, v158, s[84:85]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[86:87], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[86:87], s[54:55], s[86:87]             // in0 && in1
_v_add_lshl_u32 v160, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffC+0], v160  // add 4* loop offset
v_add_co_u32 v160, vcc, s[sgprEdgeCheck], v160     //
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDC clip if OOB. offset
buffer_load_short_d16 v161, v160, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v160, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v160, vcc, s[sgprStrideoffD+0], v160  // add 4* loop offset
v_add_co_u32 v160, vcc, s[sgprEdgeCheck+1], v160   //
v_cndmask_b32 v160, -1, v160, s[86:87]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[88:89], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[88:89], s[54:55], s[88:89]             // in0 && in1
_v_add_lshl_u32 v162, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffC+1], v162  // add 4* loop offset
v_add_co_u32 v162, vcc, s[sgprEdgeCheck], v162     //
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDC clip if OOB. offset
buffer_load_short_d16 v163, v162, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v162, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v162, vcc, s[sgprStrideoffD+1], v162  // add 4* loop offset
v_add_co_u32 v162, vcc, s[sgprEdgeCheck+1], v162   //
v_cndmask_b32 v162, -1, v162, s[88:89]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[90:91], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[90:91], s[54:55], s[90:91]             // in0 && in1
_v_add_lshl_u32 v164, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffC+2], v164  // add 4* loop offset
v_add_co_u32 v164, vcc, s[sgprEdgeCheck], v164     //
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDC clip if OOB. offset
buffer_load_short_d16 v165, v164, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v164, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v164, vcc, s[sgprStrideoffD+2], v164  // add 4* loop offset
v_add_co_u32 v164, vcc, s[sgprEdgeCheck+1], v164   //
v_cndmask_b32 v164, -1, v164, s[90:91]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,4) */
s_mov_b32 s54, 208                                  // coordOffset0 d0=0 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[92:93], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[92:93], s[54:55], s[92:93]             // in0 && in1
_v_add_lshl_u32 v166, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v166, vcc, s[sgprEdgeCheck], v166     //
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDC clip if OOB. offset
buffer_load_short_d16 v167, v166, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v166, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v166, vcc, s[sgprEdgeCheck+1], v166   //
v_cndmask_b32 v166, -1, v166, s[92:93]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[94:95], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[94:95], s[54:55], s[94:95]             // in0 && in1
_v_add_lshl_u32 v168, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffC+0], v168  // add 4* loop offset
v_add_co_u32 v168, vcc, s[sgprEdgeCheck], v168     //
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDC clip if OOB. offset
buffer_load_short_d16 v169, v168, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v168, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v168, vcc, s[sgprStrideoffD+0], v168  // add 4* loop offset
v_add_co_u32 v168, vcc, s[sgprEdgeCheck+1], v168   //
v_cndmask_b32 v168, -1, v168, s[94:95]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[96:97], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[96:97], s[54:55], s[96:97]             // in0 && in1
_v_add_lshl_u32 v170, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffC+1], v170  // add 4* loop offset
v_add_co_u32 v170, vcc, s[sgprEdgeCheck], v170     //
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDC clip if OOB. offset
buffer_load_short_d16 v171, v170, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v170, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v170, vcc, s[sgprStrideoffD+1], v170  // add 4* loop offset
v_add_co_u32 v170, vcc, s[sgprEdgeCheck+1], v170   //
v_cndmask_b32 v170, -1, v170, s[96:97]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,0,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[98:99], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[98:99], s[54:55], s[98:99]             // in0 && in1
_v_add_lshl_u32 v172, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffC+2], v172  // add 4* loop offset
v_add_co_u32 v172, vcc, s[sgprEdgeCheck], v172     //
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDC clip if OOB. offset
buffer_load_short_d16 v173, v172, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v172, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v172, vcc, s[sgprStrideoffD+2], v172  // add 4* loop offset
v_add_co_u32 v172, vcc, s[sgprEdgeCheck+1], v172   //
v_cndmask_b32 v172, -1, v172, s[98:99]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 0, 6, 4), (0, 0, 6, 5), (0, 0, 6, 6), (0, 0, 6, 7), (0, 1, 6, 0), (0, 1, 6, 1), (0, 1, 6, 2), (0, 1, 6, 3), (0, 1, 6, 4), (0, 1, 6, 5), (0, 1, 6, 6), (0, 1, 6, 7), (0, 0, 7, 0), (0, 0, 7, 1), (0, 0, 7, 2), (0, 0, 7, 3), (0, 0, 7, 4), (0, 0, 7, 5), (0, 0, 7, 6), (0, 0, 7, 7)] */
v_mul_f32 v[vgprValuC+100], s[sgprAlpha], v[vgprValuC+100] // *= alpha
v_mul_f32 v[vgprValuC+101], s[sgprAlpha], v[vgprValuC+101] // *= alpha
v_mul_f32 v[vgprValuC+102], s[sgprAlpha], v[vgprValuC+102] // *= alpha
v_mul_f32 v[vgprValuC+103], s[sgprAlpha], v[vgprValuC+103] // *= alpha
v_mul_f32 v[vgprValuC+104], s[sgprAlpha], v[vgprValuC+104] // *= alpha
v_mul_f32 v[vgprValuC+105], s[sgprAlpha], v[vgprValuC+105] // *= alpha
v_mul_f32 v[vgprValuC+106], s[sgprAlpha], v[vgprValuC+106] // *= alpha
v_mul_f32 v[vgprValuC+107], s[sgprAlpha], v[vgprValuC+107] // *= alpha
v_mul_f32 v[vgprValuC+108], s[sgprAlpha], v[vgprValuC+108] // *= alpha
v_mul_f32 v[vgprValuC+109], s[sgprAlpha], v[vgprValuC+109] // *= alpha
v_mul_f32 v[vgprValuC+110], s[sgprAlpha], v[vgprValuC+110] // *= alpha
v_mul_f32 v[vgprValuC+111], s[sgprAlpha], v[vgprValuC+111] // *= alpha
v_mul_f32 v[vgprValuC+112], s[sgprAlpha], v[vgprValuC+112] // *= alpha
v_mul_f32 v[vgprValuC+113], s[sgprAlpha], v[vgprValuC+113] // *= alpha
v_mul_f32 v[vgprValuC+114], s[sgprAlpha], v[vgprValuC+114] // *= alpha
v_mul_f32 v[vgprValuC+115], s[sgprAlpha], v[vgprValuC+115] // *= alpha
v_mul_f32 v[vgprValuC+116], s[sgprAlpha], v[vgprValuC+116] // *= alpha
v_mul_f32 v[vgprValuC+117], s[sgprAlpha], v[vgprValuC+117] // *= alpha
v_mul_f32 v[vgprValuC+118], s[sgprAlpha], v[vgprValuC+118] // *= alpha
v_mul_f32 v[vgprValuC+119], s[sgprAlpha], v[vgprValuC+119] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue writes */
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+100], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+100                                    // convert C to bf16
buffer_store_short v100, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+101], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+101                                    // convert C to bf16
buffer_store_short v101, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+102], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+102                                    // convert C to bf16
buffer_store_short v102, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+103], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+103                                    // convert C to bf16
buffer_store_short v103, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+104], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+104                                    // convert C to bf16
buffer_store_short v104, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+105], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+105                                    // convert C to bf16
buffer_store_short v105, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+106], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+106                                    // convert C to bf16
buffer_store_short v106, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+107], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+107                                    // convert C to bf16
buffer_store_short v107, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v151                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+108], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+108                                    // convert C to bf16
buffer_store_short v108, v150, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v153                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+109], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+109                                    // convert C to bf16
buffer_store_short v109, v152, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v155                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+110], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+110                                    // convert C to bf16
buffer_store_short v110, v154, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v157                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+111], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+111                                    // convert C to bf16
buffer_store_short v111, v156, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v159                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+112], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+112                                    // convert C to bf16
buffer_store_short v112, v158, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v161                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+113], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+113                                    // convert C to bf16
buffer_store_short v113, v160, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v163                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+114], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+114                                    // convert C to bf16
buffer_store_short v114, v162, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v165                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+115], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+115                                    // convert C to bf16
buffer_store_short v115, v164, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v167                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+116], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+116                                    // convert C to bf16
buffer_store_short v116, v166, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v169                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+117], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+117                                    // convert C to bf16
buffer_store_short v117, v168, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v171                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+118], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+118                                    // convert C to bf16
buffer_store_short v118, v170, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v173                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+119], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+119                                    // convert C to bf16
buffer_store_short v119, v172, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
/* optSingleColVgpr=0 optSharedColVgpr=0 optSharedMask=0 optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #6 (d1,d0,vc1,vc0) = */
/*    (0,1,7,0:vw1); (0,1,7,1:vw1); (0,1,7,2:vw1); (0,1,7,3:vw1); (0,1,7,4:vw1); (0,1,7,5:vw1); (0,1,7,6:vw1); (0,1,7,7:vw1) */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,7,1,0) */
s_mov_b32 s54, 224                                  // coordOffset0 d0=1 vc0=0
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[60:61], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[60:61], s[54:55], s[60:61]             // in0 && in1
_v_add_lshl_u32 v134, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck], v134     //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDC clip if OOB. offset
buffer_load_short_d16 v135, v134, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v134, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v134, vcc, s[sgprEdgeCheck+1], v134   //
v_cndmask_b32 v134, -1, v134, s[60:61]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,1) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[62:63], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[62:63], s[54:55], s[62:63]             // in0 && in1
_v_add_lshl_u32 v136, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffC+0], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck], v136     //
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDC clip if OOB. offset
buffer_load_short_d16 v137, v136, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v136, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v136, vcc, s[sgprStrideoffD+0], v136  // add 4* loop offset
v_add_co_u32 v136, vcc, s[sgprEdgeCheck+1], v136   //
v_cndmask_b32 v136, -1, v136, s[62:63]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,2) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[64:65], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[64:65], s[54:55], s[64:65]             // in0 && in1
_v_add_lshl_u32 v138, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffC+1], v138  // add 4* loop offset
v_add_co_u32 v138, vcc, s[sgprEdgeCheck], v138     //
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDC clip if OOB. offset
buffer_load_short_d16 v139, v138, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v138, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v138, vcc, s[sgprStrideoffD+1], v138  // add 4* loop offset
v_add_co_u32 v138, vcc, s[sgprEdgeCheck+1], v138   //
v_cndmask_b32 v138, -1, v138, s[64:65]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,3) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[66:67], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[66:67], s[54:55], s[66:67]             // in0 && in1
_v_add_lshl_u32 v140, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffC+2], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck], v140     //
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDC clip if OOB. offset
buffer_load_short_d16 v141, v140, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v140, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v140, vcc, s[sgprStrideoffD+2], v140  // add 4* loop offset
v_add_co_u32 v140, vcc, s[sgprEdgeCheck+1], v140   //
v_cndmask_b32 v140, -1, v140, s[66:67]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,4) */
s_mov_b32 s54, 240                                 // coordOffset0 d0=1 vc0=4
_v_add_co_u32 v132, vcc, v128, s54                 // coord0.2: coord0 += d0*sg0*VW + vc0
_v_add_co_u32 v133, vcc, v129, 16                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[68:69], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[68:69], s[54:55], s[68:69]             // in0 && in1
_v_add_lshl_u32 v142, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck], v142     //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDC clip if OOB. offset
buffer_load_short_d16 v143, v142, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v142, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v142, vcc, s[sgprEdgeCheck+1], v142   //
v_cndmask_b32 v142, -1, v142, s[68:69]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,5) */
_v_add_co_u32 v133, vcc, v129, 20                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[70:71], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[70:71], s[54:55], s[70:71]             // in0 && in1
_v_add_lshl_u32 v144, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffC+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck], v144     //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDC clip if OOB. offset
buffer_load_short_d16 v145, v144, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v144, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v144, vcc, s[sgprStrideoffD+0], v144  // add 4* loop offset
v_add_co_u32 v144, vcc, s[sgprEdgeCheck+1], v144   //
v_cndmask_b32 v144, -1, v144, s[70:71]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,6) */
_v_add_co_u32 v133, vcc, v129, 24                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[72:73], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[72:73], s[54:55], s[72:73]             // in0 && in1
_v_add_lshl_u32 v146, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffC+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck], v146     //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDC clip if OOB. offset
buffer_load_short_d16 v147, v146, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v146, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v146, vcc, s[sgprStrideoffD+1], v146  // add 4* loop offset
v_add_co_u32 v146, vcc, s[sgprEdgeCheck+1], v146   //
v_cndmask_b32 v146, -1, v146, s[72:73]             // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,7,1,7) */
_v_add_co_u32 v133, vcc, v129, 28                  // coord1.1: coord1Vgpr += d1*sg1*VW + vc1
v_cmp_lt_u32 s[54:55], v132, s[sgprSizeI]          // coord0 < size0
v_cmp_lt_u32 s[74:75], v133, s[sgprSizeJ]          // coord1 < size1
s_and_b64 s[74:75], s[54:55], s[74:75]             // in0 && in1
_v_add_lshl_u32 v148, v130, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffC+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck], v148     //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDC clip if OOB. offset
buffer_load_short_d16 v149, v148, s[sgprSrdC:sgprSrdC+3], 0, offen, offset:0 // load C for beta calc
_v_add_lshl_u32 v148, v131, v132, 0x1              // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_add_co_u32 v148, vcc, s[sgprStrideoffD+2], v148  // add 4* loop offset
v_add_co_u32 v148, vcc, s[sgprEdgeCheck+1], v148   //
v_cndmask_b32 v148, -1, v148, s[74:75]             // LDD clip if OOB. offset

/* rC *= alpha batchEements=[(0, 1, 7, 0), (0, 1, 7, 1), (0, 1, 7, 2), (0, 1, 7, 3), (0, 1, 7, 4), (0, 1, 7, 5), (0, 1, 7, 6), (0, 1, 7, 7)] */
v_mul_f32 v[vgprValuC+120], s[sgprAlpha], v[vgprValuC+120] // *= alpha
v_mul_f32 v[vgprValuC+121], s[sgprAlpha], v[vgprValuC+121] // *= alpha
v_mul_f32 v[vgprValuC+122], s[sgprAlpha], v[vgprValuC+122] // *= alpha
v_mul_f32 v[vgprValuC+123], s[sgprAlpha], v[vgprValuC+123] // *= alpha
v_mul_f32 v[vgprValuC+124], s[sgprAlpha], v[vgprValuC+124] // *= alpha
v_mul_f32 v[vgprValuC+125], s[sgprAlpha], v[vgprValuC+125] // *= alpha
v_mul_f32 v[vgprValuC+126], s[sgprAlpha], v[vgprValuC+126] // *= alpha
v_mul_f32 v[vgprValuC+127], s[sgprAlpha], v[vgprValuC+127] // *= alpha
s_waitcnt vmcnt(0)                                 // wait C

/* apply mask, calc new C and issue writes */
v_lshlrev_b32 v252, 16, v135                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+120], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+120                                    // convert C to bf16
buffer_store_short v120, v134, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v137                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+121], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+121                                    // convert C to bf16
buffer_store_short v121, v136, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v139                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+122], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+122                                    // convert C to bf16
buffer_store_short v122, v138, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v141                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+123], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+123                                    // convert C to bf16
buffer_store_short v123, v140, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v143                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+124], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+124                                    // convert C to bf16
buffer_store_short v124, v142, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v145                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+125], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+125                                    // convert C to bf16
buffer_store_short v125, v144, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v147                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+126], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+126                                    // convert C to bf16
buffer_store_short v126, v146, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
v_lshlrev_b32 v252, 16, v149                         // convert bf16 to fp32
_v_mac_f32 v[vgprValuC+127], v252, s[sgprBeta]        // finalSum = sum*alpha + C*beta
FP32_TO_BF16 vgprValuC+127                                    // convert C to bf16
buffer_store_short v127, v148, s[sgprSrdD:sgprSrdD+3], 0, offen, offset:0 // store D
s_branch label_GW_End_37                           // jump to end
label_GW_End_37:

label_0039:  /// KernelEnd
s_endpgm                                           // Kernel End
