from PIL import Image
import os

# 输入和输出文件路径
input_path = "main/manager-web/src/assets/login/login-person.png"
output_path = "main/manager-web/src/assets/login/login-person-small.png"

# 检查输入文件是否存在
if not os.path.exists(input_path):
    print(f"未找到源图片: {input_path}")
    exit(1)

# 打开原始图片
with Image.open(input_path) as img:
    # 计算新尺寸
    new_size = (img.width // 5, img.height // 5)
    # 缩放图片，保持透明通道
    img_small = img.resize(new_size, Image.LANCZOS)
    # 确保是RGBA模式（带透明通道）
    if img_small.mode != "RGBA":
        img_small = img_small.convert("RGBA")
    # 保存为PNG，保持透明
    img_small.save(output_path, "PNG")

print(f"已生成缩小版图片：{output_path}")
