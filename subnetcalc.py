# Calculate your subnets
# Written by Lukas van Berkom

# Inputs
from ast import Return


ipaddress = input("Wat is het IP?\n")
hosts = int(input("Hoeveel hosts heeft het netwerk?\n"))
startsub = int(input("Waar start het subnet?\n"))

octets = ipaddress.split(".")
octet1 = octets[0]
octet2 = octets[1]
octet3 = octets[2]
usableip = f"{octet1}.{octet2}.{octet3}."

# Subnet ranges
r30 = range(0, 3)
r29 = range(3, 7)
r28 = range(8, 15)
r27 = range(16, 31)
r26 = range(31, 63)
r25 = range(63, 127)
r24 = range(128, 256)

# Basis informatie printen
print("\n-------------------------------------------")
print("Deze informatie heb je nodig:")

# Subnets uitrekenen
if hosts in r30:
    print("Subnet /30")
    subend = startsub + 3
    startip = usableip + str(startsub)
    endip = usableip + str(subend)
    print(f"{startip} tot en met {endip}")
    print("Het subnet mask is 255.255.255.252")
elif hosts in r29:
    print("Subnet /29")
    subend = startsub + 7
    startip = usableip + str(startsub)
    endip = usableip + str(subend)    
    print(f"{startip} tot en met {endip}")
    print("Het subnet mask is 255.255.255.248")
elif hosts in r28:
    print("Subnet /28")
    subend = startsub + 15
    startip = usableip + str(startsub)
    endip = usableip + str(subend)    
    print(f"{startip} tot en met {endip}")
    print("Het subnet mask is 255.255.255.240")
elif hosts in r27:
    print("Subnet /27")
    subend = startsub + 31
    startip = usableip + str(startsub)
    endip = usableip + str(subend)    
    print(f"{startip} tot en met {endip}")
    print("Het subnet mask is 255.255.255.224")
elif hosts in r26:
    print("Subnet /26")
    subend = startsub + 63
    startip = usableip + str(startsub)
    endip = usableip + str(subend)    
    print(f"{startip} tot en met {endip}")
    print("Het subnet mask is 255.255.255.192")
elif hosts in r25:
    print("Subnet /25")
    subend = startsub + 127
    startip = usableip + str(startsub)
    endip = usableip + str(subend)    
    print(f"{startip} tot en met {endip}")
    print("Het subnet mask is 255.255.255.128")
elif hosts in r24:
    print("Subnet /24")
    subend = startsub + 255
    startip = usableip + str(startsub)
    endip = usableip + str(subend)    
    print(f"{startip} tot en met {endip}")
    print("Het subnet mask is 255.255.255.0")
else:
    print("Het is geen klasse C adres")

# Loop van informatie voorzien
antwoord = "y"

# Loop voor nieuwe subnets
while antwoord == "y" and subend < 256:
    antwoord = input("Wil je nog een subnet berekenen? y/n\n")
    hosts = int(input("Hoeveel hosts heeft het netwerk?\n"))
    splitocts = endip.split(".")
    endoctet = splitocts[3]
    if hosts in r30:
        substart = int(endoctet) + 1
        subend = int(endoctet) + 4
        startip = usableip + str(substart)
        endip = usableip + str(subend)
        if subend < 256:
            print("Subnet /30")
            print(f"{startip} tot en met {endip}")
            print("Het subnet mask is 255.255.255.252")
        else:
            print("Dit past niet meer binnen het IP plan.")
    elif hosts in r29:
        substart = int(endoctet) + 1
        subend = int(endoctet) + 8
        startip = usableip + str(substart)
        endip = usableip + str(subend)        
        if subend < 256:
            print("Subnet /29")
            print(f"{startip} tot en met {endip}")
            print("Het subnet mask is 255.255.255.248")
        else:
            print("Dit past niet meer binnen het IP plan.")
    elif hosts in r28:
        substart = int(endoctet) + 1
        subend = int(endoctet) + 16
        startip = usableip + str(substart)
        endip = usableip + str(subend)
        if subend < 256:
            print("Subnet /28")
            print(f"{startip} tot en met {endip}")
            print("Het subnet mask is 255.255.255.240")
        else:
            print("Dit past niet meer binnen het IP plan.")
    elif hosts in r27:
        substart = int(endoctet) + 1
        subend = int(endoctet) + 32
        startip = usableip + str(substart)
        endip = usableip + str(subend)
        if subend < 256:
            print("Subnet /27")
            print(f"{startip} tot en met {endip}")
            print("Het subnet mask is 255.255.255.224")
        else:
            print("Dit past niet meer binnen het IP plan.")
    elif hosts in r26:
        substart = int(endoctet) + 1
        subend = int(endoctet) + 64
        startip = usableip + str(substart)
        endip = usableip + str(subend)
        if subend < 256:
            print("Subnet /26")
            print(f"{startip} tot en met {endip}")
            print("Het subnet mask is 255.255.255.192")
        else:
            print("Dit past niet meer binnen het IP plan.")
    elif hosts in r25:
        substart = int(endoctet) + 1
        subend = int(endoctet) + 128
        startip = usableip + str(substart)
        endip = usableip + str(subend)
        if subend < 256:
            print("Subnet /25")
            print(f"{startip} tot en met {endip}")
            print("Het subnet mask is 255.255.255.128")
        else:
            print("Dit past niet meer binnen het IP plan.")
    elif hosts in r24:
        substart = int(endoctet) + 1
        subend = int(endoctet) + 256
        startip = usableip + str(substart)
        endip = usableip + str(subend)
        if subend < 256:
            print("Subnet /24")
            print(f"{startip} tot en met {endip}")
            print("Het subnet mask is 255.255.255.0")
        else:
            print("Dit past niet meer binnen het IP plan.")
