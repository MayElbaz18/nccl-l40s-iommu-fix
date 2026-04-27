# 🛠️ Scripts Usage Guide

This directory contains helper scripts to **apply**, **verify**, and **test** the NCCL IOMMU fix.

---

## 📦 Available Scripts

| Script                | Description |
|---------------------|------------|
| `apply_fix.sh`      | Applies the IOMMU passthrough fix |
| `verify_config.sh`  | Verifies kernel configuration |
| `run_nccl_test.sh`  | Runs NCCL stress test |

---

## 🚀 1. Apply the Fix

### Preview (Safe Dry Run)

```bash
./apply_fix.sh --dry-run
```
## ⚠️ Reboot Required

## 🔍 2. Verify Configuration

### After reboot:

```bash
./verify_config.sh
```

#### Expected output:
```
✅ IOMMU passthrough is enabled
```

### Manual Verification:

```bash
cat /proc/cmdline
```

#### Expected output:
```
amd_iommu=on iommu=pt
```

## 🧪 3. Run NCCL Test

```bash
./run_nccl_test.sh
```

This runs a stress test using:

- NCCL Ring algorithm
- Peer-to-peer communication
- Large message sizes

## 📌 Notes
- apply_fix.sh requires root privileges
- --dry-run mode is safe for validation
- Always verify using /proc/cmdline (not just GRUB)