#!/usr/bin/env python3
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

import sys
from pathlib import Path

# Función para obtener el directorio base
def get_device_dir():
    return Path(__file__).parent.resolve()

def main():
    DEVICE = "miuicamera-sapphire"
    VENDOR = "xiaomi"
    
    # Variables de entorno
    DEVICE_DIR = get_device_dir()
    ANDROID_ROOT = DEVICE_DIR.parent.parent.parent
    
    # Añadir el directorio de herramientas al PATH
    tools_path = ANDROID_ROOT / "tools" / "extract-utils"
    if tools_path.exists():
        sys.path.insert(0, str(tools_path))
    
    try:
        from extract_utils import ExtractUtils, ExtractUtilsModule
    except ImportError:
        print("Error: No se pudo importar extract_utils", file=sys.stderr)
        print(f"Asegúrate de que existe: {tools_path}", file=sys.stderr)
        sys.exit(1)
    
    # Crear el objeto de utilidades
    namespace = ExtractUtilsModule(
        device=DEVICE,
        vendor=VENDOR,
        device_dir=str(DEVICE_DIR)
    )
    
    # Crear utilidades
    utils = ExtractUtils(namespace)
    
    # Generar los makefiles
    print(f"Generando makefiles para {DEVICE}...")
    utils.setup_vendor_makefiles()
    
    print("✓ Makefiles generados correctamente")
    print(f"  - vendor/{VENDOR}/{DEVICE}/{DEVICE}-vendor.mk")
    print(f"  - vendor/{VENDOR}/{DEVICE}/BoardConfigVendor.mk")
    print(f"  - vendor/{VENDOR}/{DEVICE}/Android.bp")

if __name__ == "__main__":
    main()
