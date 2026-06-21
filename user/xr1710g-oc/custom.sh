#!/bin/bash
# custom.sh - Custom modifications for XR1710G OC build
# This script runs AFTER patches are applied and BEFORE make defconfig

set -e

echo "=== [custom.sh] Starting custom modifications ==="

# ============================================================
# 1. Replace old luci-app-wifi7 (v1.0) with new luci-app-wifimgr (v3.0)
# ============================================================
echo "=== [custom.sh] Replacing luci-app-wifi7 with luci-app-wifimgr v3.0 ==="

# Remove old luci-app-wifi7
rm -rf package/luci-app-wifi7

# Clone new luci-app-wifimgr v3.0
git clone --depth 1 https://github.com/woziwrt/mt7996-wifi7-manager.git /tmp/wifimgr
cp -r /tmp/wifimgr/* package/luci-app-wifimgr/
rm -rf /tmp/wifimgr

echo "=== [custom.sh] luci-app-wifimgr v3.0 installed ==="

# ============================================================
# 2. Add luci-app-daed (eBPF-based transparent proxy)
# ============================================================
echo "=== [custom.sh] Adding luci-app-daed ==="

git clone --depth 1 https://github.com/QiuSimons/luci-app-daed.git /tmp/daed
cp -r /tmp/daed/daed package/daed
cp -r /tmp/daed/luci-app-daed package/luci-app-daed
cp -r /tmp/daed/patchset package/daed-patchset
rm -rf /tmp/daed

echo "=== [custom.sh] luci-app-daed installed ==="

# ============================================================
# 3. Add Chinese translation for luci-app-wifimgr (if available)
# ============================================================
# Note: luci-app-wifimgr v3.0 does not have Chinese translations yet
# The luci-app-daed already includes zh_Hans translation

echo "=== [custom.sh] Custom modifications complete ==="
