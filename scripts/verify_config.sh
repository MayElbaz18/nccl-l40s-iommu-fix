#!/bin/bash

echo "Checking kernel parameters..."

CMDLINE=$(cat /proc/cmdline)

echo "$CMDLINE" > /dev/null

if [[ "$CMDLINE" == *"amd_iommu=on"* && "$CMDLINE" == *"iommu=pt"* ]]; then
    echo "✅ IOMMU passthrough is enabled"
else
    echo "❌ IOMMU passthrough NOT enabled"
fi
