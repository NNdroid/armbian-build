# Armbian (Debian 13) Build for Hinlink H66K & NanoPi R5S

![GitHub Release](https://img.shields.io/github/v/release/NNdroid/armbian-build)
![Build Status](https://img.shields.io/github/actions/workflow/status/NNdroid/armbian-build/build-and-upload-images.yml)
![License](https://img.shields.io/github/license/NNdroid/armbian-build)

**Automated Armbian build system for Rockchip RK3568 based devices.**

This repository utilizes GitHub Actions to automatically compile, package, and release Armbian images for **Hinlink H66K** and **NanoPi R5S**. It is based on the official [Armbian Build Framework](https://github.com/armbian/build).

---

## 🏗 Supported Devices | 支持设备

| Device Model | CPU | Architecture | Status |
| :--- | :--- | :--- | :--- |
| **Hinlink H66K** | RK3568 | arm64 | ✅ Stable |
| **NanoPi R5S** | RK3568 | arm64 | ✅ Stable |

## ✨ Features

* **Automated CI/CD**: Builds are triggered via GitHub Actions, eliminating the need for a local Linux environment.
* **Cross-Compilation**: Automatically handles QEMU & binfmt dependencies for building ARM64 images on x86 runners.
* **Custom Patches**: Includes specific U-Boot and Kernel patches for better hardware compatibility.
* **Auto Release**: compiled images are automatically uploaded to GitHub Releases with version tags (e.g., `v24.5.1-20251212`).

## 🚀 How to Build (GitHub Actions)

You don't need a powerful PC. Let GitHub servers do the work for you.

1.  **Fork** this repository to your own account.
2.  Go to the **Actions** tab in your forked repository.
3.  Select the **Build and Upload Images** workflow.
4.  Click **Run workflow**.
5.  Wait for the build to finish (usually takes 30-60 minutes).
6.  Once completed, go to the **Releases** page to download your image.

## 🛠 Local Build (Optional)

If you prefer to build locally on an Ubuntu machine (Ubuntu 22.04/24.04 recommended):

```bash
# 1. Clone the repository
git clone https://github.com/NNdroid/armbian-build.git
cd armbian-build

# 2. Run the build script (Root privileges required for loop devices)
sudo ./build.sh
