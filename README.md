Sígname
=======

Herramienta para facilitar la adaptación de contenido web a lengua de signos, permitiendo
a las personas sordas solicitar la interpretación del contenido bajo demanda.


Demo
----
* Sígname: http://signame.unoycero.com
* Página web de ejemplo con Sígname integrado: http://aytometropolis.wordpress.com/


Integración
-----------
Uno de los objetivos de Sígname era facilitar la integración en páginas web, sin usar iframes. 
El icono aparece por defecto en gris, y cambia a naranja una vez que la página ha sido signada:
```html
<a target="_blank" href="http://signame.unoycero.com">
<img src="http://signame.unoycero.com/semaforo">
</a>
```

Instalación
-----------
* Requerimientos: Ruby 1.9, rubygems, bundler
* Instalación de gemas: `bundle install`
* Ejecutar migraciones: `rake db:migrate`
* Lanzar la aplicación: `rails s`
* Visita http://localhost:3000
