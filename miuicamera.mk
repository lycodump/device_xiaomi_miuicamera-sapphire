#
# Copyright (C) 2023 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
# Configuration for Sapphire HyperOS Camera Port
#

# --- 1. Definir ruta local ---
LOCAL_PATH := device/xiaomi/miuicamera-sapphire

# --- 2. Heredar los blobs del Vendor ---
$(call inherit-product, vendor/xiaomi/miuicamera-sapphire/miuicamera-sapphire-vendor.mk)

# --- 3. (SECCIÓN BORRADA - Namespace del shim ya no hace falta) ---

# --- 4. (SECCIÓN BORRADA - El shim viejo se va) ---

# --- 5. Copiar Permisos y Configs ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-miuicamera.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-miuicamera.xml \
    $(LOCAL_PATH)/configs/miuicamera-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/miuicamera-hiddenapi-package-allowlist.xml

# --- 6. Extras (Archivos confirmados) ---
# Librerías públicas necesarias para que la app acceda a libs de Xiaomi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries-xiaomi.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# (NOTA: He cambiado arriba el destino a VENDOR/etc/public.libraries.txt para asegurar que funcione)

# Permisos para ExtraPhoto (Funciones IA/Edición)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-miuiextraphoto.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-miuiextraphoto.xml
