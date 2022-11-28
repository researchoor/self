import sys
from PIL import Image

pix = sys.argv[1]
im = Image.open(pix, 'r')
width, height = im.size
pixels = im.load()
print(width, height)
file_name = f"{'.'.join(pix.split('.')[:-1])}.svg"

def convert(name):
    with open(name, 'w') as f:
        f.write(f"<svg xmlns='http://www.w3.org/2000/svg' viewbox='0 0 {width} {height}'>\n")
        for i in range(width):
            for j in range(height):
                print(pixels[i, j], i, j)
                if pixels[i, j] == (0, 0, 0, 255):
                    f.write(f"<rect width='1' height='1' x='{i}' y='{j}'></rect>\n")
                elif pixels[i, j] != (153, 204, 204):
                    f.write(f"<rect width='1' height='1' x='{i}' y='{j}' fill='rgb{pixels[i, j]}'></rect>\n")
        f.write(f"</svg>")

convert(file_name)
