#Función que crea una lista con cada palabra de una linea de texto como elemento de la lista
#Recibe un string
#retorna una lista
def separar(txt):
    x = txt.split()
    return ordenar(x)
    

def ordenar(x):
    y = 0
    w = 0;
    w = len(x)
    for w in x:
        if(x[y]==','):
            x.pop(y)
            return ordenar(x)
        else:
            x[y] = x[y].strip("#")
            x[y] = x[y].strip("[")
            x[y] = x[y].strip(",")
            x[y] = x[y].strip("]")
            x[y] = x[y].strip(":")
            x[y] = x[y].replace("0x","")
            w = 0
        y += 1
    return x

#función principal del compilador, ejecutar para realizar la compilación de un archivo txt
#recibe un archivo txt
#retorna una lista con las instrucciones en binario para el microprocesador y crea un archivo con estas
def compilar(filename):
    txt = open(filename,"r")
    txtAux = open(filename,"r")
    largo = len(txtAux.readlines())
    lista = []
    for y in range(largo):
        lista += [separar(txt.readline())]
    return crearInstruccion(lista)

#Función que divide las intrucciones dependiendo de la cantidad de elementos que tenga esta
#Recibe una lista de listas de instrucciones
#Retorna una lista con las instrucciones a ejecutar
def crearInstruccion(lista):
    res = []
    listains = open("listaInstrucciones.txt",'w+')
    for x in range(len(lista)):
        if len(lista[x])==4:
            instr = para4(lista[x])
            listains.write(instr)
            if(lista[x][0] == "str" or lista[x][0] == "strv" or lista[x][0] == "ldr" or lista[x][0] == "ldrv"):
                listains.write('\n')
                listains.write(instr)
                listains.write('\n')
                listains.write(instr)
            listains.write('\n')
        elif len(lista[x])==3:
            res += [para3(lista[x])]
            listains.write(para3(lista[x]))
            listains.write('\n')
        elif len(lista[x]) == 1:
            print("etiqueta")
        else:
            res += [para2(lista[x],lista)]
            listains.write(para2(lista[x],lista))
            listains.write('\n')
    return res

#Función que recibe una lista de 4 elementos y arma la instrucción de esta en binario
#Recibe lista de un tamaño de 4
#Retorna una instrucción en binario para el microprocesador
def para4(lista):
    res = ""
    regDest = ""
    reg1 = ""
    reg2 = ""
    binario = '0'
    for x in range(len(lista)):
        if lista[x] == "add":
            vector = "0"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "0"
            U = "1"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "addv":
            vector = "1"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "0"
            U = "1"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "sub":
            vector = "0"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "0"
            U = "0"
            B = "1"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "subs":
            vector = "0"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "0"
            U = "0"
            B = "1"
            W = "0"
            L = "1"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "subv":
            vector = "1"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "0"
            U = "1"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "mul":
            vector = "0"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "1"
            U = "0"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "mulv":
            vector = "1"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "1"
            U = "0"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "div":
            vector = "0"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "1"
            U = "0"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "divv":
            vector = "1"
            cond = "0"
            op = "00"
            I = str(inmediato(lista))
            P = "1"
            U = "1"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "str":
            func = True
            vector = "0"
            cond = "0"
            op = "01"
            I = str(int(not(inmediato(lista))))
            P = "1"
            U = "0"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "strv":
            func = True
            vector = "1"
            cond = "0"
            op = "01"
            I = str(int(not(inmediato(lista))))
            P = "1"
            U = "0"
            B = "0"
            W = "0"
            L = "0"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "ldr":
            func = True
            vector = "0"
            cond = "0"
            op = "01"
            I = str(int(not(inmediato(lista))))
            P = "1"
            U = "1"
            B = "0"
            W = "0"
            L = "1"
            res += vector + cond + op + I + P + U + B + W + L
        elif lista[x] == "ldrv":
            func = True
            vector = "1"
            cond = "0"
            op = "01"
            I = str(int(not(inmediato(lista))))
            P = "1"
            U = "1"
            B = "0"
            W = "0"
            L = "1"
            res += vector + cond + op + I + P + U + B + W + L
        elif(x == 1):
            regDest = registro(lista[x])
        elif (x == 2 and not lista[x].isdigit()):
            reg1 = registro(lista[x])
        elif (x == 3 and not lista[x].isdigit()):
            reg2 = registro(lista[x])
        else:
            num = int(lista[x])
            binario = bin(num)
    if(binario[2:]=='0' or binario[2:] == ""):
        res += reg1 + regDest + completar(reg2)
    else:
        res += reg1 + regDest + reg2 + completar(binario[2:])
    if(len(res)<27):
        res = completarIns(res)
    return res

