#!/usr/bin/env bash

#fixes for avium android 16 qpr2 
#it fixes audio_bp(idk qbhi told me to do it), rm -rf some paths, framework_matrix(it doesn't have somethings)

echo "[fix] applying..."
		
	AUDIO_BP="hardware/interfaces/audio/common/all-versions/default/Android.bp"
	AUDIO_BP_URL="https://raw.githubusercontent.com/kitsunee02/rom-patches/main/Android.bp"
	if [ -f "$AUDIO_BP" ]; then
	    curl -sSfL -o "$AUDIO_BP" "$AUDIO_BP_URL" || {
			 echo "ERROR: Failed to download audio Android.bp"
			 exit 1
		}
	fi

    REMOVE_PATHS=(
        "hardware/qcom-caf/sm8480"
        "hardware/lineage/interfaces/sensors"
        "hardware/lineage/interfaces/biometrics/fingerprint"
        "hardware/interfaces/biometrics/fingerprint/2.1/default"
    )

    for REMOVE_PATH in "${REMOVE_PATHS[@]}"; do
        if [ -d "$REMOVE_PATH" ]; then
            echo "Removing: $REMOVE_PATH"
            rm -rf -- "$REMOVE_PATH" || {
                echo "ERROR: Failed to remove $REMOVE_PATH"
                exit 1
            }
        else
            echo "INFO: Directory not present, skipping: $REMOVE_PATH"
        fi
    done

	FRAMEWORK_MATRIX="device/xiaomi/blossom/framework_compatibility_matrix.xml"
    FRAMEWORK_MATRIX_URL="https://raw.githubusercontent.com/kitsunee02/rom-patches/refs/heads/main/luna16/framework_compatibility_matrix.xml"

        if [ -f "$FRAMEWORK_MATRIX" ]; then
           if [ -n "$FRAMEWORK_MATRIX_URL" ]; then
              curl -sSfL -o "$FRAMEWORK_MATRIX" "$FRAMEWORK_MATRIX_URL" || {
              	echo "ERROR: Wen framework, i am feeling lazy"
              	exit 1
              }
           else
               echo "WARNING: "$FRAMEWORK_MATRIX_URL" not found"
           fi
   fi

   BLOSSOM="device/xiaomi/blossom/lineage_blossom.mk"
   BLOSSOM_URL="https://raw.githubusercontent.com/kitsunee02/rom-patches/refs/heads/main/avium16_2/lineage_blossom.mk"
   if [ -f "$BLOSSOM" ]; then
  	    curl -sSfL -o "$BLOSSOM" "$BLOSSOM_URL" || {
   			 echo "ERROR: Failed to replace lineage_blossom.mk"
   			 exit 1
   		}
   	fi
   

echo "[fix] done"

echo "[sign] cloning keys..."

	git clone --depth=1 https://github.com/kitsunee02/android_vendor_lineage-priv_keys vendor/lineage-priv/keys
	cd vendor/lineage-priv/keys
	python3 -m venv venv
	source venv/bin/activate
	pip install pyOpenSSL cryptography
	./gen_keys.py
	deactivate

echo "[sign] done"

echo "miui cam ~~~"
	git clone https://github.com/HaiKito18/vendor_xiaomi_miuicamera.git vendor/xiaomi/miuicamera 
	sed -i '$a $(call inherit-product, vendor/xiaomi/miuicamera/MiuiCamera.mk)' device/xiaomi/blossom/device.mk
	sed -i '$a include vendor/xiaomi/miuicamera/SEPolicy.mk' device/xiaomi/blossom/BoardConfig.mk
echo "done"

