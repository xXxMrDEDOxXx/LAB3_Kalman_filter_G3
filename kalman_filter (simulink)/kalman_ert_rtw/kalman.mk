###########################################################################
## Makefile generated for component 'kalman'. 
## 
## Makefile     : kalman.mk
## Generated on : Fri Apr 24 20:56:31 2026
## Final product: $(RELATIVE_PATH_TO_ANCHOR)/kalman.elf
## Product type : executable
## 
###########################################################################

###########################################################################
## MACROS
###########################################################################

# Macro Descriptions:
# PRODUCT_NAME            Name of the system to build
# MAKEFILE                Name of this makefile
# COMPILER_COMMAND_FILE   Compiler command listing model reference header paths
# CMD_FILE                Command file

PRODUCT_NAME              = kalman
MAKEFILE                  = kalman.mk
MATLAB_ROOT               = D:/MATLAB/R2026a
MATLAB_BIN                = D:/MATLAB/R2026a/bin
MATLAB_ARCH_BIN           = $(MATLAB_BIN)/win64
START_DIR                 = C:/Users/POND/OneDrive/Documents/ALLPRO~1/Control/lab3/KALMAN~1
SOLVER                    = 
SOLVER_OBJ                = 
CLASSIC_INTERFACE         = 0
TGT_FCN_LIB               = ISO_C
MODEL_HAS_DYNAMICALLY_LOADED_SFCNS = 0
RELATIVE_PATH_TO_ANCHOR   = ..
MW_FLOATING_POINT_ABI_ARGS = -mfloat-abi=hard
COMPILER_COMMAND_FILE     = kalman_comp.rsp
CMD_FILE                  = kalman.rsp
C_STANDARD_OPTS           = 
CPP_STANDARD_OPTS         = 

###########################################################################
## TOOLCHAIN SPECIFICATIONS
###########################################################################

# Toolchain Name:          GNU Tools for STM32
# Supported Version(s):    
# ToolchainInfo Version:   2026a
# Specification Revision:  1.0
# 
#-------------------------------------------
# Macros assumed to be defined elsewhere
#-------------------------------------------

# TARGET_LOAD_CMD_ARGS
# TARGET_LOAD_CMD
# MW_GNU_ARM_STM32_PATH
# FDATASECTIONS_FLG

#-----------
# MACROS
#-----------

LIBGCC                    = ${shell $(MW_GNU_ARM_STM32_PATH)/arm-none-eabi-gcc ${CFLAGS} -print-libgcc-file-name}
LIBC                      = ${shell $(MW_GNU_ARM_STM32_PATH)/arm-none-eabi-gcc ${CFLAGS} -print-file-name=libc.a}
LIBM                      = ${shell $(MW_GNU_ARM_STM32_PATH)/arm-none-eabi-gcc ${CFLAGS} -print-file-name=libm.a}
PRODUCT_NAME_WITHOUT_EXTN = $(basename $(PRODUCT))
PRODUCT_BIN               = $(PRODUCT_NAME_WITHOUT_EXTN).bin
PRODUCT_HEX               = $(PRODUCT_NAME_WITHOUT_EXTN).hex
CPFLAGS                   = -O binary
SHELL                     = %SystemRoot%/system32/cmd.exe

TOOLCHAIN_SRCS = 
TOOLCHAIN_INCS = 
TOOLCHAIN_LIBS = -lm

FORMAT_FOR_ECHO_CMD              = $(strip $(subst >,^>,\
	$(subst <,^<,\
	$(subst |,^|,\
	$(subst &,^&,\
	$(subst ",^",\
	$(subst ^,^^,\
	$1)))))))
FORMAT_FOR_ECHO                  = $(FORMAT_FOR_ECHO_CMD)
HASH                             = \#
SEMICOLON                        = ;
UNESCAPE_SEMICOLONS              = $(subst \;,;,$1)
ADD_QUOTES                       = $(foreach aPath,$1,"$(aPath)")

#------------------------
# BUILD TOOL COMMANDS
#------------------------

# Assembler: GNU ARM Assembler
AS_PATH = $(MW_GNU_ARM_STM32_PATH)
AS = "$(AS_PATH)/arm-none-eabi-gcc"

