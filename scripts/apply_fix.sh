#!/bin/bash

DRY_RUN=false

# Parse arguments
for arg in "$@"; do
  case $arg in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    *)
      ;;
  esac
done

echo "========================================"
echo " Applying IOMMU Passthrough Fix"
echo "========================================"

if [ "$DRY_RUN" = true ]; then
  echo "🧪 Running in DRY-RUN mode (no changes will be applied)"
fi

# Check root (only required if not dry-run)
if [ "$EUID" -ne 0 ] && [ "$DRY_RUN" = false ]; then
  echo "❌ Please run as root (use sudo)"
  exit 1
fi

CMD="grubby --update-kernel=ALL --args=\"amd_iommu=on iommu=pt\""

echo "----------------------------------------"
echo "Command to execute:"
echo "$CMD"
echo "----------------------------------------"

if [ "$DRY_RUN" = false ]; then
  echo "Applying kernel parameters..."
  eval $CMD
  echo "✅ Kernel parameters updated"
else
  echo "➡️ Dry-run: command not executed"
fi

echo "----------------------------------------"
echo "Verifying IOMMU configuration..."
./verify_config.sh
echo "----------------------------------------"

echo "----------------------------------------"
echo "⚠️ Reboot is required for changes to take effect"
echo "----------------------------------------"

echo "To reboot manually, run:"
echo "sudo reboot"