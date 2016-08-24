docker run -d --name nexus-data sonatype/nexus echo "data-only container for Nexus"
docker run -d -p 3333:8081 --name nexus --volumes-from nexus-data sonatype/nexus
