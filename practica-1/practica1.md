# repaso de Git 

### Ejercicios

1. Ejecutá `git` o `git help` en la línea de comandos y mirá los subcomandos que tenés disponibles.
These are common Git commands used in various situations:

```
a working area (see also: git help tutorial)
   clone      Clone a repository into a new directory
   init       Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add        Add file contents to the index
   mv         Move or rename a file, a directory, or a symlink
   reset      Reset current HEAD to the specified state
   rm         Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect     Use binary search to find the commit that introduced a bug
   grep       Print lines matching a pattern
   log        Show commit logs
   show       Show various types of objects
   status     Show the working tree status

grow, mark and tweak your common history
   branch     List, create, or delete branches
   checkout   Switch branches or restore working tree files
   commit     Record changes to the repository
   diff       Show changes between commits, commit and working tree, etc
   merge      Join two or more development histories together
   rebase     Reapply commits on top of another base tip
   tag        Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch      Download objects and refs from another repository
   pull       Fetch from and integrate with another repository or a local branch
   push       Update remote refs along with associated objects
```


2. Ejecutá el comando `git help help`. ¿Cuál fue el resultado?

ejecutar ese comando es lo mismo que hacer `man git`

3. Utilizá el subcomando `help` para conocer qué opción se puede pasar al subcomando `add` para que ignore errores al agregar archivos.
`git add --ignore-errors`

4. ¿Cuáles son los estados posibles en Git para un archivo? ¿Qué significa cada uno?

Git tiene tres estados principales en los que se pueden encontrar tus archivos: confirmado (committed), modificado (modified), y preparado (staged). Confirmado significa que los datos están almacenados de manera segura en tu base de datos local. Modificado significa que has modificado el archivo pero todavía no lo has confirmado a tu base de datos. Preparado significa que has marcado un archivo modificado en su versión actual para que vaya en tu próxima confirmación.

6. ¿Para qué se utilizan los siguientes subcomandos?
    * `init` Crea un repositorio git vacio o inicia uno ya existente.
    * `status` Muestra el estado del arbol de trabajo
    * `log` Gestiona la informacion de los logs
    * `fetch` Descarga objetos y referencias de otro repositorio
    * `merge` Incorpora cambios de las confirmaciones nombradas (desde el momento en que sus historias se desviaron de la rama actual) a la rama actual
    * `pull` Integra cambios con un repositorio o una rama local
    * `commit` Guarda cambios en el repositorio
    * `stash` Cuando queres limpiar el directorio de trabajo pero no queres perder los cambios, guarda los cambios en un directorio temporal c
    * `push` Actualiza e integra los cambios en el repositorio
    * `rm` Borra un archivo del directorio de trabajo
    * `checkout` permite cambiar entre ramas


# Ruby: sintaxis y tipos básicos

### 1. Investigá y probá en un intérprete de Ruby cómo crear objetos de los siguientes tipos básicos usando literales y usando el constructor new (cuando sea posible):

#### Arrays

* `array1 = [12, "hola", 44]`  [12, "hola", 44]
* `array2 = Array.new(4, :simbol)`  [:simbol, :simbol, :simbol, :simbol]
* `array3 = Array.new(4) { Hash.new }`  [{}, {}, {}, {}]
* `array4 = Array({:a => "a", :b => "b"})` [[:a, "a"], [:b, "b"]]

#### Hashes

* `hash = { "pedro" => 44, "juan" => "hola" } => {"pedro"=>44, "juan"=>"hola"}`
* `hash = { pedro: 44, juan: "hola" } => {:pedro=>44, :juan=>"hola"}`

#### Strings

* `string = "esto es un string" => "esto es un string"`
* `string = 'esto es un string' => "esto es un string"`
* `string = String.new("esto es un string") => "esto es un string"`

#### Symbols

* `symbol = :symbol => :symbol`
* `symbol = :"symbol" => :symbol`
* `symbol = "symbol".to_sym => :symbol`

---

### 2. ¿Qué devuelve la siguiente comparación? ¿Por qué?

`'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id`

Devuelve falso debido a que estamos creando dos Strings que por mas de que tienen el mismo contenido, son instancias distintas, que por ende poseen un object id distinto.

---

### 3. Escribí una función llamada reemplazar que reciba un String y que busque y reemplace en el mismo cualquier ocurrencia de { por do\n y cualquier ocurrencia de } por \nend, de modo que convierta los bloques escritos con llaves por bloques multilínea con do y end.

```
def reemplazar(string)
    string.gsub!(/[}]/,"\nend")
    string.gsub!(/[{]/,"do\n")
end
```

---

### 4. Escribí una función que convierta a palabras la hora actual, dividiendo en los siguientes rangos los minutos:

* Si el minuto está entre 0 y 10, debe decir "en punto"
* Si el minuto está entre 11 y 20, debe decir "y cuarto"
* Si el minuto está entre 21 y 34, debe decir "y media"
* Si el minuto está entre 35 y 44, debe decir "menos veinticinco" (de la hora siguiente)
* Si el minuto está entre 45 y 55, debe decir "menos cuarto" (de la hora siguiente)
* Si el minuto está entre 56 y 59, debe decir "casi las" (y la hora siguiente)

