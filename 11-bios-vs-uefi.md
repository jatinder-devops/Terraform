# BIOS vs UEFI

## Introduction
BIOS and UEFI are firmware interfaces that initialize hardware and start the operating-system boot process.

## Definition
BIOS is the legacy PC firmware interface; UEFI is a newer standardized firmware interface with capabilities such as Secure Boot and support for modern boot configurations.

## How It Works
Firmware initializes devices and selects a boot option. The bootloader then loads the operating system. UEFI commonly launches EFI applications from an EFI System Partition; legacy BIOS systems commonly use a different boot path.

## Important Components
- **Firmware:** Low-level software that initializes hardware.
- **Boot order:** The order in which boot options are tried.
- **UEFI:** Modern firmware interface.
- **Secure Boot:** A feature that verifies signed boot components according to configured trust.
- **GPT/MBR:** Partition table formats commonly associated with modern UEFI and legacy setups, respectively.

## Real-World Example
When a physical server fails to find a boot device, firmware boot order, disk visibility, and bootloader configuration are among the items to investigate.

## Why DevOps Engineers Need This
These concepts matter for physical server provisioning, OS installation, recovery, and diagnosing boot failures. Cloud VMs may abstract firmware settings.

## Diagram
```mermaid
flowchart LR
 A[Power on] --> B[Firmware: BIOS or UEFI]
 B --> C[Select boot device]
 C --> D[Bootloader]
 D --> E[Operating system]
```

## Linux Commands and Examples
### `test -d /sys/firmware/efi && echo UEFI || echo 'UEFI not detected'`
Check whether the running Linux environment exposes UEFI boot variables.

```bash
test -d /sys/firmware/efi && echo UEFI || echo 'UEFI not detected'
```

### `lsblk -f`
Inspect block devices and filesystems.

```bash
lsblk -f
```

Some commands may not be installed in a minimal environment. Output and available options vary by distribution and machine.

## Troubleshooting Scenarios
If Linux does not boot, use the machine or provider console to inspect firmware boot order and available disks. The Linux check may report UEFI as not detected inside a VM or restricted environment, so interpret it cautiously.

## Hands-On Lab
Run the UEFI detection command on Ubuntu and record the result. Explain why the result may differ on a laptop and a cloud VM.

## Interview Questions and Answers
### 1. What does firmware do?
It initializes hardware and begins the boot process.

### 2. What is UEFI?
A modern firmware interface used to initialize and boot systems.

### 3. What is Secure Boot intended to do?
Verify boot components against configured trust policies.

### 4. What is boot order?
The sequence in which firmware tries boot options.

### 5. Does `/sys/firmware/efi` always exist?
No; it may be absent when Linux was booted in legacy mode or when the environment does not expose UEFI details.

## Practice Assignment
Compare BIOS and UEFI in a table covering boot flow, modern features, and situations where an administrator may need to inspect them.

## Key Takeaways
- BIOS and UEFI are firmware interfaces that initialize hardware and start the operating-system boot process.
- Understand the components and how to inspect them safely.
- Gather evidence before making changes.
- Connect this concept to production reliability and security.

## Further Learning
Boot process, partitions, filesystems, server recovery.