# C Compiler: GNU ARM C Compiler
CC_PATH = $(MW_GNU_ARM_STM32_PATH)
CC = "$(CC_PATH)/arm-none-eabi-gcc"

# Linker: GNU ARM Linker
LD_PATH = $(MW_GNU_ARM_STM32_PATH)
LD = "$(LD_PATH)/arm-none-eabi-g++"

# C++ Compiler: GNU ARM C++ Compiler
CPP_PATH = $(MW_GNU_ARM_STM32_PATH)
CPP = "$(CPP_PATH)/arm-none-eabi-g++"

# C++ Linker: GNU ARM C++ Linker
CPP_LD_PATH = $(MW_GNU_ARM_STM32_PATH)
CPP_LD = "$(CPP_LD_PATH)/arm-none-eabi-g++"

# Archiver: GNU ARM Archiver
AR_PATH = $(MW_GNU_ARM_STM32_PATH)
AR = "$(AR_PATH)/arm-none-eabi-ar"

# MEX Tool: MEX Tool
MEX_PATH = $(MATLAB_ARCH_BIN)
MEX = "$(MEX_PATH)/mex"

# Binary Converter: Binary Converter
OBJCOPYPATH = $(MW_GNU_ARM_STM32_PATH)
OBJCOPY = "$(OBJCOPYPATH)/arm-none-eabi-objcopy"

# Hex Converter: Hex Converter
OBJCOPYPATH = $(MW_GNU_ARM_STM32_PATH)
OBJCOPY = "$(OBJCOPYPATH)/arm-none-eabi-objcopy"

# Download: Download
DOWNLOAD =

# Execute: Execute
EXECUTE = $(PRODUCT)

# Builder: GMAKE Utility
MAKE_PATH = %MATLAB%\bin\win64
MAKE = "$(MAKE_PATH)/gmake"


#-------------------------
# Directives/Utilities
#-------------------------

ASDEBUG             = -g
AS_OUTPUT_FLAG      = -o
CDEBUG              = -g
C_OUTPUT_FLAG       = -o
LDDEBUG             = -g
OUTPUT_FLAG         = -o
CPPDEBUG            = -g
CPP_OUTPUT_FLAG     = -o
CPPLDDEBUG          = -g
OUTPUT_FLAG         = -o
ARDEBUG             =
STATICLIB_OUTPUT_FLAG =
MEX_DEBUG           = -g
RM                  = @del /f/q
ECHO                = @echo
MV                  = @move
RUN                 =

#----------------------------------------
# "Faster Builds" Build Configuration
#----------------------------------------

MEX_CPPFLAGS         =
MEX_CPPLDFLAGS       =
MEX_CFLAGS           =
MEX_LDFLAGS          =



#---------------------------
# Model-Specific Options
#---------------------------

ASFLAGS = -MMD -MP -MF"$(@:%.s.o=%.s.dep)" -MT"$@"  -Wall -x assembler-with-cpp $(ASFLAGS_ADDITIONAL) $(DEFINES) $(INCLUDES) -c

CFLAGS = $(FDATASECTIONS_FLG) -Wall -c -MMD -MP -MF"$(@:%.c.o=%.c.dep)" -MT"$@"  -O0 -g

LDFLAGS = -Wl,--gc-sections -Wl,-Map="$(PRODUCT_NAME).map" -Wl,--print-memory-usage -g

SHAREDLIB_LDFLAGS = -g

CPPFLAGS = -std=gnu++14 -fno-rtti -fno-exceptions $(FDATASECTIONS_FLG) -Wall -c -MMD -MP -MF"$(@:%.cpp.o=%.cpp.dep)" -MT"$@"  -O0 -g

CPP_LDFLAGS = -Wl,--gc-sections -Wl,-Map="$(PRODUCT_NAME).map" -Wl,--print-memory-usage -g

CPP_SHAREDLIB_LDFLAGS = -g

ARFLAGS = ruvs

OBJCOPYFLAGS_BIN = -O binary $(PRODUCT) $(PRODUCT_BIN)

OBJCOPYFLAGS_HEX = -O ihex $(PRODUCT) $(PRODUCT_HEX)

DOWNLOAD_FLAGS = 

