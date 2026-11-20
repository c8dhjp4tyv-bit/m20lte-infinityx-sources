#!/bin/bash
set -e
cd ~/infinity/device/samsung/m20lte
cat > infinity_m20lte.mk <<'MK'
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/samsung/m20lte/lineage_m20lte.mk)

PRODUCT_NAME := infinity_m20lte
MK
grep -q infinity_m20lte.mk AndroidProducts.mk || sed -i 's#$(LOCAL_DIR)/lineage_m20lte.mk#$(LOCAL_DIR)/lineage_m20lte.mk \\\n    $(LOCAL_DIR)/infinity_m20lte.mk#' AndroidProducts.mk
cat AndroidProducts.mk | tail -3
git add -A && git commit -q -m "m20lte: Infinity X product name (local)"
cd ../universal7904-common
sed -i 's/^ifneq ($(LINEAGE_BUILD),)$/ifneq ($(LINEAGE_BUILD)$(INFINITY_BUILD),)/' BoardConfigCommon.mk
grep -n "INFINITY_BUILD" BoardConfigCommon.mk
git commit -q -am "universal7904: Accept INFINITY_BUILD for Lineage sepolicy (local)"
sed -i 's/lunch lineage_m20lte-user/lunch infinity_m20lte-user/; s/LINEAGE_BUILD=\$LINEAGE_BUILD/INFINITY_BUILD=$INFINITY_BUILD/' ~/build-ix.sh
grep -n lunch ~/build-ix.sh
