################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/app_hdmi.c \
../src/iic_utils.c \
../src/platform.c \
../src/vdma_app_davis7z045.c 

OBJS += \
./src/app_hdmi.o \
./src/iic_utils.o \
./src/platform.o \
./src/vdma_app_davis7z045.o 

C_DEPS += \
./src/app_hdmi.d \
./src/iic_utils.d \
./src/platform.d \
./src/vdma_app_davis7z045.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../helloworld_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


