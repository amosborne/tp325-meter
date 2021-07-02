SPACING = 16

with open("lookup.h", "w") as writer:
    writer.write("const unsigned int ADC_LOOKUP[] = {")
    index = 0
    while index < 1024:
        writer.write("{}, ".format(index))
        index += SPACING
    writer.write("};\n")

