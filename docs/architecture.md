# 🧠 Architecture Deep Dive

## Overview
This document explains why NCCL hangs can occur on NVIDIA L40S systems and how system architecture plays a critical role in GPU communication.

## 🔌 GPU Interconnect Types

### NVLink (A100 / H100)
- Direct GPU-to-GPU communication
- High bandwidth
- Low latency

### PCIe (L40S)
GPU → PCIe → CPU → PCIe → GPU

## 📊 Architecture Comparison
![NVLink vs PCIe](../images/pro_nvlink_pcie.png)

## 🧨 IOMMU Behavior

### Default Mode
GPU → IOMMU → CPU → IOMMU → GPU

## 🔴 Before Fix
![IOMMU Before](../images/pro_iommu_before.png)

## 🟢 After Fix
GPU → GPU (direct PCIe)

![IOMMU After](../images/pro_iommu_after.png)
