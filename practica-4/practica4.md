# Práctica 4

## Gemas Y Bundler

### 1. ¿Qué es una gema? ¿Para qué sirve? ¿Qué estructura tienen?

Las gemas de Ruby son paquetes de librerías para Ruby que se instalan en el sistema y quedan listas para ser usadas, con un simple require o con mecanismos que aporta el propio sistema de gemas para Ruby.
---

### 2. ¿Cuáles son las principales diferencias entre el comando gem y Bundler? ¿Hacen lo mismo?

#### bundle install
Instala las gemas especificadas en tu Gemfile. Si esta es la primera vez que ejecuta bundle install (y no existe un Gemfile.lock), Bundler buscará todas las fuentes remotas, resolverá las dependencias e instalará todas las gemas necesarias.

Si existe un Gemfile.lock y no ha actualizado su Gemfile, Bundler buscará todas las fuentes remotas, pero usará las dependencias especificadas en el Gemfile.lock en lugar de resolver las dependencias.

Si existe un Gemfile.lock y ha actualizado su Gemfile, Bundler usará las dependencias en el Gemfile.lock para todas las gemas que no actualizó, pero volverá a resolver las dependencias de las gemas que actualizó .

#### gem install
El comando de instalación instala una gema local o remota en un repositorio de gemas.

Para gemas con ejecutables, Ruby instala un archivo de envoltorio en el directorio ejecutable de forma predeterminada. Esto se puede anular con la opción –no-wrappers. La envoltura le permite elegir entre versiones de gemas alternativas utilizando la versión.
---

### 3. ¿Dónde instalan las gemas los comandos gem y bundle?

https://stackoverflow.com/questions/6162047/difference-between-bundle-and-gem-install

---

### 4. ¿Para qué sirve el comando gem server? ¿Qué información podés obtener al usarlo?

Hay veces en que te gustaría ejecutar tu propio servidor de gemas. Es posible que desee compartir gemas con sus colegas cuando ambos no tienen conectividad a Internet. Es posible que tenga un código privado, interno a su organización, que le gustaría distribuir y administrar como gemas sin que la fuente esté disponible públicamente.

Cuando instalas gemas, se agrega el comando del servidor de gemas a tu sistema. Esta es la forma más rápida de comenzar a alojar gemas. Simplemente ejecute el comando:

>gem server

Esto servirá todas sus gemas instaladas desde tu máquina local en http://localhost:8808. Si visitas esta URL en tu navegador, encontrarás que el comando gem server proporciona un índice de documentación HTML.

Cuando instala nuevas gemas, están disponibles automáticamente a través de gem server.
---

### 5. Investigá un poco sobre Semantic Versioning (o SemVer). ¿Qué finalidad tiene? ¿Cómo se compone una versión? ¿Ante qué situaciones debería cambiarse cada una de sus partes?

manejo de versionado

http://semver.org/

---

### 7. Utilizando el proyecto creado en el punto anterior como referencia, contestá las siguientes preguntas:

#### a. ¿Qué finalidad tiene el archivo Gemfile?

El archivo `Gemfile` es utilizado por Bundler y nos permite definir las dependencias de nuestra aplicación.

#### b. ¿Para qué sirve la directiva source del Gemfile? ¿Cuántas pueden haber en un mismo archivo?

http://bundler.io/gemfile.html

#### c. Acorde a cómo agregaste la gema colorputs, ¿qué versión se instaló de la misma?  Si mañana se publicara la versión 7.3.2, ¿esta se instalaría en tu proyecto? ¿Por qué? ¿Cómo podrías limitar esto y hacer que sólo se instalen releases de la gema en las que no cambie la versión mayor de la misma?

La versión que se instaló en el sistema es la última disponible de la gema. Si se publica una nueva version, esta sería instalada. La forma de evitar esto sería por ejemplo de la siguiente manera:

`gem 'colorputs', '~>0.2'`

#### d. ¿Qué ocurrió la primera vez que ejecutaste prueba.rb? ¿Por qué?

No encontró el archivo de la gema solicitada.

`cannot load such file -- colorputs (LoadError)`

#### e. ¿Qué cambió al ejecutar bundle install?

`bundle install` instaló la gema en el sistema, previamente especificada en el archivo `Gemfile`

#### f. ¿Qué diferencia hay entre bundle install y bundle update?

Definicion de bundle install en la pregunta 2


```
Bundle update

Actualice las gemas especificadas (todas las gemas, si no hay ninguna especificada), ignorando las gemas previamente instaladas especificadas en el archivo gemfile.lock. En general, debe usar [bundle install (1)] [bundle-install] para instalar las mismas gemas y versiones exactas en todas las máquinas.

```


#### g. ¿Qué ocurrió al ejecutar prueba_dos.rb de las distintas formas enunciadas? ¿Por qué? ¿Cómo modificarías el archivo prueba_dos.rb para que funcione correctamente?

* `ruby prueba_dos.rb`: Error debido a que no encuentra la constante `Bundler`.

* `bundle exec ruby prueba_dos.rb`: Funciona debido a que `bundle exec` ejecuta el script en el contexto del bundle actual definido por `Gemfile`.

Para que se pueda ejecutar el script de la primer forma, bastaría con agregar la linea:

`require 'bundler/setup'`

---

## Sinatra

### 1. ¿Qué es Rack? ¿Qué define? ¿Qué requisitos impone?

https://medium.com/whynotio/what-is-rack-in-ruby-7e0615f1d9b6

http://codefol.io/posts/What-is-Rack-A-Primer

---
