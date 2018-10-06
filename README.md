# twitter-analysis
Personal Tweet Analysis

Based on: https://realpython.com/twitter-sentiment-python-docker-elasticsearch-kibana/

# Running latest Elastic Search and Kibana 6.4.2

`docker pull docker.elastic.co/elasticsearch/elasticsearch:6.4.2`

`docker pull docker.elastic.co/kibana/kibana:6.4.2`

`sudo docker run                        \
  --name elasticsearch            \
  -p 9200:9200                    \
  -p 9300:9300                    \
  -e "discovery.type=single-node" \
  docker.elastic.co/elasticsearch/elasticsearch:6.4.2`


`sudo docker run                            \
  --name kibana                       \
  -p 5601:5601                        \
  --link elasticsearch:elasticsearch  \
  -e "ELASTICSEARCH_URL=http://elasticsearch:9200" \
  docker.elastic.co/kibana/kibana:6.4.2`
