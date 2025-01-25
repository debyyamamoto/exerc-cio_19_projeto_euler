normal_years = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
leap_years = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
years = list(range(1901,2001))

#dia_da_semana = 1
# for dias in normal_years:
#     dia_da_semana = (dia_da_semana + dias) % 7
# print(dia_da_semana)
d_s = 2
domingos = 0
for anos in years:
    if ((anos % 4 == 0 and anos % 100 != 0) or (anos % 400 == 0)):
        meses = leap_years
    else: 
        meses = normal_years
    
    for dias in meses:
        if (d_s == 0):
            domingos += 1
        d_s = (d_s + dias) % 7
print(domingos)