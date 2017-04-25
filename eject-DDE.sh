#!/bin/bash
udisksctl unmount -b /dev/sdb1
udisksctl power-off -b /dev/sdb1
