#
# BoardConfig para MIUI Camera (Sapphire)
#

# Definir la ruta de este módulo para facilitar el uso de variables
MIUICAMERA_PATH := device/xiaomi/miuicamera-sapphire

# 1. Cargar propiedades del sistema (si el archivo existe)
TARGET_SYSTEM_PROP += $(MIUICAMERA_PATH)/system.prop

# 2. Cargar reglas de seguridad (SEPolicy) - CRÍTICO
# Esto permite que la cámara acceda al hardware sin que Android la bloquee
BOARD_VENDOR_SEPOLICY_DIRS += $(MIUICAMERA_PATH)/sepolicy/vendor

# 3. Permitir binarios modificados (PatchELF)
# Necesario porque modificamos libmicampostproc_client.so
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
