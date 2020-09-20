HEROKU_USER=zmywvjjdgdblxr
HEROKU_DB_PASSWORD=427841cddb5db15c51d65ecd9f777edd8d8038abd360cb251a94e28f4ee6bb00
JDBCPROP=src/main/webapp/WEB-INF/jdbc.properties
HIBERNATEXML=src/main/resources/hibernate.cfg.xml

# Modify enitty xmls
for i in src/main/resources/com/howtodoinjava/entity/*.xml; do
	sed -i "s/schema=\".*\"/schema=\"${HEROKU_USER}\"/g" $i
done


# Modify jdbc.properties
printf 'jdbc.driverClassName=org.postgresql.Driver 
jdbc.dialect=org.hibernate.dialect.PostgreSQLDialect 
jdbc.databaseurl=${JDBC_DATABASE_URL} \n' > ${JDBCPROP}

printf "jdbc.username=${HEROKU_USER} \n\
jdbc.password=${HEROKU_DB_PASSWORD} \n" >> ${JDBCPROP}



# Modify hibernate.cfg.xml 
sed -i 's/<property name="hibernate.connection.url">.*<\/property>/<property name="hibernate.connection.url">${JDBC_DATABASE_URL}<\/property>/' ${HIBERNATEXML}
sed -i "s/<property name=\"hibernate.connection.username\">.*<\/property>/<property name=\"hibernate.connection.username\">${HEROKU_USER}<\/property>/" ${HIBERNATEXML}
sed -i "s/<property name=\"hibernate.connection.password\">.*<\/property>/<property name=\"hibernate.connection.password\">${HEROKU_DB_PASSWORD}<\/property>/" ${HIBERNATEXML}

echo "CONFIRMING"
echo "jDBC: "
cat src/main/webapp/WEB-INF/jdbc.properties
echo "HIBERNATE: "
cat src/main/resources/hibernate.cfg.xml