EXECUTE_FLAGS = 

MAKE_FLAGS = -f $(MAKEFILE)

###########################################################################
## OUTPUT INFO
###########################################################################

PRODUCT = $(RELATIVE_PATH_TO_ANCHOR)/kalman.elf
PRODUCT_TYPE = "executable"
BUILD_TYPE = "Top-Level Standalone Executable"

###########################################################################
## INCLUDE PATHS
###########################################################################

INCLUDES_BUILDINFO = 

INCLUDES = $(INCLUDES_BUILDINFO)

###########################################################################
## DEFINES
###########################################################################

DEFINES_ = -DMW_TIM2_CAPTURE_VAR=mw_tim2 -DXCP_ADDRESS_GRANULARITY=XCP_ADDRESS_GRANULARITY_BYTE -D__MW_TARGET_USE_HARDWARE_RESOURCES_H__ -DMW_TIMEBASESOURCE=TIM1 -DMW_CONNECTIVITY_UART=LPUART1_BASE -DMW_CONNECTIVITY_RX_DMA=DMA1 -DMW_LPUART1_RX_DMA_STREAM=1 -DMW_LPUART1_RX_DMA_ENABLED=DMA1_Channel1_IRQHandler -DMW_CONNECTIVITY_RX_DMAStream=LL_DMA_CHANNEL_1 -DMW_CONNECTIVITY_RX_BUFFER=GET_LPUART1_RECEIVE_BUFFER -DMW_LPUART1_RECEIVE_BUFFER_SIZE=1024 -DMW_LPUART1_ENABLED=1 -D__FPU_USED=1U
DEFINES_BUILD_ARGS = -DCLASSIC_INTERFACE=0 -DALLOCATIONFCN=0 -DTERMFCN=1 -DONESTEPFCN=1 -DMAT_FILE=0 -DMULTI_INSTANCE_CODE=0 -DEXT_MODE=1 -DINTEGER_CODE=0 -DMT=0
DEFINES_CUBEMXDEFINES = -DSTM32G474xx -DUSE_FULL_LL_DRIVER -DUSE_HAL_DRIVER
DEFINES_CUSTOM = 
DEFINES_OPTS = -DXCP_EXTMODE_SIMULATION_TIME_IN_TICKS -DXCP_MEM_BLOCK_1_SIZE=32 -DXCP_MEM_BLOCK_1_NUMBER=1 -DXCP_MEM_BLOCK_2_SIZE=56 -DXCP_MEM_BLOCK_2_NUMBER=1 -DXCP_MEM_BLOCK_3_SIZE=24 -DXCP_MEM_BLOCK_3_NUMBER=1 -DXCP_MEM_RESERVED_POOLS_TOTAL_SIZE=735 -DXCP_MEM_RESERVED_POOLS_NUMBER=2 -DXCP_MEM_DAQ_RESERVED_POOL_BLOCKS_NUMBER=3 -DXCP_MEM_DAQ_RESERVED_POOLS_NUMBER=1 -DXCP_MIN_EVENT_NO_RESERVED_POOL=1 -DXCP_MAX_CTO_SIZE=255 -DXCP_MAX_DTO_SIZE=65532 -DXCP_MAX_ODT_ENTRY_SIZE=255 -DEXTMODE_XCP_TRIGGER_SUPPORT -DON_TARGET_WAIT_FOR_START=1 -DXCP_DAQ_SUPPORT -DXCP_CALIBRATION_SUPPORT -DXCP_TIMESTAMP_SUPPORT -DXCP_SET_MTA_SUPPORT -DTID01EQ=0
DEFINES_SKIPFORSIL = -DXCP_CUSTOM_PLATFORM -D__FPU_PRESENT=1U -DEXTMODE_DISABLE_ARGS_PROCESSING -DSTACK_SIZE=512 -DRT
DEFINES_STANDARD = -DMODEL=kalman -DNUMST=1 -DNCSTATES=0 -DHAVESTDIO -DMODEL_HAS_DYNAMICALLY_LOADED_SFCNS=0
DEFINES_STM32DEVICEDRIVERBLOCKS = -DIO_AUTOGEN_ANALOG_TO_DIGITAL_CONVERTER=0 -DIO_AUTOGEN_DIGITAL_PORT=0 -DIO_AUTOGEN_I2C=0 -DIO_AUTOGEN_REGISTER_RW=0 -DMW_TIM2_ENABLED=1

