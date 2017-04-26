include device/qcom/msm8916-common/BoardConfigCommon.mk

include device/xiaomi/ferrari/board/*.mk

TARGET_BOARD_INFO_FILE := device/xiaomi/ferrari/board-info.txt

# inherit from the proprietary version
-include vendor/xiaomi/ferrari/BoardConfigVendor.mk
