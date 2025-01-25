
val normal_years : int list = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
val leap_years : int list = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
val years : int list = [1901, 1902, 1903, 1904, 1905, 1906, 1907, 1908, 1909, 1910, 1911, 1912, 1913, 1914, 1915, 1916, 1917, 1918, 1919, 1920, 1921, 1922, 1923, 1924, 1925, 1926, 1927, 1928, 1929, 1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939, 1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000]

fun verifica_ano years =
    (years mod 4 = 0 andalso years mod 100 <> 0) orelse (years mod 400 = 0)
val d_s = 2

fun conta_dom [] _ domingos = domingos
    | conta_dom (dias:: meses) d_s domingos =
    let 
        val novo_ds = (d_s + dias) mod 7
        val quant_dom = if d_s = 0 then domingos + 1 else domingos
    in
        conta_dom meses novo_ds quant_dom
    end

fun junta_tudo [] d_s domingos = domingos
    | junta_tudo (ano::years) d_s domingos =
        let 
            val meses = if verifica_ano ano then leap_years else normal_years
            val quant_dom = conta_dom meses d_s domingos
            val novo_ds = foldl (fn(dias, acc) => (acc + dias) mod 7) d_s meses
        in 
            junta_tudo years novo_ds quant_dom
        end

val ans = junta_tudo years 2 0