def registro(val):
    res = ""
    if val == "r0":
        res += "000"
    elif val == "r1":
        res += "001"
    elif val == "r2":
        res += "010"
    elif val == "r3":
        res += "011"
    elif val == "r4":
        res += "100"
    elif val == "r5":
        res += "101"
    elif val == "r6":
        res += "110"
    elif val == "r7":
        res += "111"
    return res

#Función que recibe una lista con la instrucción en lenguaje ensamblador del estilo ["add", "r0", "r1", "10"]
#Retorna 1 si la instrucción trabaja con inmediatos y 0 si no lo hace.
def inmediato(lista):
    for x in range(len(lista)):
        if lista[x].isdigit() and lista[x] != "0":
            return 1
    return 0

#Función que completa un número en binario hasta que sea de un total de 9 digitos
#Recibe un número en binario que tenga menos de 9 dígitos
#Retorna un número en binario con 9 dígitos
def completar(binario):
    if(len(binario) < 11):
        binario = "0" + binario
        return completar(binario)
    else:
        return binario

#Función que recibe una lista de 3 elementos y arma la instrucción de esta en binario
#Recibe lista de un tamaño de 3
#Retorna una instrucción en binario para el microprocesador
def para3(lista):
    res = ""
    for x in range(len(lista)):
        if lista[x] == "mov":
            res += "0011000"
            res += inmediato(lista)
        elif lista[x] == "str":
            res += "0001000"
            res += inmediato(lista)
        elif lista[x] == "ldr":
            res += "0001001"
            res += inmediato(lista)
        elif lista[x] == "cmp":
            res += "0000101"
            res += inmediato(lista)
            res += "1001"
        elif lista[x] == "r0":
            res += "0000"
        elif lista[x] == "r1":
            res += "0001"
        elif lista[x] == "r2":
            res += "0010"
        elif lista[x] == "r3":
            res += "0011"
        elif lista[x] == "r4":
            res += "0100"
        elif lista[x] == "r5":
            res += "0101"
        elif lista[x] == "r6":
            res += "0110"
        elif lista[x] == "r7":
            res += "0111"
        elif lista[x] == "r8":
            res += "1000"
        elif lista[x] == "r9":
            res += "1001"
        elif lista[x] == "r10":
            res += "1010"
        elif lista[x] == "r11":
            res += "1011"
        elif lista[x] == "r12":
            res += "1100"
        elif lista[x] == "r13":
            res += "1101"
        elif lista[x] == "r14":
            res += "1110"
        elif lista[x] == "r15":
            res += "1111"
        else:
            num = int(lista[x])
            binario = bin(num)
            completo = completar(binario[2:])
            res += "0000"
            res += completar(binario[2:])
    if(len(res)<27):
        res = completarIns(res)
    return res

#Completa un número en binario hasta un total de 25 dígitos
#Recibe un número en binario igual o menor a 25
#Retorna un número en binario con 25 dígitos en total
def completarIns(res):
    if(len(res)<27):
        return(completarIns(res+"0"))
    else:
        return res

#Función que recibe una lista de 2 elementos y arma la instrucción de esta en binario
#Recibe lista de un tamaño de 2
#Retorna una instrucción en binario para el microprocesador
def para2(instruccion,listaInstrucciones):
    res = ""
    if(instruccion[0] == "bge"):
        vector = "0"
        cond = "1"
        op = "10"
        I = "1"
        P = "0"
        U = "0"
        B = "0"
        W = "0"
        L = "0"
        res += vector + cond + op + I + P + U + B + W + L
        offset = buscarPC([instruccion[1]],listaInstrucciones);
        PC8 = buscarPC(instruccion,listaInstrucciones) + 8;
        offset = (offset - PC8) >> 2
        offset = completar2(bin(offset)[2:])
        res += offset
    elif(instruccion[0] == "BEQ"):
        res += "11100011111"
    elif(instruccion[0] == "BLT"):
        res += "111100011111"
        res += buscar(instruccion[1],listaInstrucciones)
    else:
        res += "001100011111"
        res += buscar(instruccion[1],listaInstrucciones)
    if(len(res)<27):
        res = completarIns(res)
    return res

def buscarPC(pcInst, lista):
    for x in range(len(lista)):
        if(pcInst == lista[x]):
            print(x*4)
            return x*4
        

#Función que busca una palabra en una lista con listas de instrucciónes
#Recibe una palabra y una lista de listas de instrucciones
#Retorna la ubicación de la palabra para en la lista suponiendo que cada instrucción sea igual a 4 espacios de memoria(esto es para el PC)
def buscar(palabra, lista):
    for x in range(len(lista)):
        if(palabra == lista[x][0]):
            res = (x*4)-1
            res = bin(res)
            res = completar2(res[2:])
            return res

#Función que completa un número en binario para que tenga un total de 13 dígitos
#Recibe un número en binario menor o igual a 13
#Retorna un número en binario de 13 dígitos.
def completar2(binario):
    if(len(binario) < 17):
        binario = "0" + binario
        return completar2(binario)
    else:
        return binario
