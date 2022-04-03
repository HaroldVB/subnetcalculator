# Calculate your subnets
# Written by Lukas van Berkom

# Inputs
ipaddress = input("Wat is het IP?\n")
hosts = int(input("Hoeveel hosts heb je?\n"))
startsub = int(input("Waar start het subnet?\n"))

octets = ipaddress.split(".")
octet1 = octets[0]
octet2 = octets[1]
octet3 = octets[2]
usableip = f"{octet1}.{octet2}.{octet3}."

# Subnet ranges
r30 = range(1, 4)
r29 = range(4, 7)
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
    print(f"{usableip + str(startsub)} tot en met {usableip + str(subend)}")
    print("Het subnet mask is 255.255.255.252")
elif hosts in r29:
    print("Subnet /29")
    subend = startsub + 7
    print(f"{usableip + str(startsub)} tot en met {usableip + str(subend)}")
    print("Het subnet mask is 255.255.255.248")
elif hosts in r28:
    print("Subnet 28")
    subend = startsub + 15
    print(f"{usableip + str(startsub)} tot en met {usableip + str(subend)}")
    print("Het subnet mask is 255.255.255.240")
elif hosts in r27:
    print("Subnet 27")
    subend = startsub + 31
    print(f"{usableip + str(startsub)} tot en met {usableip + str(subend)}")
    print("Het subnet mask is 255.255.255.224")
elif hosts in r26:
    print("Subnet 26")
    subend = startsub + 63
    print(f"{usableip + str(startsub)} tot en met {usableip + str(subend)}")
    print("Het subnet mask is 255.255.255.192")
elif hosts in r25:
    print("Subnet 25")
    subend = startsub + 127
    print(f"{usableip + str(startsub)} tot en met {usableip + str(subend)}")
    print("Het subnet mask is 255.255.255.128")
elif hosts in r24:
    print("Subnet 24")
    subend = startsub + 255
    print(f"{usableip + str(startsub)} tot en met {usableip + str(subend)}")
    print("Het subnet mask is 255.255.255.0")
else:
    print("Het is geen klasse C adres")
