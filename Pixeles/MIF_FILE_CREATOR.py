from PIL import Image

file = 'D:\\ArquiII\\Pixeles\\lenna.png'
im = Image.open(file)
##
pix = im.load()
im_size = im.size

im2 = im.convert('RGB').convert('P', palette=Image.ADAPTIVE)
im2.save('D:\\ArquiII\\Pixeles\\8bits.png')


##print(im_size)

def hex_ext(num):
    res = ''
    if(num <=15):
        res += '0'
        res += str('{:x}'.format(num))
    else:
        res += str('{:x}'.format(num))

    return res
    

def archivo(archivo):
    file = archivo
    
    im = Image.open(file)

    pix = im.load()
    size_i = im.size[0]
    size_j = im.size[1]

    rgb=''
    cont = 267
    f = open('D:\\ArquiII\\Pixeles\\RAM.mif','w')
    f.write("DEPTH = 65536;"+"\n")
    f.write("WIDTH = 32;" + "\n")
    f.write("ADDRESS_RADIX = UNS;"+"\n")
    f.write("DATA_RADIX = HEX;"+"\n")
    f.write("CONTENT"+"\n")
    f.write("BEGIN"+"\n")
    
    f.write("[0..265]: 0;\n")
    f.write("266: " + hex_ext(size_i * size_j) + ";\n")
    
    for i in range(0,size_i):
        for j in range(0,size_j):
            
            """
            r = hex_ext(int(pix[i,j][0]))
            g = hex_ext(int(pix[i,j][1]))
            b = hex_ext(int(pix[i,j][2]))
            """
            print(pix[i,j])
            rgb = hex_ext(int(pix[i,j]))

            f.write(str(cont) + " : " + rgb +";" + "\n")

            cont+=1
            rgb = ''

    f.write("[" + str(cont) + "..65535]: 0;")
    f.write("\nEND;")
    f.close()

archivo('D:\\ArquiII\\Pixeles\\8bits.png')



            

            






