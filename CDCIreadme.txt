0) se asume que tienes acceso al pom.xml que yo use y el resto de los archivos de meta datos
   se asume que la dependencia de junit usada es junit 4.8.2
	<dependency>
	  <groupId>junit</groupId>     <!-- NOT org.junit here -->
	  <artifactId>junit-dep</artifactId>
	  <version>4.8.2</version>
	  <scope>test</scope>
	</dependency>

1) Git
	1.1) supondremos que el nombre del repositorio de github es superRepo
	1.2) supondremos que es publico
	1.3) supondremos que tiene licencia MIT
2) Travis ci
	2.1) ve a la web de travis-ci y conectate con tu usuario de github
	2.2) dale acceso a travis a superRepo
	2.3) ahora debemos agregar al repositorio un archivo que travis utiliza para leer instrucciones, .travis.yml
		agrega al archivo las siguientes lineas 
			#we use java
			language: java	

			#we add the java development kit (jdk)
			jdk:
			- openjdk8
	2.4) ahora ve a travis busca el superRepo en travis y dale click, en la vista vas a ver una medella que dice build passing o failed o error 
		pero deberia decir passing si buildeo correctamente, dale click a la medalla para copiar y pegar un link en formato markdown 
		que agregaras al README.md del repo para poder ver la medalla desde el readme en tiempo real
	2.5) a partir de este momento cada vez que pusheas algo a master (puedes configurar a que ramas despues en travis),
	  	se hara un build, haz push para guardar todos los cambios que hicimos en este paso
		en la nube por travis y te llegara un correo si falla, la medalla estara actualizada para darte esta informacion y en travis
		habra un log para ayudarte a decir que paso. Travis tambien ejecutara las prueba de junit y reportara error si alguna falla
3) codecov, esto ayudara a saber cuanto codigo cubren las pruebas unitarias, solo se realizara si el build es exitoso

	3.1) agreguemos lo siguiente al pom.xml, es un plugin que ayuda a travis a generar los archivos que codecov necesitara 
			<plugin>
				<groupId>org.jacoco</groupId>
				<artifactId>jacoco-maven-plugin</artifactId>
				<version>0.7.7.201606060606</version>
				<executions>
					<execution>
						<goals>
							<goal>prepare-agent</goal>
						</goals>
					</execution>
					<execution>
						<id>report</id>
						<phase>test</phase>
						<goals>
							<goal>report</goal>
						</goals>
					</execution>
				</executions>
			</plugin> 
	3.2) loggeate en codecov con tu usuario de github
	3.3) agrega el superRepo a codeCov
	3.4) copia el token que te muestra codecov en tu repo y guardalo en travis como una variable de entorno CODECOV_TOKEN para tu superRepo
	3.5) editaremos .travis.yml ahora para que se vea asi 
		#we use java
		language: java

		#we add the java development kit (jdk)
		jdk:
		- openjdk8

		before_install:
		- mvn clean

		after_success:
		- bash <(curl -s https://codecov.io/bash)
	3.6) finalmente en codecov obtenemos la medella markdown y la agregamos al readme
		la medalla se ve mas o menos asi [![codecov](https://codecov.io/gh/JeanPaulYazbek/TestCiCd/branch/master/graph/badge.svg)](https://codecov.io/gh/JeanPaulYazbek/TestCiCd)
	3.7) ahora hacemos push y deberiamos tener la medalla de codecov actualizada, dira 0% si no hay tests relevantes

4) Heroku

	4.1) Loggeate en heroku y crea una app digamos que se llama superApp
	4.2) depsues de crearla selecciona Connect to github, marca las opciones Wait for CI to pass before deploy y
		la opcion Enable Automatic Deploys
	4.3) ve a account settings y copia API KEY, luego en travis agrega la variable de entorno HEROKU_API_KEY con esa API_KEY para superRepo
	4.4) agregar la siguiente property al pom 
		<full-artifact-name>target/${project.artifactId}.war</full-artifact-name>
	4.5) agregar el siguiente plugin  (IMPORTANTE: pon el appName adecuado)
			
			<plugin>
				<groupId>com.heroku.sdk</groupId>
			        <artifactId>heroku-maven-plugin</artifactId>
			      	<version>2.0.11</version>
		      			<configuration>
		       			 <appName>superApp</appName>
		        		<processTypes>
		          	<web>java $JAVA_OPTS -jar webapp-runner.jar -Dserver.port=$PORT ${full-artifact-name}</web>
		        	</processTypes>
			      </configuration>
      			</plugin> 
	4.6) correr el siguiente comando en  heroku cli 
		heroku buildpacks:set heroku/jvm --app superApp
	4.7) montar la base de datos en la base de datos como se muestra en HerokuBuildreadme
	4.8) agregar el siguiente comando en .travis.yml debajo de - bash <(curl -s https://codecov.io/bash)
		- mvn heroku:deploy-war
	4.9) modifica el siguiente script sqlHerokuChanges.sh  debe estar en la misma carpeta que src, en las dos 
		siguientes lineas poner el usuario y password de la base de datos de heroku
			HEROKU_USER=zmywvjjdgdblxr
			HEROKU_DB_PASSWORD=427841cddb5db15c51d65ecd9f777edd8d8038abd360cb251a94e28f4ee6bb00
	4.10) haz push de todos estos cambios y a partir de ahora el deploy a heroku deberia estar completo
