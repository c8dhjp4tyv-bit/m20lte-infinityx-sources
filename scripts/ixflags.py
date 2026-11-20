p = "lineage_m20lte.mk"
s = open(p).read()
s = s.replace("vendor/lineage/config/common_full_phone.mk", "vendor/infinity/config/common_full_phone.mk")
if "INFINITY_MAINTAINER" not in s:
    s += '''
# Infinity X
INFINITY_MAINTAINER := "umutcagand"
TARGET_HAS_UDFPS := false
WITH_GAPPS := true

PRODUCT_SYSTEM_PROPERTIES += \\
    ro.product.marketname=Galaxy M20 \\
    ro.infinity.soc=Exynos 7904 \\
    ro.infinity.camera=13MP + 5MP
'''
open(p, "w").write(s)
