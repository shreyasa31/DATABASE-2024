import math
import os

def create_file():
    home = os.path.expanduser("~")
    file_path = "./spiralpythonresults.txt"

    try:
        # Check if file exists
        if os.path.exists(file_path):
            print("File already exists.")
        else:
            with open(file_path, 'w') as _:
                print(f"File created: {file_path}")

        with open(file_path, 'w') as file:
            R, r, a = 36, 9, 30
            # tommy = 34.02055974231794, -118.28544937244807
            for t in [i * 0.01 for i in range(int(math.pi * 16 / 0.01))]:
                x = (((R + r) * math.cos((r / R) * t) - a * math.cos((1 + r / R) * t)) * 0.0001) + 34.02055974231794
                y = (((R + r) * math.sin((r / R) * t) - a * math.sin((1 + r / R) * t)) * 0.0001) - 118.28544937244807
                val = f"{y},{x}"
                print(val)
                file.write(val + "\n")

    except Exception as e:
        print("An error occurred.")
        print(e)

if __name__ == "__main__":
    create_file()
