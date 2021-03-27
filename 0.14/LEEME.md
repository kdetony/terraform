LEEME
====

1. En el servidor DO crear llaves ssh
2. En el panel de DO Crear el Token de acceso
2. Crear en el panel de DO la llave SSH y copiar la publica
3. Ejecutar: 

> terraform apply -var "do_token=XXXX" -var "pvt_key=/root/.ssh/id_rsa"
