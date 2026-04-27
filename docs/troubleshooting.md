# 🛠️ Troubleshooting Guide

## 🔍 Symptoms
- NCCL hangs
- Training stalls

## 🔎 Check Kernel
cat /proc/cmdline

Expected:
amd_iommu=on iommu=pt

## ❗ Common Issues
- No reboot
- GRUB not updated

## 🧠 Debug
nvidia-smi topo -m
numactl --hardware

## ✅ Checklist
- iommu=pt active
- NCCL stable