```
def hora(time)
    case time.min
        when 0..10
            "son las #{time.hour} en punto"
        when 11..20
            "son las #{time.hour} y cuarto"
        when 21..34
            "son las #{time.hour} y media"
        when 35..44
            "son las #{time.hour + 1} menos veinticinco"
        when 45..55
            "son las #{time.hour + 1} menos cuarto "
        when 56..59
            "casi son #{time.hour + 1}"
        else
            "eso no es una hora vo"
        end
end
```

---

### 5. Escribí una función llamada contar que reciba como parámetro dos string y que retorne la cantidad de veces que aparece el segundo string en el primero, sin importar mayúsculas y minúsculas.

```
def contar(string, buscar)
    string.scan(/(?=#{buscar})/i).count
end
```

---

### 6. Modificá la función anterior para que sólo considere como aparición del segundo string cuando se trate de palabras completas.

```
def contar_palabras universe, target
    universe.scan(/\b#{target}\b/i).size
end
```

---

### 7. Dada una cadena cualquiera, y utilizando los métodos que provee la clase String, realizá las siguientes operaciones sobre el string:

#### Imprimilo con sus caracteres en orden inverso.

`string.reverse`

#### Eliminá los espacios en blanco que contenga.

`string.delete ' '`

#### Convertí cada uno de sus caracteres por su correspondiente valor ASCII.

`string.bytes`

#### Cambiá las vocales por números (a por 4, e por 3, i por 1, o por 0, u por 6).

`string.gsub /[aeiou]/, /[aA]/ => 4, "e" => 3, "E" => 3, "i" => 1, "I" => 1, "o" => 0, "O" => 0, "u" => 6, "U" => 6`

---
### 8. ¿Qué hace el siguiente código?

```
[:upcase, :downcase, :capitalize, :swapcase].map do | meth|
    "TTPS Ruby".send(meth)
end
```
Este código lo que hace es enviar el mensaje map al arreglo de simbolos, lo cual iterará por todos los simbolos creando una nueva coleccion, enviando por cada elemento del arreglo el mensaje send al string "TTPS Ruby", pasando como parámetro el simbolo por el cual se está iterando.El mensaje send lo que hace es enviar el mensaje que se pasa como parámetro. Por ende la salida en este caso sería:

`=> ["TTPS RUBY", "ttps ruby", "Ttps ruby", "ttps rUBY"]`

---

### 9. Escribí una función que dado un arreglo que contenga varios string cualesquiera, retorne un nuevo arreglo donde cada elemento es la longitud del string que se encuentra en la misma posición del arreglo recibido como parámetro.

```
def longitud(array)
    array.map { |x| x.length }
end
```

--- 

### 10. Escribí una función llamada `a_ul` que reciba un Hash y retorne un String con los pares de clave/valor del hash formateados en una lista HTML `<ul>`

```
def a_ul(hash)
    "<ul> \
        #{hash.map do |key, value| "<li>#{key}: #{value}</li>"end} \
    </ul>"
end

```

---

### 11. Escribí una función llamada rot13 que encripte un string recibido como parámetro utilizando el algoritmo ROT13.

```
def rot13(string)
    string.tr("a-zA-Z", "n-za-mN-ZA-M")
end
```
---

### 13. Escribí un script en Ruby que le pida al usuario su nombre y lo utilice para saludarlo imprimiendo en pantalla ¡Hola, "nombre"!.

```
puts "ingrese su nombre: "
name = gets.chomp
puts "¡Hola, #{name}!"
```

---
### 15. Investigá qué métodos provee Ruby para:

#### Conocer la lista de métodos de una clase.

`Class.methods`

#### Conocer la lista de métodos de instancia de una clase.

`Class.instance_methods`

#### Conocer las variables de instancia de una clase.

`object.instance_variables`

#### Obtener la lista de ancestros (superclases) de una clase.

`Class.ancestors`

---

### 16. Escribí una función que encuentre la suma de todos los números naturales múltiplos de 3 ó 5 menores que un número tope que reciba como parámetro.

```
def suma tope
    ((1..tope - 1).select { |num| num % 3 == 0 or num % 5 == 0 }).sum
end
```

---

### 17. Cada nuevo término en la secuencia de Fibonacci es generado sumando los 2 términos anteriores. Los primeros 10 términos son: 1, 1, 2, 3, 5, 8, 13, 21, 34, 55. Considerando los términos en la secuencia de Fibonacci cuyos valores no exceden los 4 millones, encontrá la suma de los términos pares.

```
def fib prev1, prev2, sum, max
    curr = prev1 + prev2
    return sum if curr > max
    sum += curr if curr % 2 == 0
    fib prev2, curr, sum, max
end

def sumEvenFib max
    fib 1, 1, 0, max
end
```