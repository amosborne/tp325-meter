GAIN = 6.33

with open("lookup.h", "w") as writer:
    writer.write("#include <stdint.h>\n")
    writer.write("const uint8_t ADC_LOOKUP[] = {")
    dout = 1
    while (dout * GAIN) < (2**8 - 1):
        writer.write("{}, ".format(int(dout * GAIN)))
        dout = dout + 1
    writer.write("};\n")
    writer.write("#define ADC_LOOKUP_SIZE {}\n".format(dout - 1))