DEFINES = $(DEFINES_) $(DEFINES_BUILD_ARGS) $(DEFINES_CUBEMXDEFINES) $(DEFINES_CUSTOM) $(DEFINES_OPTS) $(DEFINES_SKIPFORSIL) $(DEFINES_STANDARD) $(DEFINES_STM32DEVICEDRIVERBLOCKS)

###########################################################################
## SOURCE FILES
###########################################################################

SRCS = $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_mode.c $(START_DIR)/kalman_ert_rtw/kalman.c $(START_DIR)/hc_sr04.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_common.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_classic_trigger.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_param_default_serial.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp_standard.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp_daq.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp_calibration.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/xcp_fifo.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/xcp_transport.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/xcp_mem_default.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/xcp_drv_rtiostream.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/xcp_utils.c $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/xcp_frame_serial.c $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/overrideHALDelay.c $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/platform_timer.c $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/rtiostream_serial.c $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/stm_usart.c $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/stm_lpuart.c $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/sys_arch_arm.c $(MATLAB_ROOT)/toolbox/target/shared/armcortexmbase/scheduler/src/SysTickScheduler.c $(MATLAB_ROOT)/toolbox/target/shared/armcortexmbase/scheduler/src/m3m4m4f_multitasking.c $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/stm_timer_ll.c $(START_DIR)/Core/Src/main.c $(START_DIR)/Core/Src/stm32g4xx_hal_msp.c $(START_DIR)/Core/Src/stm32g4xx_hal_timebase_tim.c $(START_DIR)/Core/Src/stm32g4xx_it.c $(START_DIR)/Core/Src/system_stm32g4xx.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_cortex.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_dma.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_dma_ex.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_exti.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_flash.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_flash_ex.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_flash_ramfunc.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_gpio.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_pwr.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_pwr_ex.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_rcc.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_rcc_ex.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_tim.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_tim_ex.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_dma.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_exti.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_gpio.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_lpuart.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_pwr.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_rcc.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_tim.c $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_utils.c $(START_DIR)/STM32CubeIDE/Application/User/Core/syscalls.c $(START_DIR)/STM32CubeIDE/Application/User/Core/sysmem.c $(START_DIR)/STM32CubeIDE/Application/User/Startup/startup_stm32g474retx.s

MAIN_SRC = $(START_DIR)/kalman_ert_rtw/ert_main.c

ALL_SRCS = $(SRCS) $(MAIN_SRC)

###########################################################################
## OBJECTS
###########################################################################

OBJS = xcp_ext_mode.c.o kalman.c.o hc_sr04.c.o xcp_ext_common.c.o xcp_ext_classic_trigger.c.o xcp_ext_param_default_serial.c.o xcp.c.o xcp_standard.c.o xcp_daq.c.o xcp_calibration.c.o xcp_fifo.c.o xcp_transport.c.o xcp_mem_default.c.o xcp_drv_rtiostream.c.o xcp_utils.c.o xcp_frame_serial.c.o overrideHALDelay.c.o platform_timer.c.o rtiostream_serial.c.o stm_usart.c.o stm_lpuart.c.o sys_arch_arm.c.o SysTickScheduler.c.o m3m4m4f_multitasking.c.o stm_timer_ll.c.o main.c.o stm32g4xx_hal_msp.c.o stm32g4xx_hal_timebase_tim.c.o stm32g4xx_it.c.o system_stm32g4xx.c.o stm32g4xx_hal.c.o stm32g4xx_hal_cortex.c.o stm32g4xx_hal_dma.c.o stm32g4xx_hal_dma_ex.c.o stm32g4xx_hal_exti.c.o stm32g4xx_hal_flash.c.o stm32g4xx_hal_flash_ex.c.o stm32g4xx_hal_flash_ramfunc.c.o stm32g4xx_hal_gpio.c.o stm32g4xx_hal_pwr.c.o stm32g4xx_hal_pwr_ex.c.o stm32g4xx_hal_rcc.c.o stm32g4xx_hal_rcc_ex.c.o stm32g4xx_hal_tim.c.o stm32g4xx_hal_tim_ex.c.o stm32g4xx_ll_dma.c.o stm32g4xx_ll_exti.c.o stm32g4xx_ll_gpio.c.o stm32g4xx_ll_lpuart.c.o stm32g4xx_ll_pwr.c.o stm32g4xx_ll_rcc.c.o stm32g4xx_ll_tim.c.o stm32g4xx_ll_utils.c.o syscalls.c.o sysmem.c.o startup_stm32g474retx.s.o

