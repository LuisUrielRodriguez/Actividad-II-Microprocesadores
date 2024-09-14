    	ORG 0000h           ; Dirección de inicio del programa
    	ld B,50
        ld   c, 0          ; Inicializamos C en 0, que será el resultado final .
        ld   a, 0          ; Inicializamos A en 0, que usaremos para el cálculo temporal.
        ld   d, 0          ; D se usará para almacenar el cuadrado temporal.
        
calcular_raiz:
        ld   a, c          ; Cargamos el valor actual de C en A .
        ld   d, a          ; Guardamos A en D para calcular el cuadrado.
        ld   e, a          ; Copiamos A en E.
        ld   a, 0          ; A = 0, para acumular el resultado del cuadrado.

multiplicar:
        add  a, e          ; Suma el valor de prueba (E) a A (multiplicación: C * C).
        dec  d             ; Decrementamos D (bucle de multiplicación).
        jr   nz, multiplicar ; Repetimos hasta que D llegue a 0 (multiplicación completa).

        cp   b             ; Comparamos el cuadrado calculado (A) con el valor en B.
        jr   z, fin        ; Si son iguales, hemos encontrado la raíz cuadrada exacta.
        jr   nc, siguiente ; Si el cuadrado es menor o igual que B, probamos el siguiente valor.

        dec  c             ; Si el cuadrado fue mayor que B, retrocedemos C.
        jr   fin           ; Terminamos el cálculo.

siguiente:
        inc  c             ; Incrementamos C para probar con el siguiente valor.
        jr   calcular_raiz  ; Repetimos el proceso.

fin:
        halt               ; Fin del programa, C contiene la raíz cuadrada entera.
