transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RAM.v}
vlog -vlog01compat -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RamV.v}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Pipeline_SIMD.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/vsync_generator.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/VGA_Controller.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/vdisplayareaverificator.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/userSelectionVerificator.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/spritePositionVerificator.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/SpriteCharacter.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/sleep.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/Restador.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/nBitCounter.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/MUX2x1.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/mainController.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/hsync_generator.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/hdisplayareaverificator.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/displayAreaVerificator.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/Comparador.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/ColorDecoder.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VGA/clockDivider.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/mux_4to1.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/mux_2to1.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RegMWV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RegEMV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RegDEV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/ExtendV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/ExecuteV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/DecodeV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Control_UnitV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Condition_UnitV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/BancoRegistrosV.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/ALU_Vec.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/ALU_NBITS.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Sumador_Completo.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Sumador_1bit.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/StopCounter.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RegMW.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RegFD.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RegEM.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/RegDE.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/PCreg.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Mux3.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Mux2.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Memory.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Hazard_Unit.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/flopenr.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Fetch.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Extend.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Execute.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Decode.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Control_Unit.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/Condition_Unit.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/BancoRegistros.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/ALU.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/InstSelector.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/VecGen.sv}
vlog -sv -work work +incdir+D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog {D:/ArquiII/GitVersion/Proyecto_2_Arqui_2_SIMD/SystemVerilog/MemInst.sv}