MAIN_OBJ = ert_main.c.o

ALL_OBJS = $(OBJS) $(MAIN_OBJ)

###########################################################################
## PREBUILT OBJECT FILES
###########################################################################

PREBUILT_OBJS = 

###########################################################################
## LIBRARIES
###########################################################################

LIBS = $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/lib/GCC/libmw_pdmfilter_m4_spfp.lib

###########################################################################
## SYSTEM LIBRARIES
###########################################################################

SYSTEM_LIBS = 

###########################################################################
## ADDITIONAL TOOLCHAIN FLAGS
###########################################################################

#---------------
# C Compiler
#---------------

CFLAGS_SKIPFORSIL = -mcpu=cortex-m4 -mthumb -mlittle-endian -mthumb-interwork -mfpu=fpv4-sp-d16  -ffp-contract=off -mfloat-abi=hard
CFLAGS_BASIC = $(DEFINES) $(INCLUDES) @$(COMPILER_COMMAND_FILE)

CFLAGS += $(CFLAGS_SKIPFORSIL) $(CFLAGS_BASIC)

#-----------
# Linker
#-----------

LDFLAGS_SKIPFORSIL = -mcpu=cortex-m4 -mthumb -mlittle-endian -mthumb-interwork -mfpu=fpv4-sp-d16  --entry Reset_Handler --specs=nosys.specs  --specs=nano.specs -mfloat-abi=hard -T "C:\Users\POND\OneDrive\Documents\AllProject\Control\lab3\kalman_filter (simulink)\STM32CubeIDE\STM32G474RETX_FLASH.ld"

LDFLAGS += $(LDFLAGS_SKIPFORSIL)

#--------------------------
# Shared Library Linker
#--------------------------

SHAREDLIB_LDFLAGS_SKIPFORSIL = -mcpu=cortex-m4 -mthumb -mlittle-endian -mthumb-interwork -mfpu=fpv4-sp-d16  --entry Reset_Handler --specs=nosys.specs  --specs=nano.specs -mfloat-abi=hard -T "C:\Users\POND\OneDrive\Documents\AllProject\Control\lab3\kalman_filter (simulink)\STM32CubeIDE\STM32G474RETX_FLASH.ld"

SHAREDLIB_LDFLAGS += $(SHAREDLIB_LDFLAGS_SKIPFORSIL)

#-----------------
# C++ Compiler
#-----------------

CPPFLAGS_SKIPFORSIL = -mcpu=cortex-m4 -mthumb -mlittle-endian -mthumb-interwork -mfpu=fpv4-sp-d16  -ffp-contract=off -mfloat-abi=hard
CPPFLAGS_BASIC = $(DEFINES) $(INCLUDES) @$(COMPILER_COMMAND_FILE)

CPPFLAGS += $(CPPFLAGS_SKIPFORSIL) $(CPPFLAGS_BASIC)

#---------------
# C++ Linker
#---------------

CPP_LDFLAGS_SKIPFORSIL = -mcpu=cortex-m4 -mthumb -mlittle-endian -mthumb-interwork -mfpu=fpv4-sp-d16  --entry Reset_Handler --specs=nosys.specs  --specs=nano.specs -mfloat-abi=hard -T "C:\Users\POND\OneDrive\Documents\AllProject\Control\lab3\kalman_filter (simulink)\STM32CubeIDE\STM32G474RETX_FLASH.ld"

CPP_LDFLAGS += $(CPP_LDFLAGS_SKIPFORSIL)

#------------------------------
# C++ Shared Library Linker
#------------------------------

CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL = -mcpu=cortex-m4 -mthumb -mlittle-endian -mthumb-interwork -mfpu=fpv4-sp-d16  --entry Reset_Handler --specs=nosys.specs  --specs=nano.specs -mfloat-abi=hard -T "C:\Users\POND\OneDrive\Documents\AllProject\Control\lab3\kalman_filter (simulink)\STM32CubeIDE\STM32G474RETX_FLASH.ld"

CPP_SHAREDLIB_LDFLAGS += $(CPP_SHAREDLIB_LDFLAGS_SKIPFORSIL)

###########################################################################
## INLINED COMMANDS
###########################################################################


ALL_DEPS:=$(patsubst %.o,%.dep,$(ALL_OBJS))
all:

ifndef DISABLE_GCC_FUNCTION_DATA_SECTIONS
FDATASECTIONS_FLG := -ffunction-sections -fdata-sections
endif



-include codertarget_assembly_flags.mk
-include ../codertarget_assembly_flags.mk
-include ../../codertarget_assembly_flags.mk
-include mw_gnu_tools_for_stm32_path.mk
-include ../mw_gnu_tools_for_stm32_path.mk
-include ../../mw_gnu_tools_for_stm32_path.mk
-include $(ALL_DEPS)


###########################################################################
## PHONY TARGETS
###########################################################################

.PHONY : all build buildobj clean info prebuild postbuild download execute


