KAFKA=/opt/software/kafka_2.11-0.9.0.0
$KAFKA/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