all : build postbuild
	@echo $(call FORMAT_FOR_ECHO,### Successfully generated all binary outputs.)


build : prebuild $(PRODUCT)


buildobj : prebuild $(OBJS) $(PREBUILT_OBJS) $(LIBS)
	@echo $(call FORMAT_FOR_ECHO,### Successfully generated all binary outputs.)


prebuild : 


postbuild : $(PRODUCT)
	@echo $(call FORMAT_FOR_ECHO,### Invoking postbuild tool Binary Converter ...)
	$(OBJCOPY) $(OBJCOPYFLAGS_BIN)
	@echo $(call FORMAT_FOR_ECHO,### Done invoking postbuild tool.)
	@echo $(call FORMAT_FOR_ECHO,### Invoking postbuild tool Hex Converter ...)
	$(OBJCOPY) $(OBJCOPYFLAGS_HEX)
	@echo $(call FORMAT_FOR_ECHO,### Done invoking postbuild tool.)


download : postbuild


execute : download
	@echo $(call FORMAT_FOR_ECHO,### Invoking postbuild tool Execute ...)
	$(EXECUTE) $(EXECUTE_FLAGS)
	@echo $(call FORMAT_FOR_ECHO,### Done invoking postbuild tool.)


###########################################################################
## FINAL TARGET
###########################################################################

#-------------------------------------------
# Create a standalone executable            
#-------------------------------------------

$(PRODUCT) : $(OBJS) $(PREBUILT_OBJS) $(LIBS) $(MAIN_OBJ)
	@echo $(call FORMAT_FOR_ECHO,### Creating standalone executable "$(PRODUCT)" ...)
	$(LD) $(LDFLAGS) -o $(PRODUCT) @$(CMD_FILE) $(LIBS) $(SYSTEM_LIBS) $(TOOLCHAIN_LIBS)
	@echo $(call FORMAT_FOR_ECHO,### Created: "$(PRODUCT)")


###########################################################################
## INTERMEDIATE TARGETS
###########################################################################

#---------------------
# SOURCE-TO-OBJECT
#---------------------

%.c.o : %.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : %.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : %.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : %.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : %.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : %.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : %.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(RELATIVE_PATH_TO_ANCHOR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(RELATIVE_PATH_TO_ANCHOR)/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(RELATIVE_PATH_TO_ANCHOR)/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(RELATIVE_PATH_TO_ANCHOR)/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(RELATIVE_PATH_TO_ANCHOR)/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(START_DIR)/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(START_DIR)/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(START_DIR)/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(START_DIR)/kalman_ert_rtw/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/kalman_ert_rtw/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/kalman_ert_rtw/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/kalman_ert_rtw/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(START_DIR)/kalman_ert_rtw/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(START_DIR)/kalman_ert_rtw/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(START_DIR)/kalman_ert_rtw/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/rtw/c/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/rtw/c/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/rtw/c/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/rtw/c/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/rtw/c/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/rtw/c/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/rtw/c/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/simulink/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/simulink/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/simulink/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/simulink/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/simulink/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/simulink/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/simulink/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/simulink/blocks/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/%.c
	$(CC) $(CFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/%.cpp
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/%.cc
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/%.C
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.cpp.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/%.cxx
	$(CPP) $(CPPFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/%.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


%.s.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/%.S
	$(AS) $(ASFLAGS) -o "$@" "$<"


xcp_ext_mode.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_mode.c
	$(CC) $(CFLAGS) -o "$@" "$<"


ert_main.c.o : $(START_DIR)/kalman_ert_rtw/ert_main.c
	$(CC) $(CFLAGS) -o "$@" "$<"


kalman.c.o : $(START_DIR)/kalman_ert_rtw/kalman.c
	$(CC) $(CFLAGS) -o "$@" "$<"


hc_sr04.c.o : $(START_DIR)/hc_sr04.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_ext_common.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_common.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_ext_classic_trigger.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_classic_trigger.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_ext_param_default_serial.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/ext_mode/src/xcp_ext_param_default_serial.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_standard.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp_standard.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_daq.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp_daq.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_calibration.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/protocol/src/xcp_calibration.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_fifo.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/xcp_fifo.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_transport.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/xcp_transport.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_mem_default.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/xcp_mem_default.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_drv_rtiostream.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/platform/default/xcp_drv_rtiostream.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_utils.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/common/xcp_utils.c
	$(CC) $(CFLAGS) -o "$@" "$<"


xcp_frame_serial.c.o : $(MATLAB_ROOT)/toolbox/coder/xcp/src/target/server/transport/src/xcp_frame_serial.c
	$(CC) $(CFLAGS) -o "$@" "$<"


overrideHALDelay.c.o : $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/overrideHALDelay.c
	$(CC) $(CFLAGS) -o "$@" "$<"


platform_timer.c.o : $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/platform_timer.c
	$(CC) $(CFLAGS) -o "$@" "$<"


rtiostream_serial.c.o : $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/rtiostream_serial.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm_usart.c.o : $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/stm_usart.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm_lpuart.c.o : $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/stm_lpuart.c
	$(CC) $(CFLAGS) -o "$@" "$<"


sys_arch_arm.c.o : $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/sys_arch_arm.c
	$(CC) $(CFLAGS) -o "$@" "$<"


SysTickScheduler.c.o : $(MATLAB_ROOT)/toolbox/target/shared/armcortexmbase/scheduler/src/SysTickScheduler.c
	$(CC) $(CFLAGS) -o "$@" "$<"


m3m4m4f_multitasking.c.o : $(MATLAB_ROOT)/toolbox/target/shared/armcortexmbase/scheduler/src/m3m4m4f_multitasking.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm_timer_ll.c.o : $(MATLAB_ROOT)/toolbox/stm32b/stm32shared/src/stm_timer_ll.c
	$(CC) $(CFLAGS) -o "$@" "$<"


main.c.o : $(START_DIR)/Core/Src/main.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_msp.c.o : $(START_DIR)/Core/Src/stm32g4xx_hal_msp.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_timebase_tim.c.o : $(START_DIR)/Core/Src/stm32g4xx_hal_timebase_tim.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_it.c.o : $(START_DIR)/Core/Src/stm32g4xx_it.c
	$(CC) $(CFLAGS) -o "$@" "$<"


system_stm32g4xx.c.o : $(START_DIR)/Core/Src/system_stm32g4xx.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_cortex.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_cortex.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_dma.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_dma.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_dma_ex.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_dma_ex.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_exti.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_exti.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_flash.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_flash.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_flash_ex.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_flash_ex.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_flash_ramfunc.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_flash_ramfunc.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_gpio.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_gpio.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_pwr.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_pwr.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_pwr_ex.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_pwr_ex.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_rcc.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_rcc.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_rcc_ex.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_rcc_ex.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_tim.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_tim.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_hal_tim_ex.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_hal_tim_ex.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_dma.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_dma.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_exti.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_exti.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_gpio.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_gpio.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_lpuart.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_lpuart.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_pwr.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_pwr.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_rcc.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_rcc.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_tim.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_tim.c
	$(CC) $(CFLAGS) -o "$@" "$<"


stm32g4xx_ll_utils.c.o : $(START_DIR)/Drivers/STM32G4xx_HAL_Driver/Src/stm32g4xx_ll_utils.c
	$(CC) $(CFLAGS) -o "$@" "$<"


syscalls.c.o : $(START_DIR)/STM32CubeIDE/Application/User/Core/syscalls.c
	$(CC) $(CFLAGS) -o "$@" "$<"


sysmem.c.o : $(START_DIR)/STM32CubeIDE/Application/User/Core/sysmem.c
	$(CC) $(CFLAGS) -o "$@" "$<"


startup_stm32g474retx.s.o : $(START_DIR)/STM32CubeIDE/Application/User/Startup/startup_stm32g474retx.s
	$(AS) $(ASFLAGS) -o "$@" "$<"


###########################################################################
## DEPENDENCIES
###########################################################################

$(ALL_OBJS) : rtw_proj.tmw $(COMPILER_COMMAND_FILE) $(MAKEFILE)


###########################################################################
## MISCELLANEOUS TARGETS
###########################################################################

info : 
	@echo $(call FORMAT_FOR_ECHO,### PRODUCT = $(PRODUCT))
	@echo $(call FORMAT_FOR_ECHO,### PRODUCT_TYPE = $(PRODUCT_TYPE))
	@echo $(call FORMAT_FOR_ECHO,### BUILD_TYPE = $(BUILD_TYPE))
	@echo $(call FORMAT_FOR_ECHO,### INCLUDES = $(INCLUDES))
	@echo $(call FORMAT_FOR_ECHO,### DEFINES = $(DEFINES))
	@echo $(call FORMAT_FOR_ECHO,### ALL_SRCS = $(ALL_SRCS))
	@echo $(call FORMAT_FOR_ECHO,### ALL_OBJS = $(ALL_OBJS))
	@echo $(call FORMAT_FOR_ECHO,### LIBS = $(LIBS))
	@echo $(call FORMAT_FOR_ECHO,### MODELREF_LIBS = $(MODELREF_LIBS))
	@echo $(call FORMAT_FOR_ECHO,### SYSTEM_LIBS = $(SYSTEM_LIBS))
	@echo $(call FORMAT_FOR_ECHO,### TOOLCHAIN_LIBS = $(TOOLCHAIN_LIBS))
	@echo $(call FORMAT_FOR_ECHO,### ASFLAGS = $(ASFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### CFLAGS = $(CFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### LDFLAGS = $(LDFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### SHAREDLIB_LDFLAGS = $(SHAREDLIB_LDFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### CPPFLAGS = $(CPPFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### CPP_LDFLAGS = $(CPP_LDFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### CPP_SHAREDLIB_LDFLAGS = $(CPP_SHAREDLIB_LDFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### ARFLAGS = $(ARFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### MEX_CFLAGS = $(MEX_CFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### MEX_CPPFLAGS = $(MEX_CPPFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### MEX_LDFLAGS = $(MEX_LDFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### MEX_CPPLDFLAGS = $(MEX_CPPLDFLAGS))
	@echo $(call FORMAT_FOR_ECHO,### OBJCOPYFLAGS_BIN = $(OBJCOPYFLAGS_BIN))
	@echo $(call FORMAT_FOR_ECHO,### OBJCOPYFLAGS_HEX = $(OBJCOPYFLAGS_HEX))
	@echo $(call FORMAT_FOR_ECHO,### DOWNLOAD_FLAGS = $(DOWNLOAD_FLAGS))
	@echo $(call FORMAT_FOR_ECHO,### EXECUTE_FLAGS = $(EXECUTE_FLAGS))
	@echo $(call FORMAT_FOR_ECHO,### MAKE_FLAGS = $(MAKE_FLAGS))


clean : 
	$(ECHO) "### Deleting all derived files ..."
	$(RM) $(subst /,\,$(PRODUCT))
	$(RM) $(subst /,\,$(ALL_OBJS))
	$(RM) *.c.dep
	$(RM) *.cpp.dep
	$(RM) *.s.dep
	$(ECHO) "### Deleted all derived files."


